db.users.find();
db.users.find().pretty();
db.users.find({name: "Tom"});
db.users.find({name: "Tom", age: 32});
db.users.find({languages: "english"});
db.users.find({languages: ["english", "german"]});
db.users.find({"languages.0": "english"});
db.users.find({"languages.1": "french"});
db.users.find({name: "Tom"}, {age: 1});
db.users.find({name: "Tom"}, {age: 0});
db.users.find({name: "Tom"}, {age: true, _id: false});
db.users.insert({"name": "Alex", "age": 28, company: {"name":"microsoft", "country":"USA"}});
db.users.find({"company.name": "microsoft"});
