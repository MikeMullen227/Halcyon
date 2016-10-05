$(document).on("turbolinks:load", function () {

  $(".js-log-in-out").on("click", HalcyonApp.);

});


HalcyonApp.addIngredientToSandwich = function (event) {
  // Get the button that was clicked from the event's currentTarget
  var theButton = event.currentTarget;

  // Get the data attribute from that specific button
  var theIngredientId = $(theButton).data("ingredient-id");

  // Select the tag that contains the sandwich ID and get its data
  var theSandwichId = $(".js-sandwich-id").data("sandwich-id");

  // Set up our key/value pairs for the form body
  var apiData = { ingredient_id: theIngredientId };

  $.ajax({
    type: "POST",
    url: `/api/sandwiches/${theSandwichId}/ingredients/add`,
    data: apiData,
    success: SandwichrApp.updateIngredientList,
    error: SandwichrApp.handleError
  });
};


SandwichrApp.updateIngredientList = function (response) {
  console.log("Added ingredient successfully");
  console.log(response);

  var lastIndex = response.ingredients.length - 1;
  var newIngredient = response.ingredients[lastIndex];

  var html = `
    <li> ${newIngredient.name} </li>
  `;

  $(".js-current-ingredients").append(html);
};

SandwichrApp.handleError = function (error) {
  console.log("Error adding ingredient");
  console.log(error.responseText);
};