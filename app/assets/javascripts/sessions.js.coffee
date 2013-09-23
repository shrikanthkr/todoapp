# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$("#signin").click ->
	$("#myModal").foundation "reveal", "open"
$("#signin_main").click ->
	$("#myModal").foundation "reveal", "open"

$("singin_done").click ->
	$("#myModal").foundation "reveal", "close"
