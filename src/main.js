const utils = require('./utils.js')
const { spawn } = require('child_process');

child = spawn('./src/prepare.sh');

child.stdout.setEncoding('utf8');
child.stdout.on('data', function(data) {
    console.log('stdout: ' + data);
});

child.stderr.setEncoding('utf8');
child.stderr.on('data', function(data) {
    console.log('stderr: ' + data);
});

child.on('exit', function(exitCode) {
    if (parseInt(extiCode) !== 0) {
        // Handle non-zero exit.
    }
    utils.run_script('./src/core.sh main')
});
