all = ->
    emit doc.title, doc

Feed.defineRequest "all", all, (err) ->
    if err
        railway.logger.write "Feed All requests, cannot be created"
        railway.logger.write err