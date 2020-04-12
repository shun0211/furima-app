document.addEventListener(
  "DOMContentLoaded", e => {
    let modal_open = document.getElementById("modal-open");
    modal_open.onclick = function () {
      $('#overlay').fadeIn();
      document.getElementById('modal-close').onclick = function () {
        $('#overlay').fadeOut();
      };
      document.getElementById("delete-comformation").onclick = function () {
        document.getElementById("item-delete").click();
      };
    };
  },
  false
);