module.exports = function () {
    return {
        files: [
            'config.coffee',
            'src/**/*.coffee'
        ],

        tests: [
            'test/**/*.coffee'
        ],

        env: {
            type: 'node'
        },
        workers: {
            initial: 1,         // without these sometimes the fluentnode apis
            regular: 1          // are not detected
        }
    };
}