# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# Corrige a rotação no iPad
((doc) ->
  fix = ->
    meta.content = "width=device-width,minimum-scale=" + scales[0] + ",maximum-scale=" + scales[1]
    doc.removeEventListener type, fix, true
  addEvent = "addEventListener"
  type = "gesturestart"
  qsa = "querySelectorAll"
  scales = [ 1, 1 ]
  meta = (if qsa of doc then doc[qsa]("meta[name=viewport]") else [])
  if (meta = meta[meta.length - 1]) and addEvent of doc
    fix()
    scales = [ .25, 1.6 ]
    doc[addEvent] type, fix, true
) document