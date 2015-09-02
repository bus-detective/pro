/* jshint expr:true */
import { describe, it, beforeEach, afterEach } from 'mocha';
import { expect } from 'chai';
import Ember from 'ember';
import startApp from '../helpers/start-app';

describe.skip("Acceptance: Signing In", function() {
  var application;
  
  beforeEach(function() {
    application = startApp();
  });

  afterEach(function() {
    Ember.run(application, 'destroy');
  });

  describe("with valid credentials", function() {
    it("signs in the user", function() {
      let user = server.create('user');
      visit('/sign-in');

      fillIn('.qa-email-field', user.email);
      fillIn('.qa-password-field', "correct-password");
      click('.qa-submit');
      

      andThen(function() {
        expect(currentPath()).to.equal('campaigns');
      });
    });
  });
});
