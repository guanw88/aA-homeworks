// Mystery Scoping

// returns 'in block' both times since last var takes precedence (both have function scope)
function mysteryScoping1() {
  var x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

// returns 'in block' then 'out of block' since const only defined within same scope
function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';
    console.log(x);
  }
  console.log(x);
}

// errors out because const cannot be redefined
function mysteryScoping3() {
  const x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

// returns 'in block' then 'out of block' since each is defined within block scope
function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  console.log(x);
}

// errors out because third let statement is within same scope as first let statement
function mysteryScoping5() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  let x = 'out of block again';
  console.log(x);
}

// madLib
// Write a function that takes three strings - a verb, an adjective, and a noun -
// uppercases and interpolates them into the sentence "We shall VERB the ADJECTIVE NOUN". Use ES6 template literals.
//
// For example,
// > madLib('make', 'best', 'guac');
// "We shall MAKE the BEST GUAC."

function madLib(verb, adj, noun) {
  console.log(`We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}.`);
}
madLib('make', 'best', 'guac');

// isSubstring

// Inputs: 1) A String, called searchString and 2) A String, called subString.
// Output: A Boolean. true if the subString is a part of the searchString.
//
// > isSubstring("time to program", "time")
// true
//
// > isSubstring("Jump for joy", "joys")
// false

function isSubstring(searchString, subString) {
  for (var i = 0; i <= (searchString.length - subString.length); i++) {
    if (searchString.slice(i, i + subString.length) === subString) {
      return true
    }
  }
  return false
}
console.log(isSubstring("time to program", "time"));
console.log(isSubstring("Jump for joy", "joys"));
