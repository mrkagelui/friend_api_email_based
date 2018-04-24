# Get receivers

## What it does

Upon receiving a "sender" and "text", return a list of emails that should receive this update "text".

Eligibility for receiving updates from i.e. "john@example.com":
- has not blocked updates from "john@example.com", and
- at least one of the following:
  - has a friend connection with "john@example.com"
  - has subscribed to updates from "john@example.com"
  - has been @mentioned in the update

## How to call

```
curl -X POST -H 'Content-Type:application/json' -d '{"sender":"c@test.com","text":"hello e@test.com stranger@test.com! also invalid@test"}' https://sheltered-fortress-41528.herokuapp.com/api/get_receivers
```

## Expected result

```{"success":true,"recipients":["b@test.com","d@test.com","f@test.com","stranger@test.com"]}```

Note that, if the mentioned email doesn't exist, no error will be provided.

## Possible Error

If the sender email is not valid, the request will fail with:

```{"status":"bad_request","error":"sender email not valid","message":"Please check sender email"}```