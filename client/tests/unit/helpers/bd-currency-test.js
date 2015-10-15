/* jshint expr:true */
import { expect } from 'chai';
import { describe, it } from 'mocha';
import { bdCurrency } from 'bd-pro/helpers/bd-currency';

describe('BdCurrencyHelper', function() {
  it('currencies', function() {
    expect(bdCurrency(undefined)).to.eq(undefined);
    expect(bdCurrency("42")).to.eq("$42");
    expect(bdCurrency(42)).to.eq("$42");
    expect(bdCurrency(42.999)).to.eq("$43");
    expect(bdCurrency(42222.22)).to.eq("$42,222");
  });
});
