# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ document
  .on 'turbolinks:load', () ->
    return unless page.controller() == 'exercises' && page.action() == 'feed'
    $.get '/exercises.xml', {}, (resp_xml) ->
      $.get '/post.xslt', {}, (resp_xsl) ->
        displayResult resp_xml, resp_xsl
        rating_up_btn_init()

displayResult = (xml, xsl) ->
  if document.implementation && document.implementation.createDocument
    xsltProcessor = new XSLTProcessor
    xsltProcessor.importStylesheet xsl
    resultDocument = xsltProcessor.transformToFragment xml, document
    document.getElementById("posts_container").appendChild resultDocument

rating_up_btn_init = () ->
  $ '.rating_up'
    .on 'click', () ->
      console.log 'Does it work?!'
      console.log this.post_id