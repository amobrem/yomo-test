# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
    $('#order-form').submit ->
        $.post(
            $(this).attr('action')
            $(this).serialize()
            (data, textStatus, jqXHR) ->
                $('#order').modal('hide');
                alert('Your pre-order has been submitted.  Thank you!');
        )
        return false