db;
use init;
db.createCollection("accounts");
db.accounts.renameCollection("users");
db.users.insertOne({"name": "Tom", "age": 28, languages: ["english", "spanish"]});
db.users.find();
db.users.insertOne({"_id": 123457, "name": "Tom", "age": 32, languages: ["english", "german"]});
db.users.insertMany([{"name": "Bob", "age": 26, languages: ["english", "frensh"]}; 
db.users.insert({"name": "Tom", "age": 28, languages: ["english", "spanish"]});
document=({"name": "Bill", "age": 32, languages: ["english", "french"]});
db.users.insert(document);
db.users.find();
load("/local/store/sql-metodics-matherial/sql-metodics-matherial/noSql/users.js");
db.users.find();