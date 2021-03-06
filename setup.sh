# install brew
# setup local ruby with rvm
# https://usabilityetc.com/articles/ruby-on-mac-os-x-with-rvm/
brew install gnupg
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable --ruby

gem install bundler
bundle install
bundle exec jekyll server -w
