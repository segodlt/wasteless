const categoryForm = () => {
 const categories = document.querySelectorAll(".category-choice")
 if (categories) {
  categories.forEach((category) => {
    category.addEventListener("click", (event) => {
      if (document.querySelector(".active")) {
        document.querySelector(".active").classList.remove("active");
      }

      category.classList.add("active");
    })
  })
 }
};

export { categoryForm };
