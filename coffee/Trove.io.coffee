# ToDo: implement .blueprint loading
# ToDo: implement .blueprint saving

class TroveIO extends IO
  constructor: (file, callback) ->
    return if super(file)

if typeof module == 'object' then module.exports = TroveIO else window.TroveIO = TroveIO