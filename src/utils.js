module.exports = {
    run_script: function (script) {
        const { exec } = require('child_process');
        exec(script,
            (error, stdout, stderr) => {
                console.log(stdout);
                console.log(stderr);
                if (error !== null) {
                    console.log(`exec error: ${error}`);
                    process.exit(1);
                }
        });
    },

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
