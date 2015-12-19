
// Delete book
var el
$('.js-.item__delete').on('click', function(event) {
  el = $(this)
  $(document).trigger('itemDeleteAction', [{'action': this.dataset.url, 'csrfToken': this.dataset.csrfToken}])
})

$(document).on('itemDeleteAction', function(event, data) {
  $.ajax({
    url: data.action,
    data: {
      '_csrf_token': data.csrfToken
    },
    type: 'DELETE',
    success: function(result) {
      el.parents('.list-group-item').remove()
    },
    error: function(result) {
      alert('DELETE can not successful');
    }
  });
})
