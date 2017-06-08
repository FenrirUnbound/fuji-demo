'use strict';

// For more information regarding Protractor configuration files:
// https://github.com/angular/protractor/blob/master/docs/api-overview.md#config-files

exports.config = {
    framework: 'mocha',
    mochaOpts: {
        ui: 'bdd',
        timeout: 10 * 1000
    },
    sauceUser: process.env.SAUCE_USER,
    sauceKey: process.env.SAUCE_KEY,
    specs: [ 'test.js' ]
};
