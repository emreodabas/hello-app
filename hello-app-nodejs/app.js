var http = require("http");
http.createServer(function (req, res) {
    res.write("Hello " + req.url);
    res.end(); //end the response
}).listen(3000, function () {
    console.log("server start at port 3000");
});