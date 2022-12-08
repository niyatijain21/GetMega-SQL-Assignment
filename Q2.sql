select
	player_id,
	game_name,
	ntp_final
from
	(
		select
			player_id,
			max(ntp) as ntp_final
		from
		(
			select
				player_id,
				game_id,
				sum(number_of_times_played) as ntp
			from
				TableA
			group by
				player_id,
				game_id
		) as aa
		group by
			player_id
	) as a
	left join
	(
		select
				player_id,
				game_id,
				sum(number_of_times_played) as ntp_final
			from
				TableA
			group by
				player_id,
				game_id
	) as b
	on a.ntp_final=b.ntp_final
	left join
	(
		select
			game_id,
			game_name
		from 
			tableB
	) as c
	on b.game_id=c.game_id
