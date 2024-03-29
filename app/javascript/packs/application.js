// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import '../stylesheets/application'

$(document).on('click', 'form .remove_fields', function (event) {
  $(this).prev('input[type=hidden]').val('1')
  $(this).closest('.nested-fields').hide()
  event.preventDefault()
})

$(document).on('click', 'form .add_fields', function (event) {
  var time = new Date().getTime()
  var regexp = new RegExp($(this).data('id'), 'g')

  var nested_fields = $(this).data('fields').replace(regexp, time)
  $('form .fields').append(nested_fields)

  event.preventDefault()
})


$(document).on('turbolinks:load', function () {
  $('input#filter_date').datepicker({
    format: 'dd/mm/yyyy'
  })
})



// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
