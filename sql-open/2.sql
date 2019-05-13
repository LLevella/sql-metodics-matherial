select count(bookings.book_ref) > 0 as answer
	from bookings 
	left join tickets on bookings.book_ref=tickets.book_ref	-- внешнее левое соединение bookings и tickets
	left join ticket_flights on tickets.ticket_no=ticket_flights.ticket_no 
	left join boarding_passes on ticket_flights.ticket_no=boarding_passes.ticket_no
where boarding_passes.boarding_no is null