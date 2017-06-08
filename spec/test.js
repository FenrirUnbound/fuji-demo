'use strict';

const expect = require('chai').expect;

describe('E2E Tests', () => {
    before(() => {
        // this is not an angular-based UI
        browser.ignoreSynchronization = true;
    });

    it('has the correct header title', () =>
        browser.get(`http://${process.env.HOST}:8000`)
            .then(() => browser.getTitle())
            .then((title) => {
                expect(title).to.equal('Sample app: Flickr slideshow');
            })
    );
});
