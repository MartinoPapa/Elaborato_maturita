const SQLport = 3306;
const database = "legislature_repubblica";

module.exports =
{
    queryManager: function (msg, callback) {
        var SqlConnection = require('mysql').createConnection({
            host: "localhost",
            user: msg.username,
            password: msg.password,
            database: database,
            port: SQLport
        });
        SqlConnection.query(msg.query, function (err, result, fields) {
            if (err) callback(err, null);
            else callback(null, result);
        });
    },
    connectionManager: function (msg, callback) {
        var SqlConnection = require('mysql').createConnection({
            host: "localhost",
            user: msg.username,
            password: msg.password,
            database: database,
            port: SQLport
        });

        SqlConnection.connect(function (err, result) {
            if (err) callback(err, null);
            else callback(null, result);
        });
    }
}
