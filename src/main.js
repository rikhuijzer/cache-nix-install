const utils = require('./utils.js')
const { spawn } = require('child_process');

firstSpawn = spawn('./src/prepare.sh');

function spawn_second(exitCode) {
    if (parseInt(exitCode) !== 0) {
        // Handle non-zero exit.
    }
    utils.run_script('./src/core.sh main')
}

firstSpawn.on('exit', spawn_second)
