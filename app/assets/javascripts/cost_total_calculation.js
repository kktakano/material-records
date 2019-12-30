$(function() {
  // var total_cost = 0
    // 入力された値を元に材料の合計を計算
  $(document).on('keyup', '.use-material-value', function(total_cost){
    // previewCost();
    total_cost = 0 
    var input_value = $(this).val()
    var price_per_unit = $(this).attr("data_price-per-unit")
    var use_material_cost = Math.round(input_value * price_per_unit * 10) / 10
    total_cost = total_cost + use_material_cost
    console.log(total_cost)
  })
})