# Add friend

## What it does

Add a friend relationship for two emails

## How to call

```
curl -X POST -H 'Content-Type:application/json' -d '{"friends":["a@test.com","b@test.com"]}' https://sheltered-fortress-41528.herokuapp.com/api/add_friend
```

## Expected result

If both emails are valid:

```{"success":true}```

## Possible Error

If either of the email is not valid, the request will fail with:

```{"status":"bad_request","error":"Validation failed: Friend2 is invalid","message":"Invalid parameter"}```

If more than two emails are supplied, only the first two will be processed

If the friendship already exists, the request will fail with:

```{"status":"bad_request","error":"Validation failed: Friend1 has already been taken, Friend2 has already been taken","message":"Invalid parameter"}```

If one of the users is blocking another, this will fail with:

```{"status":"bad_request","error":"one of the users is blocking another","message":"Friendship not added"}```