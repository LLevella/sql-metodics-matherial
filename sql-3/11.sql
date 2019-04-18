select sid, pid, jid,
   	min(num) as r_min,
		max(num) as r_max,
		sum(num) as r_sum
	from
		public.supply
group by sid, pid, jid;
		
select sid, pid, 	jid,
   	min(num) over (partition by pid) as r_min,
		max(num) over (partition by pid) as r_max,
		sum(num) over (partition by pid) as r_sum,
		row_number() over (partition by pid order by jid) as r_num
	from
		public.supply;
