
alter table public.job
	add primary key (id);
	
alter table public.products
	add primary key (id);
	
alter table public.shipper
	add primary key (id);


alter table public.supply
	add primary key (sid, pid, jid),
	add FOREIGN KEY (sid) REFERENCES public.shipper (id) ON DELETE cascade,
	add FOREIGN KEY (jid) REFERENCES public.job (id) ON DELETE restrict,
	add FOREIGN KEY (pid) REFERENCES public.products (id) ON DELETE RESTRICT;
