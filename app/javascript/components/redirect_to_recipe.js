

const redirectToRecipe = () => {
  const cards = document.querySelectorAll(".rating")
  cards.forEach((card) => {
    card.addEventListener("click", (e) => {
      const findLink = e.target.closest(".recipe-card").querySelector(".next-page");
      window.location = findLink.href;
    });
  });


};

export { redirectToRecipe };
