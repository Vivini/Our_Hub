const mapToggle = () => {
  const viewmap = document.querySelector(".map")
  const viewlist = document.querySelector(".list")
  const element = document.querySelector(".map-btn")
    element.addEventListener("click", () => {
    viewmap.classList.toggle("toggle-hidden")
    viewlist.classList.toggle("toggle-hidden")
    if (viewmap.classList.contains("toggle-hidden")) {
      element.innerText = "SHOW MAP";
    }
    if (viewlist.classList.contains("toggle-hidden")) {
      element.innerText = "SHOW LIST";
    }
  });
}

export { mapToggle };
