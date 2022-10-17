# rails-api-rest

## What is this?
This is a core rails API starter project accompanied with examples of a couple of concepts we like to use in our Rails projects. It's meant to be used as a template (meaning when you start a new repository on Github, you select this repository as the "template" to use). With it you get a barebones rails api setup (initialized with the `--api` flag during generation), using postgres for DB and a couple of gems we like to use plus samples of Services, Queries, Validators, OpenAPI definitions and such, to make it easier when starting a new project from scratch instead of having to think what to do.

## MVC
The project is meant as a backend-only rails API, and as such the "view" in MVC in this case means having JSON responses, not actual templates. Or rather, any front-end framework handling the viewing whichever way you like.

The other parts of MVC, the Model and Controller -- they're both meant to be skinny., which is why we're making extensive use of Services, Queries (sometimes called Repositories) and Validators, to make them clean and make them contain as little as possible.

## Services
[What are services and how to use them](/app/services/README.md)

## Queries
[What are Query objects and how they're used](/app/services/core/queries/README.md)

## Validators

## OpenAPI
[What is OpenAPI and how to use it](/openapi/README.md)

## Misc
TODO
