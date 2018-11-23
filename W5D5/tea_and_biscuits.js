// Some tea? Some biscuits?
// Now let's move over to the node environment. Create a new javascript file to run in node.
//
// We are going to write a simple function that asks a user if they'd like tea and biscuits.
// Chronologically, your function should:
//
// Ask the user if they'd like tea.
// console.log their response.
// Ask the user if they'd like biscuits.
// console.log their complete response: So you ${firstAns} want tea and you ${secondAns} want coffee.
// Close the reader.
// How do we achieve this? First off, require the readline library.
//
const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// Next, write out your function. You should use the reader.question method to prompt
// the reader if they'd like some tea. reader.question takes two arguments: a string
// (this is where you ask your question) and a callback function. The callback function
// takes one argument: the user's response. This is passed in when the user responds to the prompt and hit enter.
//
// // Test that your first question works. Next, we'll need another reader.question to
// ask the reader if they'd like some biscuits. The function below won't work with
// our outlined chronology - try to run it:
//
function teaAndBiscuits () {
  reader.question('Would you like some tea?', (res1) => {
    console.log(`You replied ${res1}.`);
    reader.question('Would you like some biscuits?', (res2) => {
      console.log(`You replied ${res2}.`);

      const firstRes = (res1 === 'yes') ? 'do' : 'don\'t';
      const secondRes = (res2 === 'yes') ? 'do' : 'don\'t';
      console.log(`So you ${firstRes} want tea and you ${secondRes} want biscuits.`);
      reader.close();
    });
  });
}
teaAndBiscuits();
