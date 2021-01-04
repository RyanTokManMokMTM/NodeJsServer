/* global describe, it */
'use strict';

var assert = require('power-assert');
var generator = require('../');

describe('isValid', function () {
  it('valid numbers ', function(done){
    assert.ok(generator.isValid('123451234512348'));
    assert.ok(generator.isValid('49927398716'));
    assert.ok(generator.isValid(1996008));
    assert.ok(generator.isValid(1230));
    assert.equal(generator.isValid(''), false);
    assert.equal(generator.isValid(undefined), false);
    assert.equal(generator.isValid(null), false);
    done();
  });

  it('create check sum', function(done){
    assert.equal(generator.checkSum('12345123451234'), 8);
    assert.equal(generator.checkSum('4992739871'), 6);
    assert.equal(generator.checkSum(199600), 8);
    assert.equal(generator.checkSum(123), 0);
    assert.equal(generator.checkSum(''), 0);
    assert.equal(generator.checkSum(undefined), 0);
    assert.equal(generator.checkSum(null), 0);
    done();
  });

  it('generate value is valid. and check a check sum', function(done){
    var val = generator.generate(10);
    assert.ok(generator.isValid(val));
    assert.equal(generator.checkSum(val.substring(0, val.length -1)), val.substring(val.length -1 , val.length));
    done();
  });
});
