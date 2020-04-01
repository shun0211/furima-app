$(function(){
// 商品説明にテキストを入力時、現在の入力文字数を出力する機能
  $('.exhibition--description--text').on('keyup', function(){
    var count = $('.exhibition--description--text').val().replace(/\s+/g, '').length;
    $('.counter').text(count + '/1000');
    // 文字数が1000文字以上なら入力文字数を赤文字にし、エラーメッセージがでるJavascript
    if(count > 1000){
      $('.counter').addClass('count_over');
      $('.alert').addClass('exhibition-content__product--description--alert').text('1000文字以下で入力してください。');
    }else{
      $('.counter').removeClass('count_over');
      $('.alert').empty();
      $('.alert').removeClass('exhibition-content__product--description--alert');
    }
  })
  
// 出品画像ボックスをクリックした際、s.file_fieldsメソッドを実行する記述
  $('.exhibition-content__caption--image').on('click', function(){
    var number = $('.item-image').length;
    $(`#item_product_image_attributes_${number}_image`).click();
  })
  // 画像を複数投稿を可能にする記述
  $('.exhibition-content__caption--image--default').change(function(){
    console.log(this);
    // 選択したファイル情報を取得し変数に格納
    // var file = $('.exhibition-content__caption--image--default').prop('files')[0];
    $.each(this.files, function(i, file){
      console.log(file);
      // FileReaderオブジェクトを生成
      var fileReader = new FileReader();
      // 何枚目のファイルかを示す
      var num = $('.item-image').length + 1;
      console.log(num);
      // 指定されたファイルを読み込み
      fileReader.readAsDataURL(file);
      // 読み込みが完了すると、srcにfileのURLを格納
      fileReader.onloadend = function(){
        var src = fileReader.result;
        var html = `<div class = 'item-image' >
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
      $('.item-image').attr('id', `image-${num}`)
      if (num == 5){
        $('.exhibition-content__caption--image').css('display', 'none');
      }
    })
  })
  $(document).on("click", ".item-image__operation--delete", function(){
    var num = $('.item-image').length;
    if (num == 5){
      $('.exhibition-content__caption--image').css('display', 'block');
    }
    var target_image = $(this).parent().parent()
    target_image.remove();
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
  $('.exhibition-content__price--selling--form').on('keyup', function(){
    $('.price--error').remove();
  })
  $('.exhibition-content__caption--image--default').on('change', function(){
    $('.images--empty').remove();
  })

  // 「出品する」を押したとき、コントローラーへajax通信でフォーム情報を送信
  $('.button').on('click', function(e){
    // それぞれのフォーム情報を取得
    var product_name = $('.exhibition__product--name').val();
    var product_information = $('.exhibition--description--text').val();
    var product_condition = $('.exhibition-content__details--Status--form').val();
    var shipping_charge = $('.exhibition-content__delivery--burden--form').val();
    var prefecture_id = $('.exhibition-content__delivery--area--form').val();
    var days_of_ship = $('.exhibition-content__delivery--days--form').val();
    var price = $('.exhibition-content__price--selling--form').val();
    var images = $('.exhibition-content__caption--image--default').val();
    e.preventDefault();
    var form_data = document.forms.new_item
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
      console.log(key);
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
        if (price == '' || price >= 300 || price <= 9999999){
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
      }
    })
  })
})