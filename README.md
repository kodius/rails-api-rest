# rails-api-rest 📦

## What is this? ❓

This is a core rails API starter project accompanied with examples of a couple of concepts we like to use in our Rails projects. It's meant to be used as a template (meaning when you start a new repository on Github, you select this repository as the "template" to use). With it you get a barebones rails api setup (initialized with the `--api` flag during generation), using postgres for DB and a couple of gems we like to use plus samples of Services, Queries, Validators, OpenAPI definitions and such, to make it easier when starting a new project from scratch instead of having to think what to do.

## MVC

The project is meant as a backend-only rails API, and as such the "view" in MVC in this case means having JSON responses, not actual templates. Or rather, any front-end framework handling the viewing whichever way you like.

The other parts of MVC, the Model and Controller -- they're both meant to be skinny., which is why we're making extensive use of Services, Queries (sometimes called Repositories) and Validators, to make them clean and make them contain as little as possible.

## Services 👨‍🔧

[What are services and how to use them](/app/services/README.md)

## Queries

[What are Query objects and how they're used](/app/services/core/queries/README.md)

## Authorization

Authorization is imeplemented using Devise and set to act like a typical API with JWT based auth.

## Serializers

Implemented with [jsonapi-serializer](https://github.com/jsonapi-serializer/jsonapi-serializer), a fork of Netflix's now deprecated and unmaintained [fast_jsonapi](https://github.com/Netflix/fast_jsonapi). See the first link for more details on its usage.

## Validators

- todo

## OpenAPI 🌐

[What is OpenAPI and how to use it](/openapi/README.md)

We're using [rswag](https://github.com/rswag/rswag). The explorer sits over at `/api-docs/`.

## Coding Standards 👔

We like Ruby for its elegance and almost natural-like syntax and expresiveness.
https://github.com/rubocop/rails-style-guide

## Recommended extensions

https://marketplace.visualstudio.com/items?itemName=rebornix.Ruby

https://marketplace.visualstudio.com/items?itemName=castwide.solargraph

https://marketplace.visualstudio.com/items?itemName=misogi.ruby-rubocop

https://marketplace.visualstudio.com/items?itemName=wingrunr21.vscode-ruby

https://marketplace.visualstudio.com/items?itemName=kaiwood.endwise

https://marketplace.visualstudio.com/items?itemName=usernamehw.errorlens

https://marketplace.visualstudio.com/items?itemName=KoichiSasada.vscode-rdbg

## Debugging with VS Code

- Install [VSCode rdbg](https://marketplace.visualstudio.com/items?itemName=KoichiSasada.vscode-rdbg)

- Run the `Debug Rails` task

## How to run

```
rbenv install 3.2.0 #to get the latest version of ruby

gem install bundler # to get bundler installed

bundle # install dependencies

rails db:create # create database
rails db:migrate # run migrations

bin/rails server # run server
```

## Misc

TODO
