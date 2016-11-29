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

## Refactoring Goals

1. Remove unused code and files.
    - Be thorough. E.g. there are probably individual actions within a controller that are unused.
2. Clean up tests--delete unused tests and even entire files if needed.
3. Build a `DecoratedEntry` class to manage the complexity of how an (entry + its applications/offers/positions/etc) is used in views.
4. Reliance on `params[:action] == "new"` in **views/positions/_form.erb** is bothersome. Can anything be done about it?
5. Get test coverage as high as possible.
6. Integrate CodeClimate and get as high a grade as possible.
