var fs = require('fs')
var Student = require('./student')

var express = require('express')

var router = express.Router()

router.get('/students', function (req, res) {
    Student.find(function (err, projects) {
        if (err) {
            return res.status(500).send('Server error.')
        }
        res.render('project_list.html',{
            projects:projects
        })
    })
})

router.get('/students/user', function (req, res) {
    res.render('user.html')
})

router.get('/students/index', function (req, res) {
    res.render('index.html')
})

router.post('/students/index', function (req, res) {

    Student.save(req.body, function (err) {
        if (err) {
            return res.status(500).send('Server error.')
        }

        res.render('submit_success.html')

    })

})

router.get('/students/edit', function (req, res) {

    Student.findById(parseInt(req.query.id), function (err, project) {
        if (err) {
            return res.status(500).send('Server error.')
        }
        res.render('edit.html', {
            project:project
        })
    })
})

router.post('/students/edit', function (req, res) {

    Student.updateById(req.body, function (err) {
        if (err) {
            return res.status(500).send('Server error.')
        }
        res.render('submit_success.html')
    })
})


router.get('/students/delete', function (req, res) {

    Student.deleteById(req.query.id, function (err) {
        if (err) {
            return res.status(500).send('Server error.')
        }
        res.redirect('/students')
    })
})


module.exports = router