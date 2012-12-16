ViewCollection = require '../lib/view_collection'
FeedView       = require './feed_view'
FeedCollection = require '../collections/feed_collection'

module.exports = class FeedsView extends ViewCollection
    el: '.feeds'

    view: FeedView

    events:
        "click .tag": "onTagClicked"
        "click .tag .icon-reload": "onReloadTagClicked"

    onReloadTagClicked: (evt) ->
        $(evt.currentTarget).parents("div:first").find(".feed").
            show(() -> $(this).click())
        false

    onTagClicked: (evt) ->
        console.log("ok", evt.target)
        $(evt.currentTarget).find(".feed").toggle()
        false

    initialize: ->
        @collection = new FeedCollection @