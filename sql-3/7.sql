SELECT sid, pid, count(jid), avg(num), max(num), sum(num), min(num)
	FROM public.supply
group by sid, pid;

SELECT sid, pid, count(jid), avg(num), max(num), sum(num), min(num)
	FROM public.supply
group by sid, pid
having avg(num) = (max(num) + min(num))/2