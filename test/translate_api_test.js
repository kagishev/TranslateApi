var assert = require(“chai”).assert;
var myNewApi = require(“../lib/translate_api.js”);

describe(“myNewApi”, function () { it(“exports handleRequest”, function () { assert.typeOf(myNewApi.handleRequest, “function”); });});
