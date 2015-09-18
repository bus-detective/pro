/* jshint expr:true */
import Ember from 'ember';
import { expect } from 'chai';
import { describe, it, beforeEach } from 'mocha';
import CampaignReport from 'bd-pro/models/campaign-report';


describe('CampaignReport', function() {
  var subject;

  describe("#selectedVehiclePositions", () => {
    beforeEach(() => {
      subject = CampaignReport.create({ 
        vehicles: [ Ember.Object.create({remoteId: "123", isSelected: true}), Ember.Object.create({remoteId: "456"}) ],
        vehiclePositions: [ Ember.Object.create({vehicleRemoteId: "123"}), Ember.Object.create({vehicleRemoteId: "456"})]
      });
    });

    it("is a list of vehiclePositions for the selected vehicles", () => {
      expect(subject.get('selectedVehiclePositions.length')).to.eq(1);
    });
  });
});

