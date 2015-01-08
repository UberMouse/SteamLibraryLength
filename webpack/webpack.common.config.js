// Common webpack configuration used by webpack.hot.config and webpack.rails.config.

var path = require("path");

module.exports = {
  context: __dirname, // the project dir
  entry: [ "components/app" ],
  resolve: {
    root: [path.join(__dirname, "assets/javascripts"),
      path.join(__dirname, "assets/stylesheets")],
      extensions: ["", ".webpack.js", ".web.js", ".js", ".jsx", ".scss", ".css", "config.js", ".cjsx", ".coffee"]
  },
  module: {
    loaders: [
      { test: require.resolve("react"), loader: "expose?React" },
      { test: /\.cjsx$/, loaders: ["react-hot", "coffee", "cjsx"] },
      { test: /\.coffee$/, loader: "coffee" },
      { test: /\.css$/, loader: "style-loader!css-loader" },
      { test: /\.scss$/, loader: "style!css!sass?outputStyle=expanded&imagePath=/assets/images"},

      // The url-loader uses DataUrls. The file-loader emits files.
      { test: /\.woff$/,   loader: "url-loader?limit=10000&minetype=application/font-woff" },
      { test: /\.ttf$/,    loader: "file-loader" },
      { test: /\.eot$/,    loader: "file-loader" },
      { test: /\.svg$/,    loader: "file-loader" }
    ]
  }
};
