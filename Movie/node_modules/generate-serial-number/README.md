# generate-serial-number
[![Build Status](https://travis-ci.org/hachi-eiji/generate-serial-number.svg?branch=master)](https://travis-ci.org/hachi-eiji/generate-serial-number)
## Description
simple generate serial number library.  
use Luhn algorithm when generate a serial number.
(for avoiding a user mistake input this)

## How to use
install via npm
```
npm install generate-serial-number
```

```
var generator = require('generate-serial-number');
var serialNumber = generator.generate(10); // '8380289275'
```

## APIs
### checkSum(num)
get check check sum from an argument. use Luhn algorithm.

### generate(length)
generate serial number(but, return value type is **string** ). ```length``` is generate number string length.  
The generated number is created by random value that ```length-1``` and a check sum.
e.g) When a return value ``` '8380289275' ```, ```838028927``` is random value. and ```5``` which last number is check sum.

### isValid(checkNumber)
validte the checkNumber.  

## License
License under the [MIT](https://github.com/hachi-eiji/generate-serial-number/blob/master/LICENSE) license.
