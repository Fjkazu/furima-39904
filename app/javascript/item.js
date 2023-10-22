function item (){
  const form = document.getElementById("item-price");
  form.addEventListener("input", (e) =>{
    const tax = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit")
    const totalPrice = form.value;
    const taxPrice = Math.floor(totalPrice * 0.1);
    tax.innerHTML = taxPrice;
    profit.innerHTML = (totalPrice - taxPrice);   
  })
};

window.addEventListener("turbo:load", item);