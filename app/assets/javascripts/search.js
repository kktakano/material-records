$(function() {

  function appendMaterial(material) {
    var html = `<div class="card mx-auto mb-2" style='width: 18rem;'>
                <%= image_tag ${material.image.image},class: "bd-placeholder-img card-img-top",focusable: "false",height: "180", preserveaspectratio: "xMidYMid slice",role: "img",style:"object-fit: contain;" %>
                <div class="card-body">
                  <h5 class="card-title">${material.name}</h5>
                </div>
                <ul class="list-group list-group-flush">
                  <li class="list-group-item">仕入れ値: ￥${material.price}</li>
                  <li class="list-group-item">総数: ${material.value}</li>
                  <li class="list-group-item">単位(set,cm): ${material.unit}</li>
                </ul>
                <div class="card-body">
                  <button class="btn btn-sm btn-outline-secondary" type="button">選択</button>
                </div>
             </div>`
    $(".materials-list").append(html)
  }

  $(".search-materials").on("keyup", function(){
    var input = $(".search-materials").val();
    // console.log(input)

    $.ajax({
      type: 'get',
      url: '/items/search',
      data: {keyword: input},
      dataType: 'json'
    })
    .done(function(materials){
      console.log(materials)
      $(".materials-list").empty();
      if (materials !== 0){
        materials.forEach(function(material){
          appendMaterial(material);
        });
      }
      else{
        appendErrMsgToHTML("一致する材料がありません");
      }
    })
  });
})