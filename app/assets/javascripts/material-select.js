$(function() {
  // クリック回数を計算する初期値を設定
  var conuntUpValue = 0;
  // 商品登録ボタンの上に使用材料を追加表示
  function addMaterialHtml(conuntUpValue,materialId,materialName,pricePerUnit,materialUnit){
    var html = `<div class="form-inline mx-auto add-material" style="max-width: 60%;">
                  <div class="form-group mb-2 col-sm-3">
                    <p class="form-control-plaintext" id="staticEmail2">${materialName}</p>
                  </div>
                  <div class="form-group mx-sm-3 mb-2 " >
                    <p class="mb-0 ">¥ ${pricePerUnit} / ${materialUnit}</p>
                  </div>
                  <div class="form-group mx-sm-3 mb-2">
                    <label for="inputPassword2" class="sr-only">use-material-value</label>
                    <input type="number" class="form-control use-material-value" placeholder="使用量を入力(半角)" data_price-per-unit="${pricePerUnit}">
                    <p class="mb-0">${materialUnit}</P>
                  </div>
                  <button type="button" class="btn btn-light mb-2 determination_button" data_price-per-unit="${pricePerUnit}">使用量の決定</button>
                  <button type="button" class="btn btn-light mb-2 material_delete_button" >削除</button>
                  <input class="use-material-id" type="hidden" name="item[use_materials_attributes][${conuntUpValue}][material_id]" id="item_use_materials_attributes_${conuntUpValue}_material_id" value="${materialId}">
                  <input class="use-material-price" type="hidden" name="item[use_materials_attributes][${conuntUpValue}][price]" id="item_use_materials_attributes_${conuntUpValue}_price">
                </div>`;
    $(".add-materials").append(html);
  }
  // 材料の選択ボタンを押すと材料のデータをhtmlへ送信
  $(document).on('click', '.select_button', function(){
    // クリックする度にカウントアップ
    conuntUpValue += 1;
    // console.log(conuntUpValue)
    const materialId = $(this).attr("data_material_id")
    const materialName = $(this).attr("data_material_name")
    var materialPrice = $(this).attr("data_material_price")
    var materialValue = $(this).attr("data_material_value")
    // 単位あたりの金額を四捨五入で計算
    const pricePerUnit = Math.round(materialPrice / materialValue * 10) / 10
    const materialUnit = $(this).attr("data_material_unit")
    // 選択した材料の表示を削除
    $(this)
    .parents(".material")
    .remove();
    // 材料の情報を引数で渡す
    addMaterialHtml(conuntUpValue,materialId,materialName,pricePerUnit,materialUnit)

  })
  // 生成した使用材料の表示にある削除ボタンを押すと表示を削除
  $(document).on('click','.material_delete_button', function(){
    $(this)
    .parents(".add-material")
    .remove();
  });
});