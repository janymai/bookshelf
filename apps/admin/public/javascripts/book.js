$('.js-.item__delete').on('click', function(event) {
  $(document).trigger('itemDeleteAction', [{'action': this.dataset.url}])
})

$(document).on('itemDeleteAction', function(event, data) {
  console.log(data)
  // $.ajax(type: 'delete', url: data.action, function() {
  //   delete the DOM <li>
  //   set message in the header
  // }
})
// http://api.jquery.com/jQuery.data/


// [ click ther button] => [ trigger itemDeleteAction, [url] -> $(document)]
//
//
// [ docudmnt] => [ itemDeleteActionHandler ] => [ fetch url, ajax DELETE to that URL ]
//   => redirect to index page with alert('completel')


// https://gist.github.com/jodosha/9830002

// http://webuild.envato.com/blog/chainable-bem-modifiers/

// Viet test = capybara cho phan nay

// https://github.com/lotus/lotus/blob/master/lib/lotus/configuration.rb#L395-L419
