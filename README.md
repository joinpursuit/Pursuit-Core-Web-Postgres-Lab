# Pursuit-Core-Web-Postgres-Lab

Build a database for a Facebook-style app. Your Database should have **SQL tables** for the following data: Users, Posts, and Likes. Write your SQL code in a file `facebook_db.sql`. 


## v1

In the file `facebook_db.sql` have the Database and tables creation SQL statements under the the following SQL comment:
```
-- Database & Table Creation
```

### Tables

Let's use the conceptual structure of _primary_ and _foreign_ keys for expressing the relationships of our data. Our database, at the end of the day, should be structured like this:

- Users (_table_)
  - `id` (_column_): integer, **primary key**
  - `name`: string
  - `age`: integer
- Posts
  - `id`: integer, **primary key**
  - `poster_id`: integer, **foreign key** referencing the column `id` in Users.
  - `body`: string
- Likes
  - `id`: integer, **primary key**
  - `liker_id`: integer, **foreign key** referencing the column `id` in Users
  - `post_id`: integer, **foreign key** referencing the column `id` in Posts.

### Diagram
![database diagram v1](./assets/facebook_db_diagram_v1.png)

### Explanation

- Users are the main actors in our Database.
- Users can create many Posts.
- A Post can be liked by many Users.
- Posts are connected to users through the `poster_id` column.
- Likes are connected to Posts through the `post_id` and to the User that liked the post by the `liker_id` column.

### Add and Manipulate Data

Write SQL statements that accomplish/express the following. Have these SQL queries/statements under the following SQL comment:
```
-- Add and Manipulate Data
```

- [ ] Add 5 users
- [ ] One user should have three posts. Add at least one post for the rest of users. 
- [ ] User with `id = 1` likes all the other users posts.
- [ ] User with `id = 2` likes only his/her own post.
- [ ] User's `2` & `1` posts are liked by user `3` 
- [ ] User `4` likes all posts except her own and user's `1`.
- [ ] All the posts of user's `1`, `2`, `3` are liked by user `5`.
- [*] Update the age of user with `id` 5 to be `31`.
- [*] Update the name of user `3` to be `Alfred`
- [* ] User `1` stops liking user's `2` post.
- [ ] The user who had three posts decides to delete his/her last post.
- [ ] User `2` decides to delete their account from of social media app. 
- [ ] Find the user who has given the most likes.
- [ ] Find the most liked post.
- [ ] Find all the information of the user how posted the most liked post.

### Keep in mind.

Here is an example syntax for adding a couple of users:

```
INSERT INTO users (name, age) VALUES ("Victoria Adams", 47), ("Gerson Lopez", 33);
```

A couple of things are critical about this:

- Because the `id` column is a `SERIAL PRIMARY KEY`, it will automatically create new `id`s when you add new users. So, we aren't including `id`s in our columns here.
- In our `VALUES` section, each value must have exactly the same number of columns as the model outlined in `INSERT INTO`. For example, this one has two columns (`(name, age)`), and therefore each User added has two columns as well.

Underneath your table structure, go ahead and add some `INSERT` statements to seed your database with some information.

**Hint**: Be sure to create tables/items with primary keys before you create tables/items with their corresponding foreign keys! For example, I'm not going to create Posts before I create Users- my database won't be able to recogize the User my new Post is connected to, because I haven't created one yet!


## v2: Bonus

### Tables
Add to your database the following tables: 

- Comments
  - `id`: integer, **primary key**
  - `commenter_id`: integer, **foreign key** referencing the column `id` in Users.
  - `post_id`: integer, **foreign key** referencing the column `id` in Posts.
  - `body`: string
- Albums
  - `id`: integer, **primary key**
  - `user_id`: integer, **foreign key** referencing the column `id` in Users
- Pictures
  - `id`: integer, **primary key**
  - `album_id`: integer, **foreign key** referencing the column `id` in Albums
  - `url`: string

### Diagram
![facebook-style database diagram](./assets/facebook_style_db_diagram.png)

[Interactive Diagram Here](https://dbdiagram.io/d/5db872c3fa792a62f50da1a5)

### Explanation
Let's think about these associations. In a vacuum, it might not be clear what each individual one is doing. However, we can gain a better understanding when we think about what, exactly, each of these associations is for.

Let's break it down:

- Users can create many Posts and Albums. They can also create Likes and Comments on Posts. Therefore, all of these tables have a direct relationship to Users via some kind of `user_id` column.
- Posts can have many Comments and Likes.
- Comments and Likes are connected to both the Users table and the Posts table. This is because, even though Posts are made by one user, a comment could be made by a different user.
- Albums contain many Pictures, but each Picture isn't associated with a User - they are associated with an Album, which is then associated with a User. This is because only the user who created the Album can add a Picture to it. Therefore, a `user_id` column in Pictures would be redundant.

## Resources

* [SQLBolt: Inserting Rows Tutorial](https://sqlbolt.com/lesson/inserting_rows)
* [SQLBolt: Updating Rows Tutorial](https://sqlbolt.com/lesson/updating_rows)
* [SQLBolt: Deleting Rows Tutorial](https://sqlbolt.com/lesson/inserting_rows)
