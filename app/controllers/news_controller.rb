require 'news-api'
class NewsController < ApplicationController

  def index
    newsapi = News.new("c4b4a385626c44c892860ce47a35dc7a")
    @all_articles = newsapi.get_everything(q: 'tech',
                                      sources: 'bbc-news,the-verge',
                                      domains: 'bbc.co.uk,techcrunch.com',
                                      from: '2017-12-01',
                                      to: '2017-12-12',
                                      language: 'en',
                                      sortBy: 'relevancy',
                                      page: 2)
  end
  
end
