db.companies.insert({"_id" : "microsoft", year: 1974});
db.users.insert({name: "Tom", age: 28, company: "microsoft"});
user = db.users.findOne();
db.companies.findOne({_id: user.company});