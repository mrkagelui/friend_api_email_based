# Get friends

## What it does

Retrieve all friends of an email

## How to call

```
curl -X GET -H 'Content-Type:application/json' -d '{"email":"c@test.com"}' https://sheltered-fortress-41528.herokuapp.com/api/get_friends
```

## Expected result

```{"success":true,"friends":["b@test.com","d@test.com"],"count":2}```

## Possible Error

None
