fs = require 'fs'
path = require 'path'
_ = require 'lodash'

sharedInstructionsSteps = require('./device-types/_common').instructions

compileTemplate = _.memoize(_.template)

deviceTypes = fs.readdirSync(path.join(__dirname, 'device-types'))
.map (filename) ->
	slug = path.basename(filename, path.extname(filename))
	typeDefinition = require("./device-types/#{slug}")
	return _.extend({ slug }, typeDefinition)
.filter (typeDefinition) ->
	# don't send types that don't have explicitly defined state
	return !!typeDefinition.state
.map (typeDefinition) ->
	processInstructionsArray = (instructions) ->
		_.map instructions, (line) ->
			line = sharedInstructionsSteps[line] ? line
			template = compileTemplate(line)
			context = _.extend {}, sharedInstructionsSteps,
				GETTING_STARTED_LINK: typeDefinition.gettingStartedLink
				TYPE_NAME: typeDefinition.name
				TYPE_SLUG: typeDefinition.slug
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
