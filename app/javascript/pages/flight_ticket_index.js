
const validateFlightTicket =() =>{

    const validateBtn = document.getElementById("validate-btn")
    const boxBtn = document.querySelector(".validate-bottom")
    
    validateBtn.addEventListener("click", (e) => {
        console.log(e);
        boxBtn.classList.remove("validate-bottom")
    })
}

export {validateFlightTicket}