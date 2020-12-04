document.addEventListener("turbolinks:load", () => {
  const presentButton = document.getElementById('present-time')

  if (presentButton) {
    presentButton.onclick = () => {
      if (presentButton.innerText === "ついたよ") {
        presentButton.innerText = "かえるよ"
      } else {
        presentButton.innerText = "ついたよ"
      }
    }
  }
})