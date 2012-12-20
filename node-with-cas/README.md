node-with-cas - a proof of concept to casify node apps with [node-cas](https://github.com/joshchan/node-cas) module
-------------------------------------------------------------------------------------------------------------------

Note: currently I could not make proxy tickets work.

There are two endpoints:

* `/` - basic CAS-protected URL
* `/proxied` - a URL to demonstrate retrieval of CAS proxy tickets (does not work)

## Prerequisites
* Node.js installed
* npm installed

## Configuration
* In `app.js` change CAS URL values suitable for your CAS instalation
* In `app.get('/proxied', ...)` route in `app.js` change value for proxied service URL suitable for your needs

## Building and running
* `npm install`
* `npm install jsdom`
* `git clone git@github.com:joshchan/node-cas.git node_modules/cas`
* `node app`

The resulting app will be then available at `http://localhost:3000` 