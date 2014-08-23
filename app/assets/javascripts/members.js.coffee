# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $("#new_member").on("ajax:success", (e, data, status, xhr) ->
    $("#new_member").append xhr.responseText
  ).on "ajax:error", (e, xhr, status, error) ->
    $("#new_member").append "<p>ERROR</p>"