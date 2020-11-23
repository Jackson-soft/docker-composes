rs.initiate({
    _id: "BigBoss",
    version: 1,
    members: [
        {_id: 0, host: "mongodb:27017"},
    ],
});
db.createUser({user: "sa", pwd: "f9bd44806614!", roles: [{role: "root", db: "admin"}]});
db.auth("sa", "f9bd44806614!");
