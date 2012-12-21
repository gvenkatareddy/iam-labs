
/**
 * Module dependencies.
 */

var express = require('express')
  , routes = require('./routes')
  , user = require('./routes/user')
  , http = require('http')
  , https = require('https')
  , path = require('path');

var app = express();

var CAS = require('cas');
var cas = new CAS({
      base_url: 'https://dk.example.org:8143/cas',
      service: 'http://dk.example.org:3000',
      external_pgt_url: 'https://dk.example.org:8143/cas',
      version: 2.0
});

app.configure(function(){
  app.set('port', process.env.PORT || 3000);
  app.set('views', __dirname + '/views');
  app.set('view engine', 'jade');
  app.use(express.favicon());
  app.use(express.logger('dev'));
  app.use(express.bodyParser());
  app.use(express.methodOverride());
  app.use(app.router);
  app.use(express.static(path.join(__dirname, 'public')));
});

app.configure('development', function(){
  app.use(express.errorHandler());
});

var doSimpleAuthenticated = function(req, res, extended) {      
    res.send({authenticated: extended});
};   

app.get('/', function(req, res) {
    cas.authenticate(req, res, function(err, status, username, extended) {
        console.log("CAS successfully authenticated: " + username);        
        doSimpleAuthenticated(req, res, extended);        
    });
    
});

app.get('/proxied', function(req, res) {
    cas.authenticate(req, res, function(err, status, username, extended) {
        var pgtIOU = extended['PGTIOU'];
        console.log("CAS successfully authenticated: " + username);
        console.log("PGTIOU: " + pgtIOU);
        
        cas.getProxyTicket(pgtIOU, "https://dk.example.org:8143/cas/clearPass", function(err, pt) {            
            if(err) {
              console.log(err);
              res.send("Could not retrieve proxy ticket");
            }
            else {
              res.send({proxyTicket: pt})
            }
        });  
                
    });
}); 

http.createServer(app).listen(app.get('port'), function(){
  console.log("Express server is listening on port " + app.get('port'));
});