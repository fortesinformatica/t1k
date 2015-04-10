# T1K [![Code Climate](https://codeclimate.com/github/fortesinformatica/t1k/badges/gpa.svg)](https://codeclimate.com/github/fortesinformatica/t1k)

T1K - Automated Git and Trello Workflow

Use those scripts to automatically create branchs associated with issues and tracked commits with cards on Trello.

T1k allow you from command line to use some tasks to make easy to create brach, commit, create an issue and track it down in a Trello's card.

- [T1K](#t1k)
  - [Getting started](#getting-started)
    - [T1000 Configuration File](#t1000-configuration-file)
  - [Commands](#commands)
    - [Init](#init)
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

  # Configuring your repository
  config.repository.setup do |c|
    # https://github.com/settings/applications
    # Personal access tokens
    c.oauth_token = 'PERSONAL_ACCESS_TOKEN'
    c.user = 'YOUR_REPOSITORY_USERNAME'
    c.repo = 'YOUR_REPOSITORY_NAME'
  end

  # Configuring your tracker
  config.tracker.setup do |c|
    # https://trello.com/app-key
    # https://trello.com/1/connect?key=YOUR_KEY&name=BOARD_NAME&expiration=never&response_type=token&scope=read,write
    c.developer_public_key = 'PUBLIC_KEY'
    c.member_token = 'APP_MEMBER_TOKEN'
    c.user_name = 'YOUR_TRELLO_USER'
    c.board_name = 'BOARD_NAME'
  end
end
```

When using `:github` as your repository, you must define `:oauth_token`, `:user`, `:repo`.

When using `:trello` as your tracker, you must define `:developer_public_key`, `:member_token`, `:user_name` and `:board_name`.

## Commands

Basic workflow:

```shell
$ t1k commit -m 'commit message'
$ t1k commit -m 'finish issue and close it' -c
$ t1k sink
$ t1k ship
```

### Init

Just adds to your project folder a T1000 config file template

### Commit

Commit has to params options, -m and -c.

1. `t1k commit` : just commits your staged changes (no message is added) *not recommended*
2. `t1k commit -m 'message'` : commits your staged changes with a custom message
2. `t1k commit -c -m 'message'` : -c is used to close your issue.

### Sink

Just _sync_ with master your current branch

### Ship

It deliveries to master (local and remote) your branch and changes current branch to master

## License

MIT License (MIT)

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
