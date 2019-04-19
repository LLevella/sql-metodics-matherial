
alter table public.job
	add primary key (id);
	
alter table public.products
	add primary key (id);
	
alter table public.shipper
	add primary key (id);


alter table public.supply
	add primary key (sid, pid, jid),
	add foreign key (sid) references public.shipper (id) on delete cascade,
	add foreign key (jid) references public.job (id) on delete restrict,
	add foreign key (pid) references public.products (id) on delete restrict;
