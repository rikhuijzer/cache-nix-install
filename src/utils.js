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
    }
}
