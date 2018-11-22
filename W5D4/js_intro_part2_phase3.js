// Phase III: Function Invocation
// First, let's make a few elephants so we have a small herd. Feel free to copy the code below,
// or to make your own with any attributes you like. Make sure to store all of our elephants in an array.
//
// let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
// let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
// let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
// let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);
//
// let herd = [ellie, charlie, kate, micah];
// Now let's create a function called paradeHelper that we'll use to have an elephant parade.
// It should take a single elephant as an argument; this way, we can pass it as a callback
// to forEach when called on our herd. Make sure to store it as a property on the Elephant
// object. You can populate it with any console.log statement you want to build your parade (e.g. "_______ is trotting by!").
//
// For example:
//
// > Elephant.paradeHelper(micah);
// Micah is trotting by!
// undefined
// Once you have this function, call forEach on the herd and pass it in as the
// callback without invoking it. Elephants galore!

function Elephant(name, height, tricks) {
  this.name = name
  this.height = height
  this.tricks = tricks
}

Elephant.paradeHelper = function(elephant) {
  console.log(`${elephant.name} is trotting by!`)
}

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

// Elephant.paradeHelper(micah);
herd.forEach(function(elephant) {
  Elephant.paradeHelper(elephant);
})
