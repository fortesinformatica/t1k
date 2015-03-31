# t1k

T1K - Automated Git and Trello Workflow

Use those scripts to create automatically branchs associated with issues and tracked commits.

## Workflow
- Cria uma issue a partir de parte da url de uma cartão do trello #rake t1k:hack['uD2GBBMf'] 
- Commita alterações *segundo parâmetro é opcional #rake t1k:commit['comentario do commit',close]
- Sincroniza alterações com o branch master #rake t1k:sink
- Publica as alterações, mergeando com o master #rake t1k:ship

## Config
```ruby
T1k.configure do |config|
  config[:github_user] = 'YOUR_GITHUB_USER'
  config[:github_repo] = 'REPOSITORY_NAME'
  
  # https://github.com/settings/applications
  # Personal access tokens
  config[:github_oauth_token] = 'PERSONAL_ACCESS_TOKENS'
  
  # https://trello.com/app-key
  # https://trello.com/1/connect?key=YOUR_KEY&name=BOARD_NAME&expiration=never&response_type=token&scope=read,write
  config[:trello_developer_public_key] = 'PUBLIC_KEY'
  config[:trello_member_token] = 'MEMBER_TOKEN'
  
  config[:trello_user_name] = 'YOUR_TRELLO_USER'
  config[:trello_board_name] = 'BOARD_NAME'
end
```

## License

It's under MIT License

Copyright (c) - 2015 until Today 

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

