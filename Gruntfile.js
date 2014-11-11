module.exports = function(grunt) {

    // Project configuration.
    grunt.initConfig({
        // This line makes your node configurations available for use
        pkg: grunt.file.readJSON('package.json'),
        convert: {
            yml2json: {
                files: [{
                    expand: true,
                    cwd: 'resources/',
                    src: ['**/*.yml'],
                    dest: 'resources/json/',
                    ext: '.json'
                }]
            }
        },

        yamllint: {
            all: ['resources/**/*.yaml']
        }
    });
    // Each plugin must be loaded following this pattern
    grunt.loadNpmTasks('grunt-convert');
    grunt.loadNpmTasks('grunt-yamllint');
    // Custom task(s).
    // First argument names the task for use in command line
    // Second argument is a list of tasks to be run
    grunt.registerTask('default', ['yamllint:all', 'convert:yml2json']);
    grunt.registerTask('lint', ['yamllint:all']);

};
