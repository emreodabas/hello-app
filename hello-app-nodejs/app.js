var http = require("http");
http.createServer(function (req, res) {
    res.write("Hello " + req.url.replace("/", " "));
    res.end(); //end the response
}).listen(8080, function () {
    console.log("server start at port 8080");
});