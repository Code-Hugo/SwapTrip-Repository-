const editPriceFlightTicket = () => {

  const kiwiRadio = document.getElementById("kiwi-radio")
  const skyscannerRadio = document.getElementById("skyscanner-radio")
  const kayakRadio = document.getElementById("kayak-radio")
  const priceInput = document.getElementById("price-input")
  const kiwiPrice = document.getElementById("kiwi-price")
  const skyscannerPrice = document.getElementById("skyscanner-price")
  const kayakPrice = document.getElementById("kayak-price")

  kiwiRadio.addEventListener("change", (e) => {
    skyscannerRadio.checked = false;
    kayakRadio.checked = false;
    priceInput.value = kiwiPrice.innerText;
  })
  skyscannerRadio.addEventListener("change", (e) => {
    kiwiRadio.checked = false;
    kayakRadio.checked = false;
    priceInput.value = skyscannerPrice.innerText;
  })
  kayakRadio.addEventListener("change", (e) => {
    kiwiRadio.checked = false;
    skyscannerRadio.checked = false;
    priceInput.value = kayakPrice.innerText;
  })
}

export { editPriceFlightTicket }
