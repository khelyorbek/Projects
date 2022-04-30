/** Command-line tool to generate Markov text. */

const { MarkovMachine } = require("./markov");
const argv = process.argv;
const mode = argv[2];
const address = argv[3];
const fs = require('fs');

if(mode === 'file' && address.endsWith('.txt')) {
    console.log('File mode selected. File name: ' + address);

    fs.readFile(address, 'utf8', (err, data) => {
        if(err) {
            error('File read');
        }
        
        run(data);
    })
} 
else if (mode === 'url' && address.startsWith('http')) {
    console.log('Url mode selected. Address: ' + address);
    console.log('Imagine that axios is implemented and pulled a text: Some random text that will make you question reality that can be anything you want it to be')
    pulledData = 'Some random text that will make you question reality that can be anything you want it to be';
    run(pulledData);
}
else {
    error('Syntax');
}

function error(str){
    console.log(`${str} error. Please try again!`);
    process.exit(1);
}

function run(data) {
    let mm = new MarkovMachine(data);
    mm.makeText();
}