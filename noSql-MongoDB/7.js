db.users.find ({company: {$exists:true}});
db.users.find ({age: {$type:"string"}});
db.users.find ({age: {$type:"number"}});
db.users.find ({name: {$regex:"b"}});
db.users.find ({name: {$regex:"om$"}});
db.users.find({name:/T\w+/i});