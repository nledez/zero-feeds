// Generated by CoffeeScript 1.6.3
var americano, config;

americano = require('americano');

config = {
  common: [
    americano.bodyParser(), americano.methodOverride(), americano.errorHandler({
      dumpExceptions: true,
      showStack: true
<<<<<<< HEAD
    }), americano["static"](__dirname + '/client/public', {
=======
    }), americano["static"](__dirname + '/../client/public', {
>>>>>>> 0c65f91... clean js building and add server/config.js
      maxAge: 86400000
    })
  ],
  development: [americano.logger('dev')],
  production: [americano.logger('short')],
  plugins: ['americano-cozy']
};

module.exports = config;
