$(document).on('turbolinks:load', function(){

  function appendHTML(food) {
    var html =
    `
    <div class="events-food clearfix">
    <p class="events-food__name">${ food.name }</p>
    <div class="food-search-add events-food__btn events-food__btn--add" data-food-id="${food.id}" data-food-name="${food.name}">追加</div>
    </div>
    `
    $('#food-search-result').append(html);
  }

  function appendErrMsgToHTML(food) {
    var html =
    ``
    $('#food-search-result').append(html);
  }

  function appendMemberHTML(id, name) {
    var html =
    `
    <div class="event-form__field__add clearfix js-event-foods" id="${ id }">
    <input name='event[food_ids][]' type='hidden' value=${ id }>
    <p class="events-food__name">${ name }</p>
    <a class="food-search-remove chat-event-food__btn chat-event-food__btn--remove js-remove-btn">削除</a>
    </div>
    `
    return html;
  }

  $("#food-search-field").on("input", function() {
    var input = $("#food-search-field").val();
    if (input.length !== 0) {
    $.ajax({
      type: 'GET',
      url: '/foods',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(foods){
      $("#food-search-result").empty();
      if (foods.length !== 0) {
        foods.forEach(function(food){
          appendHTML(food);
        });
      }
      else {
        appendErrMsgToHTML("一致する食品が見つかりません");
      }
    })
    .fail(function(){
      alert('食品検索に失敗しました');
    })
    } else {
      $("#food-search-result").empty();
    }
  });

  $('#food-search-result').on('click', '.food-search-add', function() {
    $(this).parent().remove();
    var id = $(this).data('food-id');
    var name = $(this).data('food-name');
    var html = appendMemberHTML(id, name);
    $('#events-foods').append(html);
  });

  $(document).on('click', '.food-search-remove', function() {
    $(this).parent().remove();
  });

});