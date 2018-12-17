$ document
.on 'turbolinks:load', () ->
  return unless page.controller() == 'trainer' && page.action() == 'feed'
  $.get '/exercises.xml', {}, (resp_xml) ->
    $.get '/post.xslt', {}, (resp_xsl) ->
      displayResult resp_xml, resp_xsl

displayResult = (xml, xsl) ->
  if document.implementation && document.implementation.createDocument
    xsltProcessor = new XSLTProcessor
    xsltProcessor.importStylesheet xsl
    resultDocument = xsltProcessor.transformToFragment xml, document
    document.getElementById("posts_container").appendChild resultDocument
