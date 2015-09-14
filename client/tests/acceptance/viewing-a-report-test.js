/* jshint expr:true */
import { describe, it, beforeEach, afterEach } from 'mocha';
import { expect } from 'chai';
import Ember from 'ember';
import startApp from '../helpers/start-app';

describe.skip("Acceptance: Viewing a report", function() {
  var application;
  
  beforeEach(function() {
    application = startApp();
  });

  afterEach(function() {
    Ember.run(application, 'destroy');
  });

  describe("filtering by vehicle", function() {
    beforeEach(function() {
      server.create('campaign', { id: 1 });
    });

    it("makes an API call for the filtered vehicles", function() {
      visit(`/campaigns/${1}/report`);
      click(`.qa-filter-vehicle-${1}`);

      andThen(function() {
        expect(server.calledWith("/api/reports?vehicle_ids[]=1"));
      });
    });
  });
});

