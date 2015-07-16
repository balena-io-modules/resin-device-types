_ = require 'lodash'
exports.deviceTypes = deviceTypes = require './device-types.json'

predicate = (slug) ->
	return (deviceType) ->
		deviceType.slug == slug or _.contains(deviceType.aliases, slug)

exports.findBySlug = (slug) ->
	_.find(deviceTypes, predicate(slug))
