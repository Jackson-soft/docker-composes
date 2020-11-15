rs.initiate({
    _id: "BigSur",
    configsvr: true,
    members: [
        {_id: 0, host: "mongo-configsvr0:27019"},
        {_id: 1, host: "mongo-configsvr0:27019"},
        {_id: 2, host: "mongo-configsvr0:27019"},
    ],
});