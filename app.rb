require 'elasticsearch'

client = Elasticsearch::Client.new log: true

TERMS = ["Dioxide", "dioxide", "dioxide"]

client.indices.create index: 'products_jc',
                      body: {
                        settings: {
                          # index: {
                          #   number_of_shards: 1,
                          #   number_of_replicas: 0,
                          #   'routing.allocation.include.name' => 'node-1'
                          # },
                          analysis: {
                            # filter: {
                            #   ngram: {
                            #     type: 'nGram',
                            #     min_gram: 3,
                            #     max_gram: 25
                            #   }
                            # },
                            analyzer: {
                              case_sensitive: {
                                tokenizer: 'keyword',
                                type: 'custom'
                              },
                              # ngram_search: {
                              #   tokenizer: 'whitespace',
                              #   filter: ['lowercase', 'stop'],
                              #   type: 'custom'
                              # }
                            }
                          }
                        },
                        mappings: {
                          document: {
                            properties: {
                              title: {
                                type: 'string',
                                analyzer: 'case_sensitive'
                              }
                            }
                          }
                        }
                      }

TERMS.each_with_index do |term, index|
  client.index  index: 'products_jc', type: 'directory', id: index + 1, body: { title: "#{term}", description: "blank" }
end