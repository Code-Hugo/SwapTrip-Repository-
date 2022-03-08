
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

export {validateFlightTicket}
