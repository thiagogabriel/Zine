# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(window).bind "load", ->
  $("#gal").slideViewerPro
    thumbs: 6
    autoslide: false
    typo: true
    galBorderWidth: 0
    thumbsBorderOpacity: 0
    buttonsTextColor: "#707070"
    buttonsWidth: 40
    thumbsActiveBorderOpacity: 0.8
    thumbsActiveBorderColor: "aqua"
    shuffle: true