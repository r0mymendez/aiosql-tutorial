# ⚙️ What is aiosql library?

Aiosql is a Python library that simplifies the writing of SQL queries in separate files from your main Python project code. These queries, stored in SQL files, are then transformed into methods within a Python object. 
Another notable feature of Aiosql is its ability to generate dynamic methods that accept parameters, enabling flexible query execution and effective interaction with the underlying database. This separation of SQL queries from the main Python code promotes cleaner and more modular code, enhancing project readability and maintainability


<center>

![aiosql-feature](img/aiosql-0.png)

</center>

# ⚙️ Key Features of Aiosql Library

Below, I will share a series of features that this library already has or can have based on its usage:
* Provides **CRUD functionality** (Create: Insert, Read: Select, Update , Delete) for database operations.
* **Separates Python code** from SQL code, making it easier to locate queries within projects with multiple databases.
* Each query can be assigned a **descriptive name and docstring**, similar to Python functions, enabling documentation of the query.
* Facilitates the creation of **a query catalog** within the project, aiding in identification based on entities, databases, or other grouping criteria.
* Enables easy generation of **dynamic queries** with the ability to pass dynamic values and modify them as needed.

<center>

![aiosql-feature](img/aiosql-1.png)

</center>


---


### 🛠️ Tutorial
Explore this tutorial, which covers database creation, defining queries from user stories, and additional functionality such as creating a query catalog.

You can access the code in the 'main.ipynb' notebook, where you'll engage in a simple exercise using three user stories to simulate a project.




---

[![Buy Me A Coffee](https://img.shields.io/badge/Buy%20Me%20A%20Coffee-support%20my%20work-FFDD00?style=flat&labelColor=101010&logo=buy-me-a-coffee&logoColor=white)](https://www.buymeacoffee.com/r0mymendez)