$(function(){
// 【商品説明にテキスト入力時】
// 現在の入力文字数を出力するJavascript
  $('.exhibition--description--text').on('keyup', function(){
    var count = $('.exhibition--description--text').val().replace(/\s+/g, '').length;
    $('.counter').text(count + '/1000');
    // 文字数が1000文字以上なら入力文字数を赤文字にし、アラートがでるJavascript
    if(count > 1000){
      $('.counter').addClass('count_over');
      $('.alert').addClass('exhibition-content__product--description--alert').text('1000文字以下で入力してください。');
    }else{
      $('.counter').removeClass('count_over');
      $('.alert').removeClass('exhibition-content__product--description--alert');
    }
  })
// 【出品画像のアップロード時】
// ボックスをクリックしたとき、s.file_fieldsメソッドを実行するJavascript
  $('.exhibition-content__caption--image').on('click', function(){
    var number = $('.item-image').length;
    $(`#item_product_image_attributes_${number}_image`).click();
  })
  // 画像を複数投稿できるようにするJavascript
  $('.exhibition-content__caption--image--default').change(function(){
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
    console.log(num);
    if (num == 5){
      $('.exhibition-content__caption--image').css('display', 'block');
    }
    var target_image = $(this).parent().parent()
    target_image.remove();
  })
});