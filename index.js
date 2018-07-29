var package = require("./package.json");
var TranslateAPI = require("./lib/translate_api.js")

    console.log("loaded" + package.name + ",version" + package.version);

exports.handler = function(event,context) {
    TranslateAPI.handleRequest(event,context.done);
}
