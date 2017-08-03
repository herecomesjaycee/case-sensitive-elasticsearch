# case-sensitive-elasticsearch
This is to record how I implemented case-senstive settings for Elasticsearch

## Installation
1. Clone the repository: run `git clone git@github.com:herecomesjaycee/case-sensitive-elasticsearch.git`
2. Install gem dependencies: run `bundle install` (Using Bundler, to install Bundler: run`gem install bundler`)
3. Run `docker-compose up` to start ELK (Elasticsearch, Logstash and Kibana) servers (You need to have Docker running on your OS)
4. Open `localhost: 5601` to launch Kibana for data visualation and querying.