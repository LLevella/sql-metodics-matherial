db.users.find ({languages: {$all : ["english", "french"]}});
db.grades.insertMany([{student: "Tom", courses:[{name: "Java", grade: 5}, {name: "MongoDB", grade: 4}]}, 
{student: "Alice", courses:[{name: "C++", grade: 3}, {name: "MongoDB", grade: 5}]}])
db.grades.find({courses: {$elemMatch: {name: "MongoDB", grade: {$gt: 3}}}});
db.users.find ({languages: {$size:2}});
