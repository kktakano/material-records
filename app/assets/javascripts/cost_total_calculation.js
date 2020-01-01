$(function() {
  var total_cost = 0;

    // 入力された値を元に材料の合計を計算
  $(document).on('click', '.determination_button', function(){
    // "使用量の決定"を押すことで発火し、入力した使用量に応じて金額を計算
    var adjacent_class = $(this).prev("div")
    var input_value = adjacent_class.children(".use-material-value").val();
    var price_per_unit = $(this).attr("data_price-per-unit");
    var use_material_cost = Math.round(input_value * price_per_unit * 10) / 10;
    total_cost += use_material_cost;
    // 使用材料の合計金額をフォームに表示
    $(".total-cost-form").val(total_cost)
    // 決定ボタンを押すと入力ができないようにする
    adjacent_class.children(".use-material-value").attr("readonly",true)
    // 決定ボタンを押すと決定ボタンが無効化される
    $(this).attr("disabled",true)
  })
})