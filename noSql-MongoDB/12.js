apple=({"name" : "apple", "year": 1976});
db.companies.save(apple);
apple;
samsung=({"name" : "samsung", "year": 1987});
db.companies.insert(samsung);
samsung;
steve = ({"name": "Steve", "age": 25, company: new DBRef('companies', apple._id)});
db.users.save(steve);
db.companies.findOne({_id: steve.company.$id});