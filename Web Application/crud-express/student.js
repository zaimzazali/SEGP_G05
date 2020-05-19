var fs = require('fs')
var dbPath = './db.json'

exports.find = function (callback) {
    fs.readFile(dbPath, 'utf8', function (err, data) {
        if (err) {
            return callback(err)
        }
        callback(null, JSON.parse(data).projects)
    })
}

exports.findById = function (id, callback) {
    fs.readFile(dbPath, 'utf8', function (err, data) {
        if (err) {
            return callback(err)
        }
        var projects = JSON.parse(data).projects
        var ret = projects.find(function (item) {
            return item.id === parseInt(id)
        })
        callback(null, ret)
    })
}

exports.save = function (project, callback) {
    fs.readFile(dbPath, 'utf8', function (err, data) {
        if (err) {
            return callback(err)
        }
        var projects = JSON.parse(data).projects

        project.id = projects[projects.length - 1].id + 1
        project.file="uploaded"

        projects.push(project)

        var fileData = JSON.stringify({
            projects: projects
        })

        fs.writeFile(dbPath, fileData, function (err) {
            if (err) {

                return callback(err)
            }

            callback(null)
        })
    })
}

exports.updateById = function (project, callback) {
    fs.readFile(dbPath, 'utf8', function (err, data) {
        if (err) {
            return callback(err)
        }
        var projects = JSON.parse(data).projects

        project.id = parseInt(project.id)
        project.file="uploaded"

        var stu = projects.find(function (item) {
            return item.id === project.id
        })

        for (var key in project) {
            stu[key] = project[key]
        }

        var fileData = JSON.stringify({
            projects: projects
        })

        fs.writeFile(dbPath, fileData, function (err) {
            if (err) {
                return callback(err)
            }
            callback(null)
        })
    })
}

exports.deleteById = function (id, callback) {
    fs.readFile(dbPath, 'utf8', function (err, data) {
        if (err) {
            return callback(err)
        }
        var projects = JSON.parse(data).projects

        var deleteId = projects.findIndex(function (item) {
            return item.id === parseInt(id)
        })

        projects.splice(deleteId, 1)

        var fileData = JSON.stringify({
            projects: projects
        })

        fs.writeFile(dbPath, fileData, function (err) {
            if (err) {

                return callback(err)
            }
            callback(null)
        })
    })
}
