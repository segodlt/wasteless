

const redirectToRecipe = () => {
  const cards = document.querySelectorAll(".recipe-card")
  cards.forEach((card) => {
    card.addEventListener("click", (e) => {
      const findLink = card.querySelector(".next-page");
      window.location = findLink.href;
    });
  });


};

export { redirectToRecipe };
