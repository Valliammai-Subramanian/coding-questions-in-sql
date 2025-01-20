WITH start_airports AS (
    SELECT port_code 
    FROM airports 
    WHERE city_name = 'New York'
),
end_airports AS (
    SELECT port_code 
    FROM airports
    WHERE city_name = 'Tokyo'
),
leg1 AS (
    SELECT
        f1.start_port AS departure,
        f1.end_port AS layover,
        f1.start_time AS leg1_start_time,
        f1.end_time AS leg1_end_time
    FROM flights f1
    JOIN start_airports sa
    ON f1.start_port = sa.port_code
),
leg2 AS (
    SELECT
        f2.start_port AS layover,
        f2.end_port AS arrival,
        f2.start_time AS leg2_start_time,
        f2.end_time AS leg2_end_time
    FROM flights f2
    JOIN end_airports ea
    ON f2.end_port = ea.port_code
),
trips AS (
    SELECT 
        l1.leg1_start_time, l2.leg2_end_time,
        (strftime('%s', l2.leg2_end_time) - strftime('%s', l1.leg1_start_time)) / 60 as travel_time
    FROM leg1 l1
    JOIN leg2 l2
    ON l1.layover = l2.layover
    AND l1.leg1_end_time <= l2.leg2_start_time
)
SELECT 
    MIN(travel_time) AS shortest_flight
FROM trips;