var webpack = require('webpack');
var WebpackDevServer = require('webpack-dev-server');
var config = require('./webpack.hot.config');

var pushStateHook = function (rootUrl) {
  var path = require('path');
  return function (req, res, next) {
    res.setHeader("Access-Control-Allow-Origin", "*")
    var ext = path.extname(req.url);
    if ((ext === '' || ext === '.html') && req.url !== '/') {
      req.pipe(request(rootUrl)).pipe(res);
    } else {
      next();
    }
  };
};

var server = new WebpackDevServer(webpack(config), {
  //contentBase: "/public",
  publicPath: config.output.publicPath,
  hot: true,
  noInfo: false,
  stats: {colors: true}
});

server.app.use(pushStateHook("http://localhost:3000"))

server.listen(3000, 'localhost', function(err, result) {
  if (err) { console.log(err); }
  console.log('Listening at localhost:3000...');
});
