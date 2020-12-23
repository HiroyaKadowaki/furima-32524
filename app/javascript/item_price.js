function count (){
  const ItemPrice = document.getElementById("item-price")
  ItemPrice.addEventListener("keyup", () => {
    const countVal = ItemPrice.value;
    const AddTaxPrice = document.getElementById('add-tax-price')
    AddTaxPrice.innerHTML = `${countVal*0.10}`
    const Profit = document.getElementById('profit')
    Profit.innerHTML = `${countVal*0.90}`
  });
}

window.addEventListener('load', count);
