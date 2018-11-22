// fizzBuzz
// 3 and 5 are magic numbers.
//
// Define a function fizzBuzz(array) that takes an array and returns a new array
// of every number in the array that is divisible by either 3 or 5, but not both.

function fizzBuzz(array) {
  var arr = []
  for (var i = 0; i < array.length; i++) {
    if ((array[i] % 3 === 0 || array[i] % 5 === 0) && array[i] % 15 !== 0) {
      arr.push(array[i])
    }
  }
  return arr
}

// console.log(fizzBuzz([3,5,7,9,15,24,25,30]))

// isPrime
// Define a function isPrime(number) that returns true if number is prime.
// Otherwise, false. Assume number is a positive integer.
//
// > isPrime(2)
// true
// > isPrime(10)
// false
// > isPrime(15485863)
// true
// > isPrime(3548563)
// false

function isPrime(number) {
  if (number === 2 || number === 3) return true;
  else if (number === 1) return false;
  else {
    for (var i = 2; i <= Math.sqrt(number); i++) {
      if (number % i === 0) return false;
    }
    return true
  }
}
// console.log(isPrime(1))
// console.log(isPrime(2))
// console.log(isPrime(10))
// console.log(isPrime(15485863))
// console.log(isPrime(3548563))

// sumOfNPrimes
// Using firstNPrimes, write a function sumOfNPrimes(n) that returns the sum of
// the first n prime numbers. Hint: use isPrime as a helper method.
//
// > sumOfNPrimes(0)
// 0
// > sumOfNPrimes(1)
// 2
// > sumOfNPrimes(4)
// 17


function sumOfNPrimes(n) {
  var counter = 0;
  var sum = 0;
  for (var i = 2; counter < n; i++) {
    if (isPrime(i)) {
      sum += i;
      counter++;
    }
  }
  return sum;
}

console.log(sumOfNPrimes(0))
console.log(sumOfNPrimes(1))
console.log(sumOfNPrimes(4))
