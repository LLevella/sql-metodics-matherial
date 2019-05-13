db.users.find({name: "Tom"});
db.users.updateOne({name : "Tom"}, {$push: {languages: "russian"}});
db.users.find({name: "Tom"});
db.users.update({name : "Tom"}, {$push: {languages: {$each: ["russian", "spanish", "italian"]}}});
db.users.find({name: "Tom"});
db.users.update({name : "Tom"}, {$push: {languages: {$each: ["german", "spanish", "italian"], $position:1, $slice:5}}})
db.users.find({name: "Tom"});
db.users.update({name : "Tom"}, {$addToSet: {languages: "russian"}});
db.users.find({name: "Tom"});
db.users.update({name : "Tom"}, {$addToSet: {languages: "chinese"}});
db.users.find({name: "Tom"});
db.users.update({name : "Tom"}, {$pop: {languages: 1}});
db.users.find({name: "Tom"});
db.users.update({name : "Tom"}, {$push: {languages: "english"}});
db.users.update({name : "Tom"}, {$push: {languages: "english"}});
db.users.update({name : "Tom"}, {$push: {languages: "english"}});
db.users.find({name: "Tom"});
db.users.update({name : "Tom"}, {$pull: {languages: "english"}});
db.users.find({name: "Tom"});
db.users.update({name : "Tom"}, {$pullAll: {languages: ["german", "spanish", "italian"]}});
db.users.find({name: "Tom"});