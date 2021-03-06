# App Namespace
# Change `CozyApp` to your app's name
@CozyApp ?= {}
CozyApp.Routers ?= {}
CozyApp.Views ?= {}
CozyApp.Models ?= {}
CozyApp.Collections ?= {}

$ ->
    # Load App Helpers
    require '../lib/app_helpers'

    initializeJQueryExtensions()

    locale = 'en';

    $.ajax 'cozy-locale.json',
        success: (data) ->
            locale = data.locale
            initializeLocale locale
        error: ->
            initializeLocale locale

initializeJQueryExtensions = ->
    $.fn.spin = (opts, color) ->
        presets =
            tiny:
                lines: 8
                length: 1
                width: 1
                radius: 3

            small:
                lines: 8
                length: 1
                width: 2
                radius: 5

            large:
                lines: 10
                length: 8
                width: 4
                radius: 8

        if Spinner
            @each ->
                $this = $(this)
                spinner = $this.data("spinner")
                if spinner?
                    spinner.stop()
                    $this.data "spinner", null
                else if opts isnt false
                    opts = presets[opts] if typeof opts is "string"
                    opts = {} unless opts?
                    opts.color = $this.css 'color'
                    opts.color = color if color
                    console.log opts.color
                    spinner = new Spinner(opts)
                    spinner.spin(this)
                    $this.data "spinner", spinner

        else
            console.log "Spinner class not available."
            null

initializeLocale = (locale) ->
    locales = {}

    try
        locales = require('locales/' + locale)
    catch err
        locales = require('locales/en')

    polyglot = new Polyglot()
    # we give polyglot the data
    polyglot.extend locales
    # handy shortcut
    window.t = polyglot.t.bind(polyglot)

    # Initialize App
    CozyApp.Views.appView = new AppView = require 'views/app_view'
    CozyApp.Views.appView.render()

    # Initialize Backbone History
    Backbone.history.start pushState: yes
