# OpenAPI
OpenAPI is a specification for machine-readable interface files for describing, producing, consuming, and visualizing RESTful web services. What this means is it makes your Rails API exposed via a standard that's easy to use by other tools. Some of those are OpenAPI explorers (see [this example](https://editor.swagger.io/)) and client generators ([openapi-generator-cli](https://www.npmjs.com/package/@openapitools/openapi-generator-cli))

[More on the spec](https://swagger.io/specification/).

## What does this mean?

What it means is we annotate our endpoints (paths, parameters, responses) during developing. In our specific case, we're using `rswag` and `rspec` to achieve this, via integration tests. This also means there's less need for hand-holding when integrating an API with its users (be it front-end or simply other backends), and naturally to much quicker prototyping!

## How it works

See [spec/integration/favorites_spec.rb](/spec/integration/favorites_spec.rb) for an example of what this looks like.

After finishing writing a half-decent annotation and test for a controller, we run a rake task provided by rswag for generating the openapi.json.

```
rake rswag:specs:swaggerize
```

The end result is an API explorer available by default at [127.0.0.1:3000/spec](http://127.0.0.1:3000/spec) where the user can interact with the API, send requests and receive responses as well as generate front-end clients for their applications.

## Generating clients

The great thing about openapi.json -- apart from making the developers more strict and consistent about the API they're building, is that they get a *typed* client for free.

There's many different generators in the wild, but the most popular one is `@openapitools/openapi-generator-cli`. 

Its documentation can tell you more about the whole process, but to generate a TypeScript fetch client from our openapi.json, we'd do the following,

`npm install -g @openapitools/openapi-generator-cli`

and then we'd run the actual generator

```
openapi-generator-cli generate  --enable-post-process-file -i http://127.0.0.1:3000/openapi.json --skip-validate-spec --enable-post-process-file  -g typescript-fetch -o ./api
```

which will produce a folder with types and clients for interacting with our backend API. No more handwriting API clients or manually typing responses or request bodies!
