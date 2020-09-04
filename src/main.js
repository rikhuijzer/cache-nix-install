const { spawn } = require('child_process');

firstSpawn = spawn('./src/prepare.sh');

function on_exit(exitCode) {
    if (parseInt(exitCode) !== 0) {
        // Handle non-zero exit.
    }
    secondSpawn = spawn('./src/core.sh', ['main'])
}

firstSpawn.on('exit', on_exit)
