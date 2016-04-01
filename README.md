# Ticketee

Ticketee is a project tracking application written in Rails 4.

It allows users to create projects, comment on said projects and upload files pertaining to a ticket. A user has the ability to watch or unwatch a project and emails are delivered when new comments are added. It has an authentication system (via Devise) as well as an authorization system (via Pundit).

### Setup

Clone it:

```sh
git clone https://github.com/DaniG2k/ticketee.git
cd ticketee
```
Bundle it:

```sh
bundle install
```

Rake it:

```sh
rake db:create
rake db:migrate
```
Use it:

```sh
rails server
```

### Tests

Rspec tests and batteries are included. Just run:

```sh
bundle exec rspec ./spec
```
and watch all the green :green_heart:.
