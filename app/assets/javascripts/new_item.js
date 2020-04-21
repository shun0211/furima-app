$(function(){

// 商品説明にテキストを入力時、現在の入力文字数を出力する機能
  $('.exhibition--description--text').on('keyup', function(){
    var count = $('.exhibition--description--text').val().replace(/\s+/g, '').length;
    $('.counter').text(count + '/1000');
    // 文字数が1000文字以上なら入力文字数を赤文字にし、エラーメッセージがでるJavascript
    if(count > 1000){
      $('.counter').addClass('count_over');
      $('.product_information_alert').addClass('exhibition-content__product--description--alert').text('1000文字以下で入力してください。');
    }else{
      $('.counter').removeClass('count_over');
      $('.product_information_alert').empty();
      $('.product_information_alert').removeClass('exhibition-content__product--description--alert');
    }
  })
  
// 出品画像ボックスをクリックした際、s.file_fieldsメソッドを実行する記述
  $('.exhibition-content__caption--image').on('click', function(){
    var number = $('.item-image').length;
    $(`#item_product_images_attributes_${number}_image`).click();
  })
  // 画像を複数投稿を可能にする記述
  $(document).on('change', '.exhibition-content__caption--image--default', function(){
    var number = $('.item-image').length;
    // 何枚目のファイルかを示す
    var num = $('.item-image').length + 1;
    var new_image_input = `<input class = "exhibition-content__caption--image--default" type = "file" id ="item_product_images_attributes_${num}_image" name = "item[product_images_attributes][${num}][image]">`
    $('.input_box').append(new_image_input)
    // 選択したファイル情報を取得し変数に格納
    var file = $(`#item_product_images_attributes_${number}_image`).prop('files')[0];
    // FileReaderオブジェクトを生成
    var fileReader = new FileReader();
    // 指定されたファイルを読み込み
    fileReader.readAsDataURL(file);
    // 読み込みが完了すると、srcにfileのURLを格納
    fileReader.onloadend = function(){
      var src = fileReader.result;
      var html = `<div class = 'item-image' id = 'image-${number}' data-image_id = "${number}" >
                    <div class = 'item-image__content' >
                      <div class = 'item-image__content--icon' >
                        <img src = ${src} width = "113" height = "80" />
                      </div>
                    </div>
                    <div class = 'item-image__operation' >
                      <div class = 'item-image__operation--delete'>削除</div>
                    </div>
                  </div>`
      // exhibition-content__caption--image要素の前に上記のHTMLを差し込む
      $('.exhibition-content__caption--image').after(html);
    }
    if (number == 5){
      $('.exhibition-content__caption--image').css('display', 'none');
    }
  })
  $(document).on("click", ".item-image__operation--delete", function(){
    // インプットタグ修正する消すための準備
    var input_list = [];
    $('.item-image').each(function(index, image_id){
      var all_image_id = $(image_id).data('image_id');
      input_list.push(all_image_id);
    })

    // プレビュー画像を削除
    var target_image = $(this).parent().parent();
    target_image.remove();
    // プレビュー画像が4枚以下になった場合、画像選択画面が再び現れる
    var number = $('.item-image').length;
    if (number == 4){
      $('.exhibition-content__caption--image').css('display', 'block');
    }
    // 削除したプレビュー画像のカスタムデータ属性を取得
    var image_id = $(this).parent().parent().data('image_id');
    // すべてのプレビュー画像のimage_idを取得
    var image_list = [];
    $('.item-image').each(function(index, image_id){
      var image_id_2 = $(image_id).data('image_id');
      image_list.push(image_id_2);
    })
    $.each(image_list, function(index, image_id_2){
      if (image_id_2 > image_id){
        // プレビュー画像のカスタムデータ属性修正
        $(`#image-${image_id_2}`).attr('data-image_id', function(){return (image_id_2 - 1)});
        $(`#image-${image_id_2}`).data('image_id', function(){return (image_id_2 - 1)});
        // インプットタグのname属性を修正
        $(`#item_product_images_attributes_${image_id_2}_image`).attr('name', function(){return "item[product_images_attributes][" + (image_id_2 - 1) + "][image]"})
        // インプットタグのid修正
        $(`#item_product_images_attributes_${image_id_2}_image`).attr('id', function(){return "item_product_images_attributes_" + (image_id_2 - 1) + "_image"})
        // プレビュー画像のid修正
        $(`#image-${image_id_2}`).attr('id', function(){return "image-" + (image_id_2 - 1)});
      }
    })
    // インプットタグを削除
    $(`#item_product_images_attributes_${image_id}_image`).remove();
    // 空のインプットタグを取得
    var input_max = Math.max.apply(null, input_list) + 1;
    // 空のインプットタグのid及びnameを修正
    $(`#item_product_images_attributes_${input_max}_image`).attr('name', function(){return "item[product_images_attributes][" + (input_max - 1) + "][image]"})
    $(`#item_product_images_attributes_${input_max}_image`).attr('id', function(){return "item_product_images_attributes_" + (input_max - 1) + "_image"})
  })

// 入力した際、エラーメッセージを消す機能
  $('.exhibition__product--name').on('keyup', function(){
    $('.product_name--empty').remove();
  })
  $('.exhibition--description--text').on('keyup', function(){
    $('.product_information--empty').remove();
  })
  $('.exhibition-content__details--Status--form').on('change', function(){
    $('.product_condition--empty').remove();
  })
  $('.exhibition-content__delivery--burden--form').on('change', function(){
    $('.shipping_charge--empty').remove();
  })
  $('.exhibition-content__delivery--area--form').on('change', function(){
    $('.prefecture_id--empty').remove();
  })
  $('.exhibition-content__delivery--days--form').on('change', function(){
    $('.days_of_ship--empty').remove();
  })
  $('.price--form').on('keyup', function(){
    $('.price--error').remove();
  })
  $('.exhibition-content__caption--image--default').on('change', function(){
    $('.images--empty').remove();
  })
  $('#parent-category').on('change', function(){
    $('.parent_category--empty').remove();
  })
  $(document).on('change', '#child-category', function(){
    $('.child_category--empty').remove();
  })
  $(document).on('change', '#grandchild-category', function(){
    $('.grandchild_category--empty').remove();
  })

  // 「出品する」を押したとき、コントローラーへajax通信でフォーム情報を送信
  $('.button').on('click', function(e){
    // それぞれのフォーム情報を取得
    var product_name = $('.exhibition__product--name').val();
    var product_information = $('.exhibition--description--text').val();
    var product_condition = $('.product_condition--form').val();
    var shipping_charge = $('.shipping_charge--form').val();
    var prefecture_id = $('.shipping_area--form').val();
    var days_of_ship = $('.days_of_ship--form').val();
    var price = $('.price--form').val();
    var images = $('.exhibition-content__caption--image--default').val();
    var parent_category = $('#parent-category').val();
    var child_category = $('#child-category').val();
    var grandchild_category = $('#grandchild-category').val();
    e.preventDefault();
    var form_data = document.forms.new_item;
    var formData = new FormData(form_data);
    $.ajax({
      url: "/items",
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    // コントローラーから情報が返ってきたあとの処理
    .done(function(data){
      // エラーメッセージが返ってきていない場合、トップページへ遷移する
      var key = Object.keys(data).length;
      if (key == 0){
        window.location.href = '/';
      }else{
        // エラーメッセージが返ってきた場合(必須項目を入力できていない場合)、エラーメッセージを表示する
        if (product_name == ""){
          var product_name_err = `<div class = "product_name--empty">入力してください</div>`
          if ($('.product_name--empty').length){
          }else{
          $('.exhibition-content__product--name').after(product_name_err);
          }
        }
        if (product_information == ""){
          var product_information_err = `<div class = "product_information--empty">入力してください</div>`
          if ($('.product_information--empty').length){
          }else{
          $('.exhibition-content__product--description--form').after(product_information_err);
          }
        }
        if (product_condition == ""){
          var product_condition_err = `<div class = "product_condition--empty">選択してください</div>`
          if ($('.product_condition--empty').length){
          }else{
          $('.exhibition-content__details--Status--form').after(product_condition_err);
          }
        }
        if (shipping_charge == ''){
          if ($('.shipping_charge--empty').length){
          }else{
          var shipping_charge_err =  `<div class = "shipping_charge--empty">選択してください</div>`
          $('.exhibition-content__delivery--burden--form').after(shipping_charge_err);
          }
        }
        if (days_of_ship == ''){
          if ($('.days_of_ship--empty').length){
          }else{
          var days_of_ship_err = `<div class = "days_of_ship--empty">選択してください</div>`
          $('.exhibition-content__delivery--days--form').after(days_of_ship_err);
          }
        }
        if (prefecture_id == ''){
          var prefecture_id_err = `<div class = "prefecture_id--empty">選択してください</div>`
          if ($('.prefecture_id--empty').length){
          }else{
          $('.exhibition-content__delivery--area--form').after(prefecture_id_err);
          }
        }
        if (price == '' || price <= 300 || price >= 9999999){
          var price_err = `<div class = "price--error">300以上9999999以下で入力してください</div>`
          if ($('.price--error').length){
          }else{
          $('.exhibition-content__price--selling--unity').after(price_err);
          }
        }
        if (images == ''){
          var images_err = `<div class = "images--empty">画像をアップロードしてください</div>`
          if ($('.images--empty').length){
          }else{
          $('.exhibition-content__caption--image--box').after(images_err);
          }
        }
        if (parent_category == ''){
          var parent_category_err = `<div class = "parent_category--empty">選択してください</div>`
          if ($('.parent_category--empty').length){
          }else{
            $('.exhibition-content__details--category').after(parent_category_err);
          }
        }
        if (child_category == ''){
          var child_category_err = `<div class = "child_category--empty">選択してください</div>`
          if ($('.child_category--empty').length){
          }else{
            $('#children_wrapper').after(child_category_err);
          }
        }
        if (grandchild_category == ''){
          var grandchild_category_err = `<div class = "grandchild_category--empty">選択してください</div>`
          if ($('.grandchild_category--empty').length){
          }else{
            $('#grandchildren_wrapper').after(grandchild_category_err);
          }
        }
      }
    })
  })
  // 販売手数料と販売履歴を表示
  $('.price--form').on('keyup', function(){
    $('.exhibition-content__price--fee-value').empty();
    var sales_commission = Number($('.price--form').val()) * 0.1;
    $('.exhibition-content__price--fee-value').text('¥' + sales_commission);
    $('.exhibion-content__price--revenue-value').empty();
    var sales_profit = Number($('.price--form').val()) - sales_commission;
    $('.exhibion-content__price--revenue-value').text('¥' + sales_profit);
  })

  // 挿入するHTMLを定義
  // 挿入するオプション（選択肢）を定義
  function appendOption(category){
    var html = `<option value = "${category.id}">${category.name}</option>`;
    return html;
  }
  // 挿入する小カテゴリーのブロックを作成
  function appendChildrenBox(insertHTML){
    var childSelectHtml =`<div class = 'child__category--form' id = 'children_wrapper' >
                            <select class = 'exhibition-content__details--category--form' id = 'child-category'>
                              <option value>選択してください</option>
                              ${insertHTML}
                            </select>
                          </div>` 
    $('.exhibition-content__details--category--form').after(childSelectHtml)
  }
  // 挿入する孫カテゴリーのブロックを作成
  function appendGrandchildrenBox(insertHTML){
    var grandchildSelectHtml =`<div class = 'child__category--form' id = 'grandchildren_wrapper' >
                                 <select class = 'exhibition-content__details--category--form' id = 'grandchild-category' name = 'item[category_id]'>
                                   <option value>選択してください</option>
                                   ${insertHTML}
                                 </select>
                               </div>` 
    $('#children_wrapper').after(grandchildSelectHtml);
  }

  // 親カテゴリーが選択されたとき発火
  $("#parent-category").on("change", function(){
    // 小カテゴリーと孫カテゴリー削除
    $('#children_wrapper').remove();
    $('#grandchildren_wrapper').remove();
    // 親IDのname属性削除
    $('#parent-category').removeAttr('name');
    var parent_category_id = $('#parent-category').val();
    if (parent_category_id.length > 1){
      $.ajax({
        url: "/items/get_category_children",
        type: "GET",
        data: { parent_category_id: parent_category_id },
        dataType: 'json',
        contentType: false
      })
      .done(function(children){
        var insertHTML = "";
        children.forEach(function(child){
          insertHTML += appendOption(child);
        })
        appendChildrenBox(insertHTML);
      })
    }
  })
  // 小カテゴリーが選択されたとき発火
  $(document).on("change", "#child-category", function(){
    $('#grandchildren_wrapper').remove();
    var child_category_id = $("#child-category").val();
    if (child_category_id.length > 1){
      $.ajax({
        url: "/items/get_category_grandchildren",
        type: "GET",
        data: { child_category_id: child_category_id },
        dataType: 'json',
        contentType: false
      })
      .done(function(grandchildren){
        var insertHTML = "";
        grandchildren.forEach(function(grandchild){
          insertHTML += appendOption(grandchild);
        })
        appendGrandchildrenBox(insertHTML)
      })
    }
  })
})
