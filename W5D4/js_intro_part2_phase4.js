// Phase IV: Closures
// Let's make a function dinerBreakfast. Ultimately, we want it to return an
// anonymous closure, which we will be able to use to keep adding breakfast foods to our initial order.
//
// > let bfastOrder = dinerBreakfast();
// "I'd like cheesy scrambled eggs please"
// > bfastOrder("chocolate chip pancakes");
// "I'd like cheesy scrambled eggs and chocolate chip pancakes please."
// > bfastOrder("grits");
// "I'd like cheesy scrambled eggs and chocolate chip pancakes and grits please."

// Hints:
// 1) order should be initialized to a starting order (e.g. scrambled eggs and bacon)
// before the anonymous function can do its work.
// 2) The closure should capture/close over order
// 3) What should the return value of dinerBreakfast be?
// 4) Which function should take in the additional food as an argument?
// 5) Make sure you can call it multiple times and keep chaining on more breakfast foods!

function dinerBreakfast() {
  let orders = ["cheesy scrambled eggs"]

  console.log(`I'd like ${orders.join(' and ')} please.`)

  return function bfastOrder(order) {
    orders.push(order)
    console.log(`I'd like ${orders.join(' and ')} please.`)
  }
}

let bfastOrder = dinerBreakfast();
bfastOrder("chocolate chip pancakes");
bfastOrder("grits");
