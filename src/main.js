const { spawn } = require('child_process');
const events = require('events');
const myEmitter = new events.EventEmitter();

firstSpawn = spawn('./src/prepare.sh');
firstSpawn.on('exit'), (exitCode) => {
    if (parseInt(code) !== 0) {
        //Handle non-zero exit
    }
    myEmitter.emit('firstSpawn-finished');
}

myEmitter.on('firstSpawn-finished', () => {
    secondSpawn = spawn('./src/core.sh', ['main'])
})
