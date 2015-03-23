fs = require 'fs'
path = require 'path'
_ = require 'lodash'

SHARED_INSTRUCTIONS_STEPS =
	CONNECT: 'Connect your device to the internet.'
	CONNECT_AND_BOOT: 'Connect your device to the internet, then boot it up.'
	BURN_IMAGE: '''
		Use <code>dd</code> or <code>Pi Filler</code> software to burn the .img to your SD card.<br>
		<strong>Warning!</strong>&nbsp;This step is dangerous. You can see a full description of this process
		<a href="<%= GETTING_STARTED_LINK %>">here</a>.
	'''
	EJECT: 'Safely eject the freshly burnt SD card and insert into the <%= TYPE_NAME %>.'

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
	typeDefinition.instructions = _.map typeDefinition.instructions, (line) ->
		line = SHARED_INSTRUCTIONS_STEPS[line] ? line
		template = compileTemplate(line)
		return template
			GETTING_STARTED_LINK: typeDefinition.gettingStartedLink
			TYPE_NAME: typeDefinition.name
			TYPE_SLUG: typeDefinition.slug

	typeDefinition.state = typeDefinition.state.toUpperCase()

	if typeDefinition.state isnt 'RELEASED'
		typeDefinition.name += " (#{typeDefinition.state})"

	return typeDefinition

fs.writeFileSync('device-types.json', JSON.stringify(deviceTypes, null, '\t'))