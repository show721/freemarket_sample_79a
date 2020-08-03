$(function() {
  //---以下を追記---
    var search_list = $(".contents");
  
    function appendProduct(product) {
      var html = `
                 <div class="product_content">
                   <p class="product_name">
                     ${product.brand}
                   </p>
                 </div>
                 `
      search_list.append(html);
     }
  
    function appendErrMsgToHTML(msg) {
      var html = `
                  <div class="product_content">
                    <p class="product_name">
                      ${ msg }
                    </p>
                   </div>
                 `
      search_list.append(html);
    }
  //---以上を追記---
    $(".searchbox-input").on("keyup", function() {
      var input = $(".searchbox-input").val();
      $.ajax({
        type: 'GET',
        url: '/products/search',
        data: { keyword: input },
        dataType: 'json'
      })
      .done(function(products) {
        search_list.empty();
        if (products.length !== 0) {
          console.log(input)
          products.forEach(function(product){
            appendProduct(product);
          });
        } else {
          appendErrMsgToHTML("該当する商品はございません");
        }
      })
      .fail(function() {
        alert('error');
      });
    });
  });
  