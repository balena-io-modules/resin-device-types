fs = require 'fs'
path = require 'path'
_ = require 'lodash'

sharedInstructionsSteps = require('./common').instructions

compileTemplate = _.memoize(_.template)

deviceTypes = fs.readdirSync(path.join(__dirname, 'device-types'))
.map (filename) ->
	slug = path.basename(filename, path.extname(filename))
	typeDefinition = require("./device-types/#{slug}")
	return _.extend({ slug }, typeDefinition)
.filter (typeDefinition) ->
	requiredFields = [ 'state', 'yocto.deployArtifact', 'yocto.machine' ]
	for field in requiredFields
		if not _.has(typeDefinition, field)
			console.warn("Ignored #{typeDefinition.slug}: `#{field}` is not set")
			return false
	return true
.map (typeDefinition) ->
	processInstructionsArray = (instructions, os) ->
		gettingStartedLink = os and typeDefinition.gettingStartedLink?[os] or typeDefinition.gettingStartedLink
		context = _.extend {}, sharedInstructionsSteps,
			GETTING_STARTED_LINK: gettingStartedLink
			TYPE_NAME: typeDefinition.name
			TYPE_SLUG: typeDefinition.slug

		return _.map instructions, (line) ->
			line = sharedInstructionsSteps[line] ? line
			template = compileTemplate(line)
			return template(context)

	typeDefinition.instructions = if _.isArray(typeDefinition.instructions)
		processInstructionsArray(typeDefinition.instructions)
	else
		# handle os-specific instructions objects
		_.mapValues(typeDefinition.instructions, processInstructionsArray)

	typeDefinition.state = typeDefinition.state.toUpperCase()

	if typeDefinition.state isnt 'RELEASED'
		typeDefinition.name += " (#{typeDefinition.state})"

	return typeDefinition

fs.writeFileSync('device-types.json', JSON.stringify(deviceTypes, null, '\t'))
