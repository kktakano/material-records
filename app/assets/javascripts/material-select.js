$(function() {

  function addMaterialHtml(materialId,materialName,pricePerUnit,materialUnit){
    var html = `<form class="form-inline mx-auto add-material" style="max-width: 650px;">
                  <div class="form-group mb-2 col-sm-3">
                    <p class="form-control-plaintext" id="staticEmail2">${materialName}</p>
                  </div>
                  <div class="form-group mx-sm-3 mb-2 price-per-unit" data_price-per-unit="${pricePerUnit}">
                    <p class="mb-0 ">¥ ${pricePerUnit} / ${materialUnit}</p>
                  </div>
                  <div class="form-group mx-sm-3 mb-2">
                    <label for="inputPassword2" class="sr-only">Password</label>
                    <input type="number" class="form-control use-material-value" placeholder="使用量を入力" data_price-per-unit="${pricePerUnit}">
                    <p class="mb-0">${materialUnit}</P>
                    </div>
                  <button type="submit" class="btn btn-light mb-2 material_delete_button" value="${materialId}">削除</button>
                </form>`;
    $(".add-materials").append(html);
  }

  $(document).on('click', '.select_button', function(){
    // console.log("発火")
    const materialId = $(this).attr("data_material_id")
    // console.log(materialId)
    const materialName = $(this).attr("data_material_name")
    var materialPrice = $(this).attr("data_material_price")
    var materialValue = $(this).attr("data_material_value")
    // 単位あたりの金額を四捨五入で計算
    const pricePerUnit = Math.round(materialPrice / materialValue * 10) / 10
    const materialUnit = $(this).attr("data_material_unit")
    $(this)
    .parents(".material")
    .remove();
    addMaterialHtml(materialId,materialName,pricePerUnit,materialUnit)

  })

  $(document).on('click','.material_delete_button', function(){
    $(this)
    .parents(".add-material")
    .remove();
  });
});