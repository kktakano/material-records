$(function() {



  function appendMaterial(material) {
    if (!material.image) {
      var imageHtml = `<svg class="bd-placeholder-img card-img-top" width="100%" height="180" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Image cap"><title>Placeholder</title><rect width="100%" height="100%" fill="#868e96"/><text x="40%" y="50%" fill="#dee2e6" dy=".3em">NoImage</text></svg>`
    } else {
      var imageHtml = `<img class="bd-placeholder-img card-img-top", focusable="false", height="180", src="${material.image}", preserveaspectratio="xMidYMid slice", role= "img", style="object-fit: contain;" >`
    }
  
    var html = `<div class="card mx-auto mb-2 material" style='width: 18rem;'>
                ${imageHtml}
                <div class="card-body">
                  <h5 class="card-title">${material.name}</h5>
                </div>
                <ul class="list-group list-group-flush">
                  <li class="list-group-item">仕入れ値: ￥${material.price}</li>
                  <li class="list-group-item">総数: ${material.value}</li>
                  <li class="list-group-item">単位(set,cm): ${material.unit}</li>
                </ul>
                <div class="card-body">
                  <button class="btn btn-sm btn-outline-secondary" type="button" onclick="location.href='/materials/${material.id}/edit'">選択</button>
                </div>
             </div>`
    $(".material-lists").append(html)
    $(".pagination").empty()
  }

  function appendErrMsgToHTML(msg){
    var html = `<div class="name mx-auto">${msg}</div>`
    $(".material-lists").append(html)
  }

  $(".search--materials").on("keyup", function(){
    var input = $(this).val();
    console.log(input)

    $.ajax({
      type: 'get',
      url: '/items/search',
      data: {keyword: input},
      dataType: 'json'
    })
    .done(function(materials){
      console.log(materials)
      $(".material-lists").empty();
      if (materials.length !== 0){
        materials.forEach(function(material){
          appendMaterial(material);
        });
      }
      else{
        appendErrMsgToHTML("一致する材料がありません");
      }
    });
  });
})