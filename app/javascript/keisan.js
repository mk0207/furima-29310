//1 要素の取得
//　価格が入っている場所　
//　　手数料を入れる場所
//    利益を入れる場所

//２　価格が入っている場所から数値を取得する　
//　　価格を元に、販売手数料、利益を掛け算などで計算する

//３　計算結果を１で取得した要素に反映させる

window.addEventListener('load', function(){
  const kakaku = document.getElementById("item-price")
  const tesuuryou = document.getElementById("add-tax-price")
  const rieki = document.getElementById("profit")
  kakaku.addEventListener('input',function(){
    const price = document.getElementById("item-price").value
    tesuuryou.innerHTML = price / 10
    rieki.innerHTML = price * 0.9
  })
})