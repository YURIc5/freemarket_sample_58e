$(function(){
  // カテゴリーセレクトボックスのオプションを作成
  function appendOptionDelivery(delivery){
    var html = `<option value="${delivery.id}" data-category="${delivery.id}">${delivery.responsibility}</option>`;
    return html;
  }

  // 子カテゴリーの表示作成
  function appendChidrenBoxDelivery(insertHTML){
    var childSelectHtml = '';

    childSelectHtml = ` <label for="item_配送の方法" id= 'delivery_label'>配送の方法</label>
                        <span class="form-require" id= 'delivery_require'>必須</span>
                          <div class='select-box' id= 'delivery_children_wrapper'>
                            <div class='select-wrap'>
                              <select class="listing-select-wrapper__box--select" id="delivery_category" name="item[delivery_id]">
                                <option value="---" data-category="---">---</option>
                                ${insertHTML}
                              </select>
                            </div>
                          </div>`;
    $('.form-group.first-box3').append(childSelectHtml);
  }

  $('#delivery_parent_category').on('change', function(){
    var parentCategory = document.getElementById('delivery_parent_category').value; //選択された親カテゴリーの名前を取得
    if (parentCategory != "---"){ //親カテゴリーが初期値でないことを確認
      $.ajax({
        url: '/users/:user_id/items/get_delivery_children',
        type: 'GET',
        data: { parent_name: parentCategory },
        dataType: 'json'
      })
      .done(function(children){
        $('#delivery_label').remove();
        $('#delivery_require').remove();
        $('#delivery_children_wrapper').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOptionDelivery(child);
        });
        appendChidrenBoxDelivery(insertHTML);
      })
      .fail(function(){
        alert('送料取得に失敗しました');
      })
  }else{
    $('#delivery_label').remove();
    $('#delivery_require').remove();
    $('#delivery_children_wrapper').remove();
  }
  });
})



