# Friends management API

A simple friends management API based on emails, to allow clients add friends, get friends, get common friends, subscribe and block one another, and get receivers if one sends a text. It exposes the following endpoints:

- [POST 'add_friend'](doc/add_friend.md)
- [GET 'get_friends'](doc/get_friends.md)
- [GET 'get_common_friends'](doc/get_common_friends.md)
- [POST 'subscribe'](doc/subscribe.md)
- [POST 'block'](doc/block.md)
- [POST 'get_receivers'](doc/get_receivers.md)

## Getting Started

### Prerequisites

```
git
Ruby (version 2.3.x)
Rails (version 5.1.6)
```

### Installing

Clone the repo

```
git clone git@github.com:mrkagelui/friend_api_email_based.git
```

Install gems

```
bundle
```

Database migration

```
rails db:migrate
```

Now you may deploy a local server with

```
rails s
```

and you may test with curl, such as:

```
curl -X POST -H 'Content-Type:application/json' -d '{"requestor":"a@b.com", "target":"b@a.com"}'  http://localhost:3000/api/follow
```

which will return

```{"success":true}```

## Running the tests

BDD (Behavior Driven Development) is used with rspec, run all the specs with

```
rspec
```

or run them individually under spec/ directory

## Deployment

On heroku, deploy with

```
heroku login
heroku keys:add (if you have never)
heroku create
git push heroku master
```

Currently, the app is deployed on https://sheltered-fortress-41528.herokuapp.com, you may call it with CURL

```curl -X POST -H 'Content-Type:application/json' -d '{"friends":["a@test.com","b@test.com"]}' https://sheltered-fortress-41528.herokuapp.com/api/add_friend```

## Versioning

Specify desired version in request header, such as `curl -X POST -H 'Accept:application/vnd.friends.v1'`, otherwise the default will be the latest version

