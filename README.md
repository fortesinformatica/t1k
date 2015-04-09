[![Code Climate](https://codeclimate.com/github/fortesinformatica/t1k/badges/gpa.svg)](https://codeclimate.com/github/fortesinformatica/t1k)


# t1k

T1K - Automated Git and Trello Workflow

Use those scripts to automatically create branchs associated with issues and tracked commits with cards on Trello.


## Getting started

T1k 1.0 works with Rails 4.0.0 onwards. You can add it to your Gemfile with:

```ruby
gem 't1k'
```

T1k allow you to use some rake tasks to make easy to create brach, commit, create an issue and track it down in a Trello's card.

```ruby
rake t1k:hack['TRACKER_CARD_IDENTIFIER']
rake t1k:commit['COMMIT_COMMENT'[,close]]
rake t1k:sink
rake t1k:ship
```


### Note
If you use `zsh` in your command line, add the following alias to `~/.zshrc` file:
```ruby
alias rake='noglob rake'
```

### Config
Here is a possible configuration for `github` and `trello`. 
Your `config/application.rb` should look like this:

```ruby
T1k.setup do |config|
  # Change the repository adapter. Default is github.
  # config.repository.adapter = :github

  # Change the tracker adapter. Default is trello.
  # if you not use any bugtraker, change to :anything
  # config.tracker.adapter = :trello

  # Configuring your repository
  config.repository.setup do |c|
    # https://github.com/settings/applications
    # Personal access tokens
    c.oauth_token = 'PERSONAL_ACCESS_TOKEN'
    c.user = 'YOUR_REPOSITORY_USER'
    c.repo = 'REPOSITORY_NAME'
  end

  # Configuring your tracker
  config.tracker.setup do |c|
    # https://trello.com/app-key
    # https://trello.com/1/connect?key=YOUR_KEY&name=BOARD_NAME&expiration=never&response_type=token&scope=read,write
    c.developer_public_key = 'PUBLIC_KEY'
    c.member_token = 'MEMBER_TOKEN'
    c.user_name = 'YOUR_TRELLO_USER'
    c.board_name = 'BOARD_NAME'
  end
end
```

When using `:github` as your repository, you must define `:oauth_token`, `:user`, `:repo`.

When using `:trello` as your tracker, you must define `:developer_public_key`, `:member_token`, `:user_name` and `:board_name`.


### License

MIT License (MIT)

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

