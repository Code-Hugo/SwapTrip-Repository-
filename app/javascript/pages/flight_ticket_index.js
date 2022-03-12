
const validateFlightTicket =() =>{

    const validateBtn = document.getElementById("validate-btn")
    const boxBtn = document.querySelector(".validate-bottom")
    if (validateBtn) {
      validateBtn.addEventListener("click", (e) => {
        console.log(e);
        boxBtn.classList.remove("validate-bottom")
      })
    }
}

const validateUser = () => {

  const flightCard = document.querySelectorAll(".card")
  if (flightCard) {
    flightCard.forEach((card)=> {
      card.addEventListener("click", (e) => {
        console.log(e)
        const popup = document.getElementById('user-validation')
        popup.style.display="block";
      })
    })
  }
}
export {validateFlightTicket}
export {validateUser}
