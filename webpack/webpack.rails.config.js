// Run like this:
// cd webpack && $(npm bin)/webpack -w --config webpack.rails.config.js
// Note that Foreman (Procfile.dev) has also been configured to take care of this.

var config = require("./webpack.common.config");
config.output = { filename: "webpack-bundle.js",
                  path: "../app/assets/javascripts" };
config.module.loaders.push(
  { test: /\.scss$/, loader: "style!css!sass?outputStyle=expanded&imagePath=/assets/images"}
);
module.exports = config;

var devBuild = (typeof process.env["BUILDPACK_URL"]) === "undefined";
if (devBuild) {
  console.log("Webpack dev build for Rails");
  module.exports.devtool = "eval-source-map";
} else {
  console.log("Webpack production build for Rails");
}
