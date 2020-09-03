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

    spawn_script: function (script) {
        const { spawn } = require('child_process');

        const child = spawn(script);

        child.stdout.on('data', (data) => {
            console.log(`stdout:\n${data}`);
        });

        child.stderr.on('data', (data) => {
            console.error(`stderr: ${data}`);
        });

        child.on('error', (error) => {
            console.error(`error: ${error.message}`);
        });

        child.on('close', (code) => {
            console.log(`child process exited with code ${code}`);
        });
    }
}
