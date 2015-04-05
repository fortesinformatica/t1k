# t1k

T1K - Automated Git and Trello Workflow

Use those scripts to create automatically branchs associated with issues and tracked commits.


## Getting started

T1k 1.0 works with Rails 4.0.0 onwards. You can add it to your Gemfile with:

```ruby
gem 't1k', git: 'https://github.com/fortesinformatica/t1k.git', tag: 'v1.0.1'
```


T1k will create some tasks to use in your project. (Between others... hahahah :joy:)

```ruby
rake t1k:hack
rake t1k:commit
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

When you use `:github` as your repository, you must define `:oauth_token`, `:user`, `:repo`.

When you use `:trello` as your tracker, you must define `:developer_public_key`, `:member_token`, `:user_name` and `:board_name`.


### License

Just show me the code :see_no_evil: :stuck_out_tongue_closed_eyes:

