/* jshint expr:true */
import { expect } from 'chai';
import { describe, it } from 'mocha';
import { CampaignReport } from 'bd-pro/models/campaign-report';

describe('CampaignReport', function() {
  var campaignReport;

  describe("#dateFilters", function() {
    beforeEach(function(){
      campaignReport = CampaignReport.create({ campaign: {}, vehicles: [] })
    })
    it("displays date ranges at 2-week interval", function(){
      expect(campaignReport).to.be.ok;
    });
    it("only allows ranges at 2-week intervals", function(){

    });
  });
});
