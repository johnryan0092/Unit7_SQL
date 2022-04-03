----Count of Transactions------
create view transaction_count as
select c.name, count(a.id) as "Transactions" from transaction a
inner join credit_card b on a.card = b.card
inner join card_holder c on b.cardholder_id = c.id
group by c.name
order by count(a.id) desc

----Count of Transactions under $2 by cardholder------
create view transaction_count_under2 as
select c.name, count(a.id) as "Transactions" from transaction a
inner join credit_card b on a.card = b.card
inner join card_holder c on b.cardholder_id = c.id
where a.amount <2
group by c.name
order by count(a.id) desc

----Count of Transactions under $2-----
create view total_transactions_under2 as
select count(a.id) as "Transactions" from transaction a
inner join credit_card b on a.card = b.card
inner join card_holder c on b.cardholder_id = c.id
where a.amount <2

-----Rationale to suggest CC hacked---------
select * from transaction a
inner join credit_card b on a.card = b.card
inner join card_holder c on b.cardholder_id = c.id
where c.name = 'Megan Price' and a.amount <2

----top 100 --- 
create view top100_early_transactions as
select a.*,b.cardholder_id,c.name from transaction a
inner join credit_card b on a.card = b.card
inner join card_holder c on b.cardholder_id = c.id
where cast(a.date as time) not between '7:00:00' and '9:00:00'
order by amount desc
limit 100

----top5 merchants prone to attack-----
create view top5_merchants as
select b.name, count(a.id) as "Transactions Under 2$" from transaction a
inner join merchant b on a.id_merchant = b.id
where a.amount <2
group by b.name
order by count(a.id) desc
limit 5

---data load for cardholders 2 & 18------
select b.cardholder_id,a.date,a.amount from transaction a
inner join credit_card b on a.card = b.card
inner join card_holder c on b.cardholder_id = c.id
where cardholder_id in (2,18)
order by a.date asc

