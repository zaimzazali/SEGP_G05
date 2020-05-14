var express = require('express')
var fs = require('fs')

var app = express()

app.use('/node_modules/', express.static('./node_modules/'))
app.use('/public/', express.static('./public/'))
app.use('/views/', express.static('./views/'))

app.engine('html', require('express-art-template'))

app.get('/', function (req, res) {
    fs.readFile('./db.json', 'utf8', function (err, data) {
        if(err){
            return res.status(500).send('server error.')
        }

        var projects = JSON.parse(data).projects
        res.render('project_list.html', {
            projects: projects
        })
    })

})

app.listen(3000, function () {
    console.log('running...')
})