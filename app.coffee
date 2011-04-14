fs = require 'fs'
web = require("./web")
server = require("./server")

config = JSON.parse fs.readFileSync("config.json")

web.run(config.web.port)
server.run(config.server.port)

