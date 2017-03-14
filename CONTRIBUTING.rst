.. highlight:: shell

============
Contributing
============


Contributions are welcome, and they are greatly appreciated! Every
little bit helps, and credit will always be given.

To improve tracking of who did what, and to clarify the relationship
between the project and the contributor, we require a "sign-off" on patches
and pull requests submitted to this project. Instructions for how to do the
sign off are provided below.

Signing off certifies that you agree with the following:


Developer's Certificate of Origin 1.1
-------------------------------------


By making a contribution to this project, I certify that:

        (a) The contribution was created in whole or in part by me and I
            have the right to submit it under the open source license
            indicated in the file; or

        (b) The contribution is based upon previous work that, to the best
            of my knowledge, is covered under an appropriate open source
            license and I have the right under that license to submit that
            work with modifications, whether created in whole or in part
            by me, under the same open source license (unless I am
            permitted to submit under a different license), as indicated
            in the file; or

        (c) The contribution was provided directly to me by some other
            person who certified (a), (b) or (c) and I have not modified
            it.

        (d) I understand and agree that this project and the contribution
            are public and that a record of the contribution (including all
            personal information I submit with it, including my sign-off) is
            maintained indefinitely and may be redistributed consistent with
            this project or the open source license(s) involved.

To certify you agree with the DCO, you will need to add the following line at
the end of each commit you submit to the project::

	Signed-off-by: Random J Developer <random@developer.example.org>

You must sign off with your real name as we unfortunately cannot accept
pseudonyms or anonymous contributions per this agreement.

You can do this easily in git by using ``-s`` when you run ``git commit``.
An example is provided in the "Get Started" section.


Ways to Contribute
----------------------

The BonnyCI research effort is tracked under a project in the main BonnyCI org
called "Research": https://github.com/orgs/BonnyCI/projects/4

The TODO column lists the current Milestone and the backlog of issues necessary
to complete that milestone. The "Help Wanted" column specifically calls out
issues that are available and have been documented sufficiently for hand
off. Unassigned issues in the TODO column may be available; ask in the #BonnyCI
channel.

If an issue does not have enough information, label it as incomplete and move it
to the "Blocked" column. Leave a comment describing what further information is
needed in order for work to proceed. For quicker attention, mention the issue in
the #BonnyCI irc channel.

Get Started!
------------

Most of the research tasks do not require writing or running code. The research
that does require this is currently done in R. You can use RStudio to open and
run any of the R files.

Data gathering is done by other scripts. The details for setting up an
environment for those scripts can be found in their respective repositories.

Once you've found something to work on, hop in to the #BonnyCI irc channel,
introduce yourself, and announce your intentions to work on that issue. Assign
the issue to yourself and add the label "In Progress". Move the associated card
in the Research project to "In Progress".

Not all issues require a code update. If an issue is a research item, document
the steps you took and any sources either in the issue ticket or add a page to
the wiki and add a link to the ticket. If the issue requires data of some sort,
it should specify where and how to provide it.

If the issue requires a code update, create a branch and push your changes there.

1. Create a branch for local development::

    $ git checkout -b name-of-your-bugfix-or-feature

   Now you can make your changes locally.

2. Commit your changes::

If you haven't read the above DCO agreement above, please do so. You need to
add a "signed-off" line to the end the commits you submit to the project to
certify that you agree with the terms of the DCO above::

    $ git add .
    $ git commit -s -m "Your detailed description of your changes."

3. Push your branch to GitHub::

    $ git push origin name-of-your-bugfix-or-feature

4. Submit a pull request through the GitHub website.


Automate the Sign Off
---------------------

To make integrating the sign-off in your commits easier, you can define a
git alias or you can create a local git hook.

By automating the sign off, you won't have to remember to use the "-s" flag
each time and risk a rejected Pull Request.


Git Alias
~~~~~~~~~

The easiest way to set this up is to create a git alias. While you can't
replace the "commit" command, you can make a command you'll remember to use::

    $ git config alias.sign "commit -s"


Git Hook
~~~~~~~~

The other way to automate the sign off is to write a git hook to populate
your commit message with the sign off text. The prepare-commit-msg hook is
the most straightforward option for adding the sign off to your commit
messages. Git provides sample files for each of these hooks in the
.git/hooks folder. Instructions are at the top explaining each of the
samples and how to activate the hook.

1. Open the prepare-commit-msg.sample and uncomment the last example::

    $ nano .git/hooks/prepare-commit-msg.sample

2. Activate the prepare-commit-msg hook by dropping the suffix::

    $ cp .git/hooks/prepare-commit-msg.sample .git/hooks/prepare-commit-msg


Pull Request Guidelines
-----------------------

Before you submit a pull request, check that it meets these guidelines:

1. Rebase commits to as few as possible and try to avoid a lot of confusing
one-off commits
2. Write a clear commit message that explains what the commit is about
3. Reference the issue# the commit is associated with. If you don't have an
issue to associate it with, create one and assign it to the milestone you
are currently working on.
4. At least one other person must approve the change before it can be merged to master.
