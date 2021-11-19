const express = require('express')
const bodyParser = require('body-parser')
const router = require('./network/routes')
const config = require('./config')
const db = require('./db.config')
var cors = require('cors')

var app = express()
app.use( bodyParser.json() )
app.use( bodyParser.urlencoded({extended:false}) )
app.use(cors())
router(app)

app.use( config.publicRoute , express.static('public'))
app.listen( config.port )
console.log( `La aplicación está escuchando en ${config.host}:${config.port}${config.publicRoute}` )
