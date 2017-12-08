# Outcomes-tracker

## Getting Started

After you have been given access to the repository and cloned the project locally, run `bin/setup` to set up your local project with the necessary dependencies to run and test this application.

You will also want to create a file called **.env.local**, and set up `GITHUB_CLIENT_ID` and `GITHUB_CLIENT_SECRET` variables -- you can either enter your own API keys or message one of the repository collaborators for our keys.

## Choosing What to Work On

Choose an existing Issue that is unassigned and assign it to yourself. If you'd like to suggest an feature to work on that doesn't exist in the Issue list yet, create the new Issue and give it a `suggestion` label. One of the project managers will change its label and assign it to you if they approve it for the current project milestone being worked toward. 

Once you begin working, we recommend starting your branch number with the Issue number you are working on, followed by a paraphrase of the Issue. For example:
`35-add-dropdown-to-job-application-re-nature-of-employment`

## Contributing Your Changes

When you finish your branch work and want to submit a pull request, please use the following format for the PR message:

```md

Fixes #23 

<!-- Write which Issue you are fixing here. -->

---

### Login Credentials

**Admin**
Email: admin@example.com
Password: testtest

<!-- Include the necessary login credentials the project manager will need to test functionality. -->

---

### Functionality to Test

- When the admin masquerades as a user, there is no longer a masquerade bar below the navigation bar because it was obscuring content. Instead, there is an unobtrusive masquerade icon next to the avatar.
- When the admin opens the avatar dropdown, there is a message reminding them that they are masquerading as a user and a link to return to their own account.
```

### Coding Standards

We're going to try to stick to this:

0. You should break these rules only if you have a good reason or your pair lets you.
1. Classes can be no longer than one hundred lines of code.
2. Methods can be no longer than five lines of code.
3. Pass no more than four parameters into a method. Hash options are parameters.
4. Controllers can instantiate only one object. Therefore, views can only know about one instance variable and views should only send messages to that object (`@object.collaborator.value` is not allowed).
5. Avoid non-resource routes (So avoid `member`, `collection`, and one-off routes like `get "blah" => 'foo#bar'`).
6. Avoid non-resource methods (aka ‘actions’) in controllers (So controller actions should only ever be index, show, new, create, edit, update, destroy).

