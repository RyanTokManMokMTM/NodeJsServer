'use strict';

(function() {
  function _splitDigits(num) {
    return Array.prototype.map.call((num + '').trim().split(''), function(v) {
      return parseInt(v, 10);
    });
  }

  function _sum(num) {
    return _splitDigits(num).reduce(function(c, v) {
      return c + v;
    });
  }

  /**
   * create check sum.
   *
   * @param {string|number} num
   * @return {number} check sum value
   */
  function checkSum(num) {
    if (num == null) {
      return 0;
    }
    var doubled = _splitDigits(num).reverse().map(function(v, idx) {
      return idx % 2 === 0 ? v * 2 : v;
    });
    var sum = doubled.reduce(function(tmp, v) {
      return tmp + _sum(v);
    }, 0);
    var check = 10 - (sum % 10);
    return check === 10 ? 0 : check;
  }

  /**
   * validate num.
   *
   * @param {string|number} checkNumber check number
   * @return {boolean} true: checkNumber is valid
   */
  function isValid(checkNumber) {
    if (checkNumber == null) {
      return false;
    }
    var numbers = _splitDigits(checkNumber);
    return numbers.pop() === checkSum(numbers.join(''));
  }

  /**
   * create generate code
   *
   * @param {number} length generage
   * @return {string} generaged digits value
   */
  function generate(length) {
    var len = length - 1;
    var ary = new Array(len);
    for (var i = 0; i < len; i++) {
      ary.push(Math.floor(Math.random() * 10));
    }
    var num = ary.join('');
    return num + '' + checkSum(num);
  }

  module.exports = {
    isValid: isValid,
    checkSum: checkSum,
    generate: generate
  };
}());
