function write() {
  const reviews = document.getElementById("review-pull-down")
  const form = document.getElementById("pull-down")

  reviews.addEventListener('click', () => {
    if (form.getAttribute("style") == "display:block;") {
      form.removeAttribute("style", "display:block;")
    } else {
      form.setAttribute("style", "display:block;")
    }
  })
}
window.addEventListener('load', write);
