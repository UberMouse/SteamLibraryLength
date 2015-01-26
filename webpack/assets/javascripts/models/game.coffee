module.exports =
  fromJSON: (json)->
    json.invalid = json.main_length == 0 && json.main_with_extras_length == 0 && json.completionist_length == 0
    json.beaten = json.playtime > json.main_length

    return json
