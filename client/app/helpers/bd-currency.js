import Ember from 'ember';

function format(number) {
  return parseFloat(number).toFixed(0).replace(/./g, function(c, i, a) {
    return i && c !== "." && ((a.length - i) % 3 === 0) ? ',' + c : c;
  });
}

export function bdCurrency(number) {
  if (number) {
    return "$" + format(number);
  }
}

export default Ember.Helper.helper(bdCurrency);
