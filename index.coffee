_ = require 'lodash'

predicate = (slug) ->
	return (deviceType) ->
		deviceType.slug == slug or _.includes(deviceType.aliases, slug)

exports.findBySlug = findBySlug = (deviceTypes, slug) ->
	_.find(deviceTypes, predicate(slug))

exports.normalizeDeviceType = (deviceTypes, slug) ->
	# returns `undefined` in case of invalid slug
	findBySlug(deviceTypes, slug)?.slug

exports.buildManifest = require './build'
