$(function(){
  $('.edit_button').on('click', function(e){
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
    var form = $('#item_form')
    var url = form.attr("action")
    console.log('test');
    $.ajax({
      url: url,
      type: "PATCH",
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
  $(document).on("click", ".item-image__operation--delete", function(){
    var product_image_id = $(this).parent().parent().data("product_image_id");
    $.ajax({
      url: "/items/image_delete",
      type: "DELETE",
      data: {product_image_id: product_image_id},
      dataType: 'json',
      // フォームでコントローラーに値を送るとき以外はprocessDataやcontentTypeのオプションを付ける必要はない
    })
  })
})