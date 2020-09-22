window.addEventListener('DOMContentLoaded', function(){
  const kakaku = document.getElementById("item-price")
  const tesuuryou = document.getElementById("add-tax-price")
  const rieki = document.getElementById("profit")
  kakaku.addEventListener('input',function(){
    const price = document.getElementById("item-price").value
    tesuuryou.innerHTML = price / 10
    rieki.innerHTML = price * 0.9
  })
})