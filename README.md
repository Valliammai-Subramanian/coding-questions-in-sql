# coding-questions-in-sql
Programming trivia with answers in SQL

## Info
In this post, we will answer several programming challenge questions in SQL. For easy testing of our single-file solutions, simply copy the entire source code and paste it into an online coding tool such as Coderpad at [https://coderpad.io/sandbox].

## Code
The repository [https://github.com/Valliammai-Subramanian/coding-questions-in-sql] contains the SQL solution codes.

## Questions
More programming challenge questions in SQL will be added as time permits. Let me know if there is any particular problem you would like to have solved here.

You are given two tables, <b>flights</b> and <b>airports</b>, with the following structure: 

```bash  
      |      flights      | 
      |-----------|---|---|
      |start_time |   |   |
      |end_time   |   |   |
      |start_port |   |   |
      |end_port   |   |   |
```

and

```bash  
      |      airports     | 
      |-----------|---|---|
      |city_name  |   |   |
      |port_code  |   |   |
```

Each row in the table <b>flights</b> contains information about a flight: the time of departure(<b>start_time</b>), time of landing(<b>end_time</b>), the code of its port of departure(<b>start_port</b>) and the code of its destination port(<b>end_port</b>).

Each row in the table <b>airports</b> contains information about an airport: the city name(<b>city_name</b>) and the port code(<b>port_code</b>). Each <b>port_code</b> is assigned to at most one airport.

A passenger wants to travel from New York to Tokyo in the shortest possible time. The passenger can start at  any airport in New York and must finish their journey at any airport in Tokyo. They can change planes <b>at most once</b>. A plane change is possible, if the first flight ends no late than the start time of the second flight. Note that it is possible to change planes if the <b>end_time</b> of the first flight is equal to the <b>start_time</b> of the second flight. The second flight must start from the airport at which the first flight ended.

Write an SQL query that finds the shortest time in which this journey can occur. Return the difference between the time of departure from New York and the time of arrival in Tokyo in minutes. If such a journey is inpossible, return NULL.

## Examples
1. For the given tables <b>flights:</b>

```bash   
      |    start_time    |     end_time     | start_port | end_port | 
      |------------------|------------------|------------|----------|
      | 2023-02-10 10:00 | 2023-02-12 12:00 |     JFK    |    NRT   |
      | 2023-01-30 13:00 | 2023-01-30 16:00 |     LGA    |    LAX   |
      | 2023-01-30 17:00 | 2023-01-31 06:33 |     LAX    |    HND   |
      | 2023-01-30 15:55 | 2023-01-31 04:20 |     LAX    |    HND   |
      | 2023-03-03 04:00 | 2023-03-03 08:30 |     JFK    |    CDG   |
      | 2023-03-03 08:30 | 2023-03-03 10:30 |     CDG    |    MUC   |
      | 2023-03-03 10:40 | 2023-03-03 13:30 |     MUC    |    HND   |
```

and <b>airports:</b>

```bash   
      |  city_name  | port_code |
      |-------------|-----------|
      |   New York  |    JFK    |
      |   New York  |    LGA    | 
      |    Paris    |    CDG    | 
      |    Tokyo    |    HND    |
      | Los Angeles |    LAX    | 
      |    Tokyo    |    NRT    | 
      |    Munich   |    MUC    | 
```

your query should return:

```bash   
      | flight_time |
      |-------------|
      |    1053     |
```

The shortest flight is LGA-->LAX-->HND. it starts at 2023-01-30 13:00 and finishes at 2023-01-31 06:33, so the journey takes 1053 minutes in total. The flight JFK-->CDG-->MUC-->HND could take less time but it requires too many plane changes.

2. For the given tables <b>flights:</b>

```bash   
      |    start_time    |     end_time     | start_port | end_port | 
      |------------------|------------------|------------|----------|
      | 2023-03-03 06:00 | 2023-03-03 10:30 |     JFK    |    CDG   |
      | 2023-03-03 10:30 | 2023-03-03 12:30 |     CDG    |    MUC   |
      | 2023-03-03 12:40 | 2023-03-03 15:30 |     MUC    |    HND   |
```

and <b>airports:</b>

```bash   
      |  city_name  | port_code |
      |-------------|-----------|
      |   New York  |    JFK    | 
      |    Paris    |    CDG    | 
      |    Tokyo    |    HND    |
      |    Munich   |    MUC    | 
```

your query should return:

```bash   
      | flight_time |
      |-------------|
      |    NULL     |
```

It is impossible to fly from New York to Tokyo with at most one plane change.

*Note: Assume that there are no flights with the same <b>start_port</b> and <b>end_port</b>.

Link to solution [https://github.com/Valliammai-Subramanian/coding-questions-in-sql/tree/main/ShortestFlight].