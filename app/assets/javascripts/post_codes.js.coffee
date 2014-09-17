# Compute shipping cost

$(document).on 'ready page:load', ->

  url = window.location.pathname
  number_regExp = /[0-9]+/
  matches = number_regExp.exec url
  listing_id = matches[0]

  timer = null
  delay = 600

  $('.js-use-code-input').bind 'input', () ->
    window.clearTimeout timer
    timer = window.setTimeout ->
      getShippingCost(listing_id, $('.js-use-code-input').val())
    ,delay

getShippingCost = (listing_id, post_code) ->
  $.get "/listings/#{listing_id}/orders/get_shipping_cost?post_code=#{post_code}", (data) ->
    if data
      $('#shipping-cost').html("£#{data.shipping_cost}")
      $('#order_shipping_cost').val("#{data.shipping_cost}")
    else
      $('#shipping-cost').html("Incorrect post code")