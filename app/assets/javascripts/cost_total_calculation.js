$(function() {

  function previewCost(){
    // 入力された値を元に材料の合計を計算
    var input_value = $(".use-material-value").val()
    // console.log(input_value)
    var price_per_unit = $(".price-per-unit").val()
    console.log(price_per_unit)
  }

  $(document).on('keyup', '.use-material-value', function(){
    // console.log("発火")
    previewCost();
  })
})