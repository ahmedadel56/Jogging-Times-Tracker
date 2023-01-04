#  Jogging-Times-Tracker

This is the back-end API for Jogging-Times Tracker+ tracks your distance, pace, and more. It's the most accurate running distance/time tracker available on the market, packed into the simplest & most gorgeous interface. It also maintains a history of your runs and improvements over time and shows you a complete log of your running activities


- Authentication: Create account/login/logout.
- When logged in, a user can view, edit and delete entered `jogging times`.
- Implement three roles with different permission levels:
- A regular user would only be able to CRUD on their owned records
- A user manager would be able to CRUD users, and an admin would be able to CRUD all records and users.
- Each time entry when entered has a date, distance, and time.
- Filter by dates from-to.
- Report on average speed & distance per week.



Read the complete documentation [here](http://localhost:3000/api-docs/index.html).



## Built With

- Ruby 3.1.2
- Ruby on Rails 7.0.3
- PostgreSQL 
- JWT
- Devise

## Getting Started

To get a local copy up and running follow these simple example steps.

- Click on the top right green "code" button.
- On the dropdown menu, choose the "download with zip" button.
- After downloading, extract the zip file and you have the project on your machine.
- Make sure that your PostgreSQL server is running and that you can establish a connection with the database.
- Execute `rails db:create` to create the database.
- Execute `rails db:migrate` to migrate the database.
- Run `rails s` to run the application.


## Tests

- If you want to run some unit tests, all you need to do is:
- On your terminal execute: `gem install rspec`
- Run the `rspec` command in this case over the path of `spec/`, and the resulting command will look like this: `rspec spec/`.
- If you want to run the tests over the entire project, you can execute the following command: `rspec`
- you can make a documentation test by just running `rake rswag:specs:swaggerize `.

## Recorded Videos

[Vidoe 1](https://www.loom.com/share/a875eb779d2a45d29fcd3843acb7db51)
[Vidoe 2](httpshttps://www.loom.com/share/3da8d3898cad4dfab331e602a16672b7)



## Authors

👤 **Ahmed Adel**

- GitHub: [Ahmed](https://github.com/ahmedadel56)
- LinkedIn: [Ahmed Adel](https://www.linkedin.com/in/ahmed-adel56/)


## 🤝 Contributing

Contributions, issues, and feature requests are welcome!
Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](./LICENSE) licensed.