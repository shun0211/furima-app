document.addEventListener(
  "DOMContentLoaded", (e) => {
    if (document.getElementById("token_submit") != null) { 
      Payjp.setPublicKey("pk_test_84fcaf11ff16e1a41fb4c812");
      let btn = document.getElementById("token_submit"); //IDがtoken_submitの場合に取得されます
      btn.addEventListener("click", (e) => { //ボタンが押されたときに作動します
        e.preventDefault(); //ボタンを一旦無効化します
  
        //カード情報生成
        let card = {
          number: document.getElementById("card_number").value,
          cvc: document.getElementById("cvc").value,
          exp_month: document.getElementById("exp_month").value,
          exp_year: document.getElementById("exp_year").value
        }; //入力されたデータを取得します。
  
        //トークン生成
        Payjp.createToken(card, (status, response) => {
          if (status === 200) { //成功した場合
            $("#card_number").removeAttr("name");
            $("#cvc").removeAttr("name");
            $("#exp_month").removeAttr("name");
            $("#exp_year").removeAttr("name"); //カード情報を自分のサーバにpostせず削除します
            $("#card_token").append(
              $('<input type="hidden" name="payjp_token">').val(response.id)
            ); //トークンを送信できるように隠しタグを生成
            document.inputForm.submit();
            alert("登録が完了しました"); //確認用
          } else {
            alert("カード情報が正しくありません。"); //確認用
        }
      });
    });
   }
  },false);
 