# Subscribe

## What it does

Let one user (email) subscribe another's update

## How to call

```
curl -X POST -H 'Content-Type:application/json' -d '{"requestor":"f@test.com", "target":"c@test.com"}' https://sheltered-fortress-41528.herokuapp.com/api/subscribe
```

## Expected result

If both emails valid:

```{"success":true}```

## Possible Error

If either of the email is not valid, the request will fail with:

```{"status":"bad_request","error":"Validation failed: Source is invalid","message":"Invalid parameter"}```

If the subscribing relationship already exists, the request will fail with:

```{"status":"bad_request","error":"Validation failed: Source has already been taken","message":"Invalid parameter"}```