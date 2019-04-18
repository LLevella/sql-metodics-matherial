alter table public.customers 
	add phone varchar(20) null,
	add	address varchar(30) not null default 'unknown';

alter table public.customers 
	drop column address;

alter table public.customers
	alter column firstName type varchar(50);
	
alter table public.customers
	alter column lastName drop not null;
	
alter table public.customers
	alter column lastName set not null,
	add check (phone is not null),
	add unique (phone);

alter table public.customers
	rename column phone TO contact;
