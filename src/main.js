const utils = require('./utils.js')
const { spawn } = require('child_process');

child = spawn('./src/prepare.sh');

function after(exitCode) {
    if (parseInt(exitCode) !== 0) {
        // Handle non-zero exit.
    }
    utils.run_script('./src/core.sh main')
}

child.stdout.setEncoding('utf8');
child.stdout.on('data', function(data) {
    console.log('stdout: ' + data);
    data=data.toString();
    scriptOutput+=data;
});

child.stderr.setEncoding('utf8');
child.stderr.on('data', function(data) {
    console.log('stderr: ' + data);
    data=data.toString();
    scriptOutput+=data;
});

firstSpawn.on('exit', function(code) {
    if (parseInt(exitCode) !== 0) {
        // Handle non-zero exit.
    }
    utils.run_script('./src/core.sh main')
});
