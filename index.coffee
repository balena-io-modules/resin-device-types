_ = require 'lodash'
exports.deviceTypes = deviceTypes = require './device-types.json'

predicate = (slug) ->
	return (deviceType) ->
		deviceType.slug == slug or _.contains(deviceType.aliases, slug)

exports.findBySlug = findBySlug = (slug) ->
	_.find(deviceTypes, predicate(slug))

exports.normalizeDeviceType = (slug) ->
	# returns `undefined` in case of invalid slug
	findBySlug(slug)?.slug
