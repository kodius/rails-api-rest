# rails-api-rest 📦

![rorimage](https://user-images.githubusercontent.com/8150171/276251204-0e599658-2476-4573-ae96-b68df82fd528.jpg)

## What is this? ❓

This is a core **rails API starter project** accompanied with examples of a couple of concepts we like to use in our Rails projects. It's meant to be used as a template (meaning when you start a new repository on **Github**, you select this repository as the "template" to use). With it you get a barebones rails api setup (initialized with the `--api` flag during generation), using **postgres** for DB and a couple of gems we like to use plus samples of **Actions**, **Validations**, **OpenAPI** definitions and such, to make it easier when starting a new project from scratch instead of having to think what to do.

*   [x] 📐 **MVC**
*   [x] ☝️ **Actions** (so you don't put it all in any of the MVC components)
*   [x] 🔐 **Auth**
*   [x] 🗂️ **Serialization**
*   [x] 🛡️ **Validations**
*   [x] 📝 **OpenAPI**
*   [x] 📦 **Dockerized**



# 📐 MVC

The project is meant as a **backend-only rails API**, and as such the "view" in MVC in this case means having **JSON responses**, not actual templates. Or rather, any front-end framework handling the viewing whichever way you like.

The other parts of MVC, the Model and Controller -- they're both meant to be skinny., which is why we're making extensive use of Actions and Validators, to make them clean and make them contain as little as possible.

## ☝️ Actions

[What are Actions and how to use them](/app/interactors/actions/README.md)

## 🔐 Auth

Auth is implemented with JWT, w/o Devise (out of the box, but you can add it if you want).

## 🗂️ Serializers

Implemented with [blueprinter](https://github.com/procore-oss/blueprinter). Click the link for more info.

## 🛡️ Validations

Default validations are sitting in `app/services/validations`.

## 📝 OpenAPI

[What is OpenAPI and how to use it](/openapi/README.md)

We're using [rswag](https://github.com/rswag/rswag). The explorer sits over at `/spec`. You write a spec for your controller, along with typed payloads and responses, and then you run `make swagger` to have the latest and greatest API spec available over at `/spec/openapi.json` or via the explorer page on `/spec`!

## 👔 Coding Standards

We like Ruby for its elegance and almost natural-like syntax and expresiveness.
<https://github.com/rubocop/rails-style-guide>

## Recommended extensions

<https://marketplace.visualstudio.com/items?itemName=shopify.ruby-lsp>

<https://marketplace.visualstudio.com/items?itemName=misogi.ruby-rubocop>

<https://marketplace.visualstudio.com/items?itemName=kaiwood.endwise>

<https://marketplace.visualstudio.com/items?itemName=KoichiSasada.vscode-rdbg>

## Debugging with VS Code

*   Install [VSCode rdbg](https://marketplace.visualstudio.com/items?itemName=KoichiSasada.vscode-rdbg)

*   Run the `Debug Rails` task

*   Enjoy inline VS Code debugging with breakpoints and everything

![VS Code with rdbg](https://kodiusebucket.s3.amazonaws.com/vscode-rdbg.png)

## How to run

```bash
    rbenv install 3.2.2 #to get the latest version of ruby
    gem install bundler # to get bundler installed
    bundle # install dependencies
    rails db:create # create database
    make migrate
    make dev
```

## Run scripts

```bash
    make dev
    make test #all tests
    make test:swag
    make test:unit #services
    make migrate
    make swagger
```

## Miscellaneous

Any other additions are welcome! Just open up a PR or an issue!
