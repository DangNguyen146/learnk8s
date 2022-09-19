var http=require("http")
var sleep = require("system-sleep")
var os = require("os")

var hostname = os.hostname();

http.createServer(function(req, res){
    sleep(1);
    res.writeHead(200, {'Content-type': 'text/plain'});
    res.end("Swarm1111 service(Node1 app), hostname="+ hostname);
}).listen(8085);

console.log("Node1 app, port 8085, hostname="+ hostname)