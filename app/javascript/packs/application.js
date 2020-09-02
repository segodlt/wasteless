// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")



// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { displayUnit, nextIngredient } from "../components/display_unit"
import { redirectToRecipe } from "../components/redirect_to_recipe"
import { initSelect2 } from "../plugins/init_select2"
import { categoryForm } from "../components/category_form"
import { closeNotice } from "../components/close_notice"
//import { incrementQuantity } from "../components/increment_quantity"

document.addEventListener('turbolinks:load', () => {
  displayUnit();
  nextIngredient();
  initSelect2(".select2");
  redirectToRecipe();
  categoryForm();
  closeNotice();
  // incrementQuantity();
  // $(".category-choice").click(function(){

  //   $(this).toggleClass("active");
  // });
  // Call your functions here, e.g:
  // initSelect2();
});

// import { initSweetalert } from '../components/init_select2';
import { initSweetalert } from '../plugins/init_sweetalert';

initSweetalert('#sweet-alert-demo', {
  title: "Êtes-vous sûr(e) ?",
  text: "",
  icon: "warning"
}, (value) => {
  if (value) {
    const link = document.querySelector('#delete-link');
    link.click();
  }
});
