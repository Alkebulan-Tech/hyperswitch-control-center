const path = require("path");
const webpack = require("webpack");
const { merge } = require("webpack-merge");
const common = require("./webpack.common.js");

const appName = process.env.appName || "hyperswitch"; // Ensure appName is defined
const integ = process.env.integ;

let port = 9000;
let proxy = {};

let configMiddleware = (req, res, next) => {
  if (req.path.includes("/config/") && req.method === "GET") {
    let { domain = "default" } = req.query;
    import("./src/server/config.mjs")
      .then((result) => {
        result.configHandler(req, res, false, domain);
      })
      .catch((error) => {
        console.error("Error in config middleware:", error);
        res.writeHead(500, { "Content-Type": "text/plain" });
        res.end("Internal Server Error");
      });
    return;
  }

  next();
};

let devServer = {
  static: {
    directory: path.resolve(__dirname, "dist", appName),
  },
  compress: true,
  hot: true,
  port: port,
  historyApiFallback: {
    rewrites: [{ from: /^\/dashboard/, to: "/index.html" }],
  },
  proxy: proxy,
  setupMiddlewares: (middlewares, devServer) => {
    devServer.app.use(configMiddleware);
    return middlewares;
  },
};

console.log(devServer);
module.exports = merge([
  common(appName),
  {
    mode: "development",
    devServer: devServer,
  },
]);
