const { exec } = require('child_process');

console.log('Starting')

var yourscript = exec('./restore.sh',
    (error, stdout, stderr) => {
        console.log(stdout);
        console.log(stderr);
        if (error !== null) {
            console.log(`exec error: ${error}`);
            process.exit(1);
        }
    });

console.log('Done')
