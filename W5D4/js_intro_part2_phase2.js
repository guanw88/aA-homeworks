// Phase II: Constructors, Prototypes, and this
// First write a constructor function for an elephant. Each elephant should have
// a name, height (in inches), and array of tricks in gerund form (e.g. "painting
// a picture" rather than "paint a picture").
//
// Next write a few prototype functions that will be shared among all elephants:
//
// Elephant.prototype.trumpet: should print "(name) the elephant goes 'phrRRRRRRRRRRR!!!!!!!'"
// Elephant.prototype.grow: should increase the elephant's height by 12 inches
// Elephant.prototype.addTrick(trick): add a new trick to their existing repertoire
// Elephant.prototype.play: print out a random trick, e.g. "(name) is (trick)!"
// Hint: look up some JS Math methods!
// Make sure to create an elephant and test all of these functions out on them method style!

function Elephant(name, height, tricks) {
  this.name = name
  this.height = height
  this.tricks = tricks
}

Elephant.prototype.trumpet = function() {
  console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!'`);
}

Elephant.prototype.grow = function() {
  this.height += 12;
}

Elephant.prototype.addTrick = function(trick) {
  this.tricks.push(trick)
}

Elephant.prototype.play = function() {
  console.log(`${this.name} is ${this.tricks[Math.floor(Math.random() * this.tricks.length)]}!`);
}

// let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
// // ellie.trumpet();
// // console.log(ellie.height);
// // ellie.grow();
// // console.log(ellie.height);
// // console.log(ellie.tricks);
// // ellie.addTrick("playing memory games");
// // console.log(ellie.tricks);
// ellie.play()
// ellie.play()
// ellie.play()
