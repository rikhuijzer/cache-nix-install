module.exports = {
    spawn_script: function (script, args) {
        var spawn = require('child_process').spawn
        var child = spawn(script, args)

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
    }
}
