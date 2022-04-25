const fs = require('fs');

function cat(path){
    fs.readFile(path,'utf8',(err,data) => {
        if(err) {
            console.log(err);
            process.exit(1);
        }
        console.log(data);
    })
}

cat(process.argv[2]);

// node step1.js one.txt
// This is file one.

// node step1.js huh.txt
// [Error: ENOENT: no such file or directory, open 'huh.txt'] {
//   errno: -2,
//   code: 'ENOENT',
//   syscall: 'open',
//   path: 'huh.txt'
// }