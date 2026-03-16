extends Window

@export var manual_text: RichTextLabel

func _ready() -> void:
	manual_text.text = "📘 Database Simulator – Player Guide
Basic SQL Operators

Welcome to the Database Simulator!
In this game, you will interact with a virtual database using SQL commands. Below is a basic guide to the most important SQL operators you will use.

1️⃣ SELECT – Retrieve Data

The SELECT statement is used to retrieve data from a table.

Syntax:

SELECT column_name FROM table_name;

Example:

SELECT first_name FROM persons;
This query returns all names from the persons table.

To select all columns:
SELECT * FROM persons;

2️⃣ WHERE – Filter Results

The WHERE clause is used to filter records.

Syntax:

SELECT column_name FROM table_name
WHERE condition;

Example:

SELECT * FROM persons
WHERE age > 30;
This query returns persons older than 30.

3️⃣ Comparison Operators

Used inside WHERE:

| Operator | Meaning          |
| -------- | ---------------- |
| =        | Equal            |
| != or <> | Not equal        |
| >        | Greater than     |
| <        | Less than        |
| >=       | Greater or equal |
| <=       | Less or equal    |

4️⃣ Logical Operators

Combine multiple conditions:

| Operator | Meaning                             |
| -------- | ----------------------------------- |
| AND      | Both conditions must be true        |
| OR       | At least one condition must be true |
| NOT      | Reverses a condition                |

5️⃣ORDER BY – Sort Results

Used to sort query results.

SELECT * FROM persons
ORDER BY id;

6️⃣ INNER JOIN – Combine Data from Multiple Tables

INNER JOIN is used to combine rows from two tables based on a related column.

It returns only the records that have matching values in both tables.

Syntax:

SELECT columns
FROM table1
INNER JOIN table2
ON table1.column = table2.column;

Example:

Suppose we have two tables:

persons(id, first_name, last_name, age, occupation, location_id)

locations (id, city, state)

SELECT first_name, last_name, state from  persons INNER JOIN locations
ON persons.location_id = locations.id;

What Does This Query Do?

This query retrieves:

first_name from the persons table

last_name from the persons table

state from the locations table

It combines data from two tables using INNER JOIN.
Step-by-Step Explanation

1️⃣ The query starts from the persons table.
2️⃣ It joins the locations table.
3️⃣ The connection is made using this condition:
persons.location_id = locations.id

This means:

Each person has a location_id

That location_id matches the id in the locations table

When the values match, the rows are combined.

What Will Be Returned?

The result will show:

| first_name | last_name | state |
| ---------- | --------- | ----- |
| John       | Smith     | Texas |
| Anna       | Brown     | Ohio  |

Only persons whose location_id matches an existing locations.id will appear.

If a person has a location_id that does NOT exist in the locations table, they will NOT appear in the result.

7️⃣ IN – Match Multiple Possible Values

The IN operator allows you to specify multiple values in a WHERE clause.

It is a shorter alternative to using multiple OR conditions.

SELECT column
FROM table
WHERE column IN (value1, value2, value3);

Example:

SELECT * FROM persons
WHERE age IN (40, 41, 44);

This query returns persons who are 40, 41, or 44 years old."

	
func _on_close_requested() -> void:
	hide()

func load_text_from_file():
	var manual = FileAccess.open("res://Player Guid.txt", FileAccess.READ)
	self.text = manual.get_as_text()
	manual.close()
