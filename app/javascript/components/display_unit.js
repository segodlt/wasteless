import { initSelect2 } from "../plugins/init_select2"

const displayUnit = (parent) => {
  const ingredients = (parent ? parent : document).querySelectorAll(".ingredient_input");
  ingredients.forEach((ingredient) => {
    console.log(ingredient)
    ingredient.addEventListener("change", handleUnitForUdatedIngredient);
  });
}

const handleUnitForUdatedIngredient = (event) => {
  console.log(event);
  const field = event.target;
  fetch("/api/ingredients")
    .then(response => response.json())
    .then((data) => {
      data.forEach((ingr) => {
        if(ingr["id"] === parseInt(field.value)) {
          field.parentNode.parentNode.querySelector(".display-unit").innerText = ingr["unit"]
        };
      });
    });
}

const nextIngredient = () => {
  const cross = document.querySelector(".next-element");
  cross.addEventListener("click", touchNextIngredient);
}

let measureIndex = 1;

const touchNextIngredient = (event) => {
  measureIndex++;
  const firstIngredient = document.querySelector("#base_ingredient");
  const newNode = firstIngredient.cloneNode(true);
  let content = newNode.innerHTML;
  // console.log(content.replace);
  content = content.replace(/\[0\]/g, `[${measureIndex}]`);
  content = content.replace(/_0_/g, `_${measureIndex}_`);
  // console.log(content);
  newNode.innerHTML = content;
  displayUnit(newNode); // add click event on ingredient input
  firstIngredient.parentNode.appendChild(newNode);
  newNode.querySelector(".display-unit").innerText = '';
  newNode.classList.remove('d-none');
  initSelect2(`#recipe_measures_attributes_${measureIndex}_ingredient_id`);
}
export {displayUnit, nextIngredient };
