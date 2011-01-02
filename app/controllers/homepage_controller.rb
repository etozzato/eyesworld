class HomepageController < ApplicationController
  
  def index
    render :text => "L'Applicazione &egrave; in manutenzione! Torner&agrave; in funzione appena sar&agrave; completato
    l'aggiornamento dei database per controllo di integrit&agrave; dovuto al passaggio al nuovo anno."
    @prima_pagina ||= RssReader.parseFeed('http://news.google.it/news?pz=1&hdlOnly=1&cf=all&ned=it&hl=it&topic=n&output=rss')
    @sport ||= RssReader.parseFeed('http://news.google.it/news?pz=1&hdlOnly=1&cf=all&ned=it&hl=it&topic=s&output=rss')
    @spettacolo ||= RssReader.parseFeed('http://news.google.it/news?pz=1&hdlOnly=1&cf=all&ned=it&hl=it&topic=e&output=rss')
    @scienze ||= RssReader.parseFeed('http://news.google.it/news?pz=1&hdlOnly=1&cf=all&ned=it&hl=it&topic=t&output=rss')
  end
  
end