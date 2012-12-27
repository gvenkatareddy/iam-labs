# node-with-cas

A proof of concept to casify node apps with a customized version of the [node-cas](https://github.com/joshchan/node-cas) module.

There are two endpoints:

* `/` - basic CAS-protected URL
* `/proxied` - a URL to demonstrate retrieval of CAS proxy tickets

## Prerequisites
* [`node.js`](http://nodejs.org/)
* [`npm`](http://nodejs.org/) (Part of the installation package when you install `node.js`)
* Python `2.7.3` (Python 3.x is not yet supported by `jsdom` and its dependencies)

## Configuration
* In `app.js` change CAS URL values suitable for your CAS instalation
* In `app.get('/proxied', ...)` route in `app.js` change value for proxied service URL suitable for your needs

A sample of the `node.js` CAS client configuration is listed below:

* `base_url`: CAS Server URL prefix (i.e. `https://mmoayyed-1933.unicon.net:9443/cas`)
* `service`: Server name hosting this application (i.e. `http://mmoayyed-1933.unicon.net:3000`)
* `proxy_server`: Required for proxy authentication. Starts a proxy server to accept pgtUrl callbacks
* `proxy_server_key`: Required for proxy authentication. Keystore for the server to accomodate `https` outbound calls.
* `proxy_server_cert:` Required for proxy authentication. Certificate for the server to accomodate `https` outbound calls.
* `proxy_callback_host`, `proxy_callback_port`: Required for proxy authentication. Forms the callback url for that is to
be captured by the proxy server. The proxy server will listen for incoming CAS proxy callbacks at 
`https://proxy_callback_host:proxy_callback_port`


## Building and running
* `npm install`
* `npm install jsdom`
* `npm install winston`
* `node app`

The resulting app will be then available at `http://localhost:3000`.

When you startup the application with `node app`, you should see the following lines on the console:
```
info: startProxyServer(): proxy callback server is listening for proxy requests on port xxxx
info: createServer(): express server is listening on port xxxx
```

##Logging
The protyope uses the winston module to log requests. By default, log data is available both at the console level and 
inside the file `casNodeClient.log` at the project root directory. This configuration can be customized through the following
options available to the CAS module:

* `logLevel:` Default is `info`. Other acceptable values are `error` and  `warn`. 
* `logFile:` Location of the log file. Default is `casNodeClient.log`.
* `enableConsoleLogging:` By default, log data is available to the console. Set this to `false` to only allow log data
to be stored inside the `logFile`.

## Sample successful authentication response
```json
{
  "authenticated": {
    "username": "admin",
    "attributes": {},
    "PGTIOU": "PGTIOU-2-ide3veRZCNanet23APly-cas.server.edu",
    "ticket": "ST-2-vLaZzq6dEgx4uhQpqjYg-cas.server.edu",
    "proxies": []
  }
}
```
