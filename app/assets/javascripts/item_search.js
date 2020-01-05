$(function() {



  function appendMaterial(item) {
    if (!item.image) {
      var imageHtml = `<svg class="card-img-top" width="100%" height="260" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Image cap"><title>Placeholder</title><rect width="100%" height="100%" fill="#868e96"/><text x="40%" y="50%" fill="#dee2e6" dy=".3em">NoImage</text></svg>`
    } else {
      var imageHtml = `<img class="card-img-top", focusable="false", height="260", src="${item.image}", preserveaspectratio="xMidYMid slice", role= "img", style="object-fit: contain;" >`
    }
  
    var html = `<div class='col-md-4'>
                  <div class='card mb-4 shadow-sm'>
                    ${imageHtml}
                    <div class="card-body">
                      <p class='card-text'>name:${item.name}</p>
                      <div class='d-flex justify-content-between align-items-center'>
                        <div class='h6'>¥${item.price}</div>
                      </div>
                      <div class='d-flex justify-content-between align-items-center'>
                        <div class='btn-group'>
                          <button class='btn btn-sm btn-outline-secondary' type='button' onclick="location.href='/items/${item.id}/edit'">編集</button>
                        </div>
                        <div class='h3 text-right'>cost: ¥${item.cost}</div>
                      </div>
                    </div>
                  </div>
                </div>`
    $(".items-list").append(html)
    $(".pagination").empty()
  }

  function appendErrMsgToHTML(msg){
    var html = `<div class="name mx-auto">${msg}</div>`
    $(".materials-list").append(html)
  }

  $(".item_search").on("keyup", function(){
    var input = $(this).val();
    console.log(input)

    $.ajax({
      type: 'get',
      url: '/items/item_search',
      data: {keyword: input},
      dataType: 'json'
    })
    .done(function(items){
      console.log(items)
      $(".items-list").empty();
      if (items.length !== 0){
        items.forEach(function(item){
          appendMaterial(item);
        });
      }
      else{
        appendErrMsgToHTML("一致する商品がありません");
      }
    });
  });
})