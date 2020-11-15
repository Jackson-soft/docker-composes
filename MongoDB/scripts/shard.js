rs.initiate({
    _id: "BigBoss",
    version: 1,
    members: [
        {_id: 0, host: "mongodb-primary:27017"},
        {_id: 1, host: "mongodb-secondary0:27017"},
        {_id: 2, host: "mongodb-secondary1:27017"},
    ],
});
