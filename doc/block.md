# Block

## What it does

Let one user (email) block another

## How to call

```
curl -X POST -H 'Content-Type:application/json' -d '{"requestor":"e@test.com", "target":"c@test.com"}' https://sheltered-fortress-41528.herokuapp.com/api/block
```

## Expected result

If both emails valid:

```{"success":true}```

Note: after blocking, if the users are not already friends, attempt to add friendship between them will fail, see [doc/add_friend](doc/add_friend.md#possible-error)

## Possible Error

If either of the email is not valid, the request will fail with:

```{"status":"bad_request","error":"Validation failed: Blocker is invalid","message":"Invalid parameter"}```

If the blocking relationship already exists, the request will fail with:

```{"status":"bad_request","error":"Validation failed: Blocker has already been taken","message":"Invalid parameter"}```