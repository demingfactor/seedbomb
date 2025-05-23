# frozen_string_literal: true

Calagator.setup do |config|
  # Site name
  config.title = "Seedbomb"

  # Site tagline
  config.tagline = "A Community Calendar"

  # Site URL with trailing slash
  config.url = "https://seedbomb.au/"

  # Email address of administrator that will get exception notifications
  # and requests for assistance from users:
  config.administrator_email = "dev@demingfactor.com"

  # Caching helps when the site gets popular, but delays when events hit the homepage
  # Turn this off when starting out, flip it one when things start to slow down.
  config.cache_enabled = false

  # Enable devise based authentication
  # Calagator won't load any devise config unless it's enabled,
  # allowing you to roll your own authentication instead, if desired.
  # When enabled, users will need to sign up, and be signed in
  # to create / modify events.
  # Also configure 'admin_email', 'admin_username', and 'admin_password' for Calagator
  # to create the initial admin user.
  config.devise_enabled = true
  config.open_registration = false

  # If devise is enabled, the following will configure authorization
  # to CRUD various resources.
  # Valid resources are: changes, events, venues
  # NOTE: Venues can still be created by events, so it's probably best to put them in same category as events.
  #
  # Resources in this category can only be CRUDed by admin users.
  config.admin_resources = %i[changes]
  # Resources in this category can be CRUDed by any authenticated user.
  config.user_resources = %i[events venues]

  # Optional username and password to use when accessing /admin pages
  config.admin_email = "dev@seedbomb.au"
  config.admin_username = "admin"
  config.admin_password = ENV["KOALAGATOR_ADMIN_PASSWORD"]

  # Emoji used as administrator icon
  config.admin_icon = "🐨"

  # Search engine to use for searching events.
  # Values: :sql, :sunspot.
  config.search_engine = :sql

  # Set the iCalendar SEQUENCE, which should be increased each time an event
  # is updated. If an admin needs to forcefully increment the SEQUENCE for all
  # events, they can set this icalendar_sequence_offset value to something
  # greater than 0.
  config.icalendar_sequence_offset = 0

  # Configure a mapping provider
  # Stamen's terrain tiles will be used by default.
  # Map marker color
  # Values: red, darkred, orange, green, darkgreen, blue, purple, darkpuple, cadetblue
  config.mapping_marker_color = "green"

  # A Google Maps API key is required to use Google's geocoding service
  # as well as to display maps using their API.
  # Get one at: https://developers.google.com/maps/documentation/javascript/tutorial#api_key
  #
  # This is sensitive information and should not be stored in version control.
  config.mapping_google_maps_api_key = ENV["GOOGLE_MAPS_API_KEY"]

  # The tile provider to use when rendering maps with Leaflet.
  # One of: leaflet, stamen, mapbox, google
  config.mapping_provider = "leaflet"

  # The tiles to use for the map, see the docs for individual Leaflet plugins.
  config.mapping_tiles = "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"

  # Set tag cloud to work with any tag
  config.tag_cloud_min = 2

  # Other mapping examples:
  #
  # Stamen
  # (available tiles: terrain, toner, watercolor)
  # config.mapping_provider = 'stamen'
  # config.mapping_tiles = 'watercolor'
  #
  # MapBox Streets (use a map from your own account)
  # config.mapping_provider = 'mapbox'
  # config.mapping_tiles = 'examples.map-9ijuk24y'
  #
  # Google Maps
  # config.mapping_provider = 'google'
  # config.mapping_tiles = 'ROADMAP'
  #
  # OpenStreetMap
  # config.mapping_provider = 'leaflet'
  # config.mapping_tiles = 'http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png'
  #
  # Esri
  # (available tiles: Gray, Streets, Oceans, Topographic)
  # config.mapping_provider = 'esri'
  # config.mapping_tiles = 'Gray'

  # Map to display on /venues page:
  config.venues_map_options = {
    # Zoom magnification level:
    zoom: 12

    # Center of the map, in latitude and longitude.
    # If no center is specified, the map will zoom to fit all markers.
    # center: [45.518493, -122.660737]
  }

  # Patterns for detecting spam events and venues
  config.denylist_patterns = [
    /\b(online|overseas).+(drugstore|pharmacy)\b/,
    /\bcialis\b/
  ]
end
