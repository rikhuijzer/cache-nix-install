var spawn = require('child_process').spawn
var child = spawn('./src/core.sh', ['main'])

child.stdout.setEncoding('utf8');
child.stdout.on('data', function(data) {
    console.log(data);
});

child.stderr.setEncoding('utf8');
child.stderr.on('data', function(data) {
    console.log(data);
});

child.on('close', function(exitCode) {
    console.log('Process exited with: ' + exitCode);
});
