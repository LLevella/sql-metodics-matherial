
db.users.update({name : "Tom"}, {name: "Tom", age : 25}, {upsert: true});
db.users.find();
db.users.update({name : "Tom"}, {name: "Tom", age : 25}, {upsert: true});
db.users.find();
db.users.update({name : "Tom", age: 28}, {$set: {age : 30}});
db.users.find({name: "Tom"});
db.users.update({name : "Tom", age: 28}, {$set: {salary : 300}});
db.users.find({name: "Tom"});
db.users.update({name : "Tom"}, {$set: {name: "Tom", age : 25}}, {multi:true})
db.users.find({name: "Tom"});
db.users.update({name : "Tom"}, {$inc: {age:2}})
db.users.find({name: "Tom"});
db.users.update({name : "Tom"}, {$unset: {salary: 1}})
db.users.find({name: "Tom"});
db.users.update({name : "Tom"}, {$unset: {salary: 1, age: 1}})
db.users.find({name: "Tom"});
db.users.updateOne({name : "Tom", age: 29}, {$set: {salary : 360}})
db.users.find({name: "Tom"});
db.users.updateMany({name : "Tom"}, {$set: {salary : 560}})
db.users.find({name: "Tom"});
