fs = require 'fs'
path = require 'path'
_ = require 'lodash'

sharedInstructionsSteps = require('./common').instructions
sharedOptions = require('./common').sharedOptions

compileTemplate = _.memoize(_.template)

module.exports = (typeDefinition, slug, options = {}) ->
	typeDefinition = _.extend({ slug }, typeDefinition)

	if not options.partial
		requiredFields = [ 'state', 'yocto.deployArtifact', 'yocto.machine' ]
		for field in requiredFields
			if not _.has(typeDefinition, field)
				throw new Error("Ignored #{typeDefinition.slug}: `#{field}` is not set")

	processInstructionsArray = (instructions, os) ->
		gettingStartedLink = os and typeDefinition.gettingStartedLink?[os] or typeDefinition.gettingStartedLink
		context = _.extend {}, sharedInstructionsSteps,
			GETTING_STARTED_LINK: gettingStartedLink
			TYPE_NAME: typeDefinition.name
			TYPE_SLUG: typeDefinition.slug

		return _.map instructions, (line) ->
			template = compileTemplate(line)
			return template(context)

	if typeDefinition.instructions
		typeDefinition.instructions = if _.isArray(typeDefinition.instructions)
			processInstructionsArray(typeDefinition.instructions)
		else
			# handle os-specific instructions objects
			_.mapValues(typeDefinition.instructions, processInstructionsArray)

	if typeDefinition.stateInstructions?
		for k, v of typeDefinition.stateInstructions
			if _.isArray(v)
				v = processInstructionsArray(v)
			else
				v.instructions = processInstructionsArray(v.instructions)
			typeDefinition.stateInstructions[k] = v

	# process state
	if typeDefinition.state
		typeDefinition.state = typeDefinition.state.toUpperCase()
		if typeDefinition.state isnt 'RELEASED'
			typeDefinition.name += " (#{typeDefinition.state})"

	# process options
	if not options.partial
		typeDefinition.options ?= []
	if typeDefinition.options
		typeDefinition.options = typeDefinition.options.concat(sharedOptions)

	return typeDefinition
