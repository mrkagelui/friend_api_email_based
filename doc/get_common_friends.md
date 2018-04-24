# Get common friends

## What it does

Retrieve all common friends of specified users (emails)

## How to call

```
curl -X GET -H 'Content-Type:application/json' -d '{"friends":["b@test.com","d@test.com"]}' https://sheltered-fortress-41528.herokuapp.com/api/get_common_friends
```

## Expected result

If the emails are valid and they have some common friends, friends detail that resemble:

```{"success":true,"friends":["c@test.com"],"count":1}```

- Note: You may specify more than two emails

## Possible Error

None