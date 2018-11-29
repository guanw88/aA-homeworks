document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants
  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });

  // adding SF places as list items
  const addLi = (e) => {
    e.preventDefault();
    const ul = document.getElementById("sf-places");
    const li = document.createElement("li");
    const textField = document.getElementsByClassName("favorite-input")[0];
    li.textContent = textField.value;
    ul.appendChild(li);
  };

  document.querySelector(".favorite-submit").addEventListener("click", addLi);

  // toggle photo add form
  const togglePhotoForm = (e) => {
    debugger
    const photoForm = document.getElementsByClassName("photo-form-container")[0]
    if (photoForm.classList.contains("hidden")){
      photoForm.classList.remove("hidden");
    } else {
      photoForm.classList.add("hidden");
    }
  };

  document.querySelector(".photo-show-button").addEventListener("click", togglePhotoForm);

  // adding new photos



});
