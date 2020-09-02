const redirectToRecipe = () => { 
  if (document.getElementById("redirect-recipe-js")) {
    console.log("redirectToRecipe")
    const cards = document.querySelectorAll(".recipe-card")
    cards.forEach((card) => {
      card.addEventListener("click", (e) => {
        e.preventDefault()
        const findLink = card.querySelector(".next-page");
        window.location = findLink.href;
      });
    });
  };
};

export { redirectToRecipe };
