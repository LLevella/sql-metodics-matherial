db.users.count();
db.users.find({name: "Tom"}).count();
db.users.find({name: "Tom"}).skip(2).count(true);
db.users.distinct("name");
db.users.group ({key: {name : true}, initial: {n : 0},
	reduce : function (curr, res){res.n += 1}});
db.users.group({
		key: {name : true}, initial: {sum : 0, n: 0, avg: 1}, 
		reduce : function (curr, res){res.sum += curr.age; res.n +=1;}, 
		finalize: function(res){ if(res.n!=0) res.avg = res.sum/res.n; else res.avg= res.sum;}
	});
