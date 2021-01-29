unset AWS_SESSION_TOKEN

 assume=$(aws sts assume-role \
    --role-arn "$1" \
    --role-session-name "circleci-backend"
    )

export AWS_ACCESS_KEY_ID=$(echo $assume | jq .Credentials.AccessKeyId | xargs)
export AWS_SECRET_ACCESS_KEY=$(echo $assume | jq .Credentials.SecretAccessKey | xargs)
export AWS_SESSION_TOKEN=$(echo $assume | jq .Credentials.SessionToken | xargs) 