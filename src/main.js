const { spawn } = require('child_process');
const events = require('events');

firstSpawn = spawn('./src/prepare.sh');
firstSpawn.on('exit'), (exitCode) => {
    if (parseInt(code) !== 0) {
        // Handle non-zero exit.
    }
    secondSpawn = spawn('./src/core.sh', ['main'])
}
