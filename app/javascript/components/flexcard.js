const flexCardGrow = (event) => {
  const cards = document.querySelectorAll(".list-item")
  cards.forEach((item) => {
    item.addEventListener("click", () => {
      cards.forEach((card) => {
        card.classList.remove("expanded")
      })
      item.classList.add("expanded")
    })
  });
}

export { flexCardGrow };
