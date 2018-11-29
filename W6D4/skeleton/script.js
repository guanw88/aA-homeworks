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



  // adding new photos

  // --- your code here!



});
