$(document).on('turbolinks:load', function(){

  function appendHTML(food) {
    var html =
    `
    <div class="redords-food clearfix">
    <p class="redords-food__name">${ food.name }</p>
    <div class="food-search-add redords-food__btn redords-food__btn--add" data-food-id="${food.id}" data-food-name="${food.name}">追加</div>
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
    ``
    return html;
  }

  $("#food-search-field").on("input", function() {
    var input = $("#food-search-field").val();
    // console.log('わーい');
    $.ajax({
      type: 'GET',
      url: '/foods',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(foods){
      console.log(foods);
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
  });

  $('#food-search-result').on('click', '.food-search-add', function() {
    $(this).parent().remove();
    var id = $(this).data('food-id');
    var name = $(this).data('food-name');
    var html = appendMemberHTML(id, name);
    $('#chat-event-foods').append(html);
  });

  $(document).on('click', '.food-search-remove', function() {
    $(this).parent().remove();
  });

});