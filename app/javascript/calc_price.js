window.addEventListener('load', () => {
  const price = document.getElementById("item-price")
  price.addEventListener('focusout', (e) => {
    price.innerHTML = price.value.toLocaleString();
  });
  price.addEventListener("keyup", () => {
    const commission = price.value * 0.1
    const profit = price.value - commission
    const commissionSum  = document.getElementById("add-tax-price");
    commissionSum.innerHTML = Math.trunc(commission).toLocaleString();
    const profitSum  = document.getElementById("profit");
    profitSum.innerHTML = Math.trunc(profit).toLocaleString();
  });
});



 