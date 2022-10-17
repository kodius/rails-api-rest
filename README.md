# rails-api-template

## mvc

## services

## openapi support

### generate front-end typescript fetch client

```
openapi-generator-cli generate  --enable-post-process-file -i openapi.json --skip-validate-spec --enable-post-process-file  -g typescript-fetch -o ./api
```

### generate an updated openapi.json (can be automatic)

```
rake rswag:specs:swaggerize
```
## misc

