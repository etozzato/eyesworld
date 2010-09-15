class HomepageController < ApplicationController
  
  def index
    @prima_pagina ||= RssReader.parseFeed('http://news.google.it/news?pz=1&hdlOnly=1&cf=all&ned=it&hl=it&topic=n&output=rss')
    @sport ||= RssReader.parseFeed('http://news.google.it/news?pz=1&hdlOnly=1&cf=all&ned=it&hl=it&topic=s&output=rss')
    @spettacolo ||= RssReader.parseFeed('http://news.google.it/news?pz=1&hdlOnly=1&cf=all&ned=it&hl=it&topic=e&output=rss')
    @scienze ||= RssReader.parseFeed('http://news.google.it/news?pz=1&hdlOnly=1&cf=all&ned=it&hl=it&topic=t&output=rss')
  end
  
end