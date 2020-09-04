const { spawn } = require('child_process');

firstSpawn = spawn('./src/prepare.sh');
firstSpawn.on('exit'), function(exitCode) {
    if (parseInt(code) !== 0) {
        // Handle non-zero exit.
    }
    secondSpawn = spawn('./src/core.sh', ['main'])
};
