db.users.remove({name : "Tom"}, true) /* true удаление 1 строки */
db.users.find();
db.users.remove({name : /B\w+/i}, true);
db.users.find();
db.users.remove({age: {$lt : 30}}, true);
db.users.find();
db.users.remove({});
db.users.drop();
db.stats();
db.dropDatabase();
show dbs;
