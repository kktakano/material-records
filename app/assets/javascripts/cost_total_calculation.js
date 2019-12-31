$(function() {
  var total_cost = 0;

    // 入力された値を元に材料の合計を計算
  $(document).on('click', '.determination_button', function(){
    // console.log("発火")
    var adjacent_class = $(this).prev("div")
    var input_value = adjacent_class.children(".use-material-value").val();
    var price_per_unit = $(this).attr("data_price-per-unit");
    var use_material_cost = Math.round(input_value * price_per_unit * 10) / 10;
    total_cost += use_material_cost;
    console.log(total_cost)
    $(".total-cost-form").val(total_cost)
  })
})