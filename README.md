# README

Welcome to this demo ruby on rails application. It has been designed to demonstrate:

* Well named variables/methods/functions
* Consistent syntax
* Well thought out code
* (At least) basic documentation
* Tests
* Thoughtful commits

## Installation

You can download this code here [https://github.com/didlix/olio-tech-test/archive/refs/heads/main.zip](https://github.com/didlix/olio-tech-test/archive/refs/heads/main.zip). Be sure to unzip it before continuing with these instructions.

In order to get this application running using these instructions you will need to be running MacOS and then do perform some additional steps:

1. Be running Ruby 2.7.6
2. Follow some setup commands

### 1. Install Ruby 2.7.6

An easy way to get your mac running ruby 2.7.6 is to use [Homebrew](https://brew.sh/).

You'll need to use a Terminal to follow the instructions above. Try running the `Terminal` app which is pre-installed on your mac.

Follow the instruction on the [homebrew page](https://brew.sh/) and when that is complete run:

```bash
  brew install ruby@2.7
```

This command will download and install ruby 2.7.6 on your system.

Once complere it will display this message:

> ruby@2.7 is keg-only, which means it was not symlinked into /usr/local, because this is an alternate version of another formula.
>
> If you need to have ruby@2.7 first in your PATH, run:
>  echo 'export PATH="/usr/local/opt/ruby@2.7/bin:$PATH"' >> ~/.zshrc
>

The rest of these setup instructions assume that you run the command below `If you need to have ruby@2.7 first in your PATH, run:`.

Once you've followed all of these commands it will be a good idea to quit (`CMD+Q`) and then reopen the Terminal application.

### 2. Follow some setup commands

Browse to the directory that this readme file is in in your terminal. You can do this with the `cd` command. For example:

```bash
cd Downloads/main
```

Then run these commands:

```bash
bundle
bundle exec rails db:migrate
bundle exec rails s
```

You should now be able to browse to [http://localhost:3000](http://localhost:3000) and see the application running.


## Areas of interest:

Here are some interesting areas to look at in the application:

### Specs

Have a look in the `specs` directory. Here you'll find tests that ensure the application does what we expect them to.

You can run them with:

```bash
bundle exec rspec
```

### app/controllers

The `app/controllers` directory is where the rails application recieves a request, i.e. `/articles` and then gets the data needed for that page, and also renders the `view`.

### app/views

Where a controller handles the request, a view contains the code that decides how that request should look. You'll find a mixture of html and ruby code in these files.

### app/models

A model contains the logic for handling data handled by the application. Usually these will talk to a database as is the case for an `ArticleLike`. In this example we also have an `Article` which doesn't talk to the database. It just holds the information about an article which we retrieve from a hosted json file.

### app/services

In rails it's a good idea to try and keep bits of code small so that they're easy to understand. A service often contains some business logic for a specific task that would then be accessed by a controller. Here we have an `ArticlesService` which fetches the list of articles that are hosted in a json file on the server.



