# T1K [![Code Climate](https://codeclimate.com/github/fortesinformatica/t1k/badges/gpa.svg)](https://codeclimate.com/github/fortesinformatica/t1k)

T1K - Automated Git and Trello Workflow

Use those scripts to automatically create branchs associated with issues and tracked commits with cards on Trello.

T1k allow you from command line to use some tasks to make easy to create brach, commit, create an issue and track it down in a Trello's card.

- [T1K](#t1k)
  - [Getting started](#getting-started)
    - [T1000 Configuration File](#t1000-configuration-file)
  - [Commands](#commands)
    - [Help](#help)
    - [Validate](#validate)
    - [Init](#init)
    - [Hack](#hack)
    - [Commit](#commit)
    - [Sink](#sink)
    - [Ship](#ship)
  - [License](#license)

## Getting started

Install in your system T1k's gem

```ruby
$ gem install t1k
```

Start using t1k into your project directory

```shell
$ t1k init
```

It creates the T1000 configuration file inside your project folder.

### T1000 Configuration File
Here is a possible configuration for `github` and `trello`.
Your `T1000` should look like this:

```ruby
T1k.setup do |config|
  # Change the repository adapter. Default is github.
  # config.repository.adapter = :github

  # Change the tracker adapter. Default is trello.
  # config.tracker.adapter = :trello
  # Setup Github repository credentials

  # Create an auth_token here: https://github.com/settings/tokens

  config.repository.adapter = :github # default is github
  config.repository.setup do |c|
    c.user = "GITHUB_USER"
    c.repo = "REPOSITORY_NAME"
    c.oauth_token = "YOUR_GITHUB_AUTH_TOKEN"
  end

  # Setup Trello board credentials
  #
  # Trello APP_DEVELOPER_KEY: https://trello.com/app-key
  # Trello App permission key: https://trello.com/1/connect?key=YOUR_KEY&name=BOARD_NAME&expiration=never&response_type=token&scope=read,write
  #
  config.tracker.adapter = [:trello, :pivotal, :none] # default is trello
  config.tracker.setup do |c|
    c.user_name = "TRELLO_USER"
    c.board_name = "TRELLO_BOARD_NAME"
    c.member_token = "TRELLO_APP_TOKEN"
    c.developer_public_key = "TRELLO_DEVELOPER_PUB_KEY"
  end
end
```

* When using `:github` as your repository, you must define `:oauth_token`, `:user`, `:repo`.
* When using `:trello` as your tracker, you must define `:developer_public_key`, `:member_token`, `:user_name` and `:board_name`. Get your `:developer_public_key` [here](https://trello.com/app-key) and the `:member_token` you must replace your developer key in the url `https://trello.com/1/authorize?key=YOURAPIKEY&response_type=token&expiration=never&scope=read,write`.
* When using `:none` as your tracker, T1k will create issues with the name passed as argument on `t1k hack <issue-name>`

## Commands

Basic workflow with Trello as Tracker:

```shell
$ t1k hack yk2adi9
$ t1k commit -m 'commit message'
$ t1k commit -m 'finish issue and close it' -c
$ t1k sink
$ t1k ship
```

### Help

`t1k --help`

```
Usage: t1k [command] [options]

  Commands:
    commit,cmt                                          # Commit current staged changes
    hack,hck <card_url>                                 # Checkout to a new branch or existing branch associated with tracked card (issue)
    init,setup                                          # Create T1000 credentials file template in your current folder
    ship,pack,deliver                                   # Delivery your changes to local and remote master branch
    sink,sync                                           # Update current branch with master (ie Sync with master)
    validate                                            # Validate current credentials
    help [<command>]                                    # Display help

  Options:
    -v, --version                                       # Display the current version
    -h, --help                                          # Display this help message
```

### Validate

Validates your current credentials stored in `T1000` file

### Init

Just adds to your project folder a `T1000` config file template

### Hack

When you type `$ t1k hack 18asd92` t1k creates or switches to a branch associated to a card.

* Where `18asd92` can be the card identifier or any url part of its.

### Commit

Commit has to params options, -m and -c.

```
Usage: t1k commit,cmt [options]

  Options:
    -c, --[no-]close                                    # Close current branch and resolves issue
    -m, --message <message>                             # Add a message to the commit
    -h, --help                                          # Display this help message
```

1. `t1k commit` : just commits your staged changes (no message is added) *not recommended*
2. `t1k commit -m 'message'` : commits your staged changes with a custom message
2. `t1k commit -c -m 'message'` : `-c` is used to close your issue.

### Sink

Just _sync_ with master your current branch

### Ship

It deliveries to master (local and remote) your branch and changes current branch to master

## Contributing
`#TODO`

## License

MIT License (MIT)

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
