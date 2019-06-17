![Urbit examples](https://storage.googleapis.com/media.urbit.org/site/examples-screen.png)

## Introduction

This is an open repository for Urbit example code.

There are generators (short Dojo commands), libraries (to be loaded into
Dojo), web pages (built by Ford), applications (run by Gall), and marks
and structures that these example Gall apps use.

The code is both here on Github and now on a desk on an Urbit ship
(`~nosnup-nomzod`). Now you can just merge the desk over the live network to get
our examples and docs onto any of your live urbits. Give these a try by
following the installation instructions below.

## Installation

First, you'll need a running urbit. Follow our urbit.org [install
instructions](https://urbit.org/docs/using/install/), then
[setup](https://urbit.org/docs/using/setup/) an urbit.

[Fake
ships](https://fora.urbit.org/general/posts/~2017.1.5..21.31.04..20f3~/) are best for development. If you need live network connectivity, comets are recommended.

In your urbit's Dojo:

    ~your-urbit:dojo> |merge %examples our %base, =gem %that
    ~your-urbit:dojo> =dir /=examples=
    ~your-urbit:dojo/examples> |serve %/web
    ~your-urbit:dojo/examples> |mount %

You can now find your examples desk at the path `/path/to/your-urbit/examples/`.

Lastly, in Unix, clone this repo somewhere and copy in the `examples` files to
your urbit's new mounted `%examples` desk. You can run the following shell
commands (*replacing your urbit's examples desk path as necessary*):

    $ git clone https://github.com/urbit/examples.git
    $ cd ./examples/
    $ for node in {app,gen,lib,mar,sec,sur,web}; do cp -r ./$node/* /path/to/your-urbit/examples/$node/; done

Your Clay filesystem should acknowledge the newly added files.

## Get started!

In your web browser, head to the next examples `README` page now being served
locally on your urbit to get started running your first examples:

    http://localhost:8080/~~/examples/

The `/~~/` in the URL will direct you to `Log In` via your web interface so you
can authenticate yourself and run your first examples smoothly.

We've found it also helps to have a clone of the docs on hand in case
`urbit.org` experiences high traffic. If you did the network install, you're now
serving them automatically from your new `%examples` desk. You can view them
locally in your browser at:

    http://localhost:8080/~~/docs/

If you did the local install, head over to our [docs
repo](https://github.com/urbit/docs) to clone the docs locally and copy them in
manually via Unix like you did with these examples.

> If you're running multiple ships locally, your port number will be `8081`,
> `8082`, and so on. Check your Dojo output for the correct local port of
> your examples urbit, or view these at `https://your-urbit.urbit.org` over DNS
> instead for live-network ships. You can also replace `localhost` with the IP
> of your instance, if you're running your urbit in the cloud.

## Learn a lot, and have fun!

The number one goal for this repository is for it to be fun! People are always
around on [Talk](https://urbit.org/docs/using/setup#-messaging-talk) and
[Fora](https://fora.urbit.org/). Help each other out, and don't hesitate if
you have an idea for a contribution. We'd love to make this both a learning
resource and a record of what people in the community are coming up with.

## Contributing / Feedback

Give us feedback [on
Fora](https://fora.urbit.org/~~/general/posts/~2017.8.3..20.53.26..c361~/) after
you've played around with these for a little bit. Let us know about your ideas,
requests, and/or problems and we'll try and get back to you quickly. Pull
requests are more than welcome.
