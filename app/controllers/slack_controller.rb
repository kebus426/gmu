# coding: utf-8
require 'net/http'
require 'uri'
require 'json'

class SlackController < ApplicationController
  def new
  end

  def show
  end
  
  def post
    param = slack_params
    url = 'https://slack.com/api/chat.postMessage'
    token_file = File.join(Rails.root, 'app','token.txt') #token読み出し
    token = File.read(token_file).strip()
    #url = url.gsub('<TOKEN>',TOKEN)
    uri  = URI.parse(url)
    #param[:channel] = 'kmc-dtm' if param[:channel] == nil or param[:channel] == ""
    # ここでテキストを編集する 曲名、キャプション、投稿者、リンク、くらい
#    attachment = {}
#    attachment[:color] = "#36a64f"
#    attachment[:author_name] = param[:author]
#    attachment[:title] = param[:music_name]
    m_path = music_path(param[:id])
#    attachment[:title_link] = 
    #    attachment[:text] = param[:caption]
    attachments = [
      {
            author_name: param[:author],
            title: param[:music_name],
            title_link: "https://inside.kmc.gr.jp" +  m_path,
            text: param[:caption],
            color: "#36a64f",
            footer: "God Music Uploader",
            footer_icon: "https://platform.slack-edge.com/img/default_application_icon.png"
        }
    ].to_json
   # puts attachments
   # puts "JSON"
   # puts JSON.generate(attachment)
    
    params = { token: token, channel: param[:channel], text: "神曲だよ！聞いてね！", icon_emoji: ":3:", attachments: attachments,username: "なんでも曲を紹介してくれる3号君bot" }
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    res = nil
    http.start do
      puts uri.path
      request = Net::HTTP::Post.new(uri.path)
      request.set_form_data(params)
      res = http.request(request)
    end
    #直す
    res_split = JSON.parse(res.body)
    puts res_split
    if res_split.has_key?("error") 
      case res_split["error"]
      when "channel_not_found" then
        puts "channel not found"
        flash[:danger] = "チャンネルがありません"
      when "no_text" then
        puts "no_text"
        flash[:danger] = "文章を入力して下さい"
      end
      puts "error:" + res_split["error"]
      redirect_back(fallback_location: musics_path)
    elsif param != nil
      flash[:success] = "投稿しました"
      redirect_back(fallback_location: musics_path)
    else
      flash[:success] = "投稿しました"
      redirect_back(fallback_location: musics_path)
    end
    
   # begin
   #   puts res.body[:error]
   #   redirect_to request.env["HTTP_REFERER"]
   # rescue ActionController::RedirectBackError
   #   redirect_to root
   # end
    
  end

  def slack_params
    params.require(:slack).permit(:channel, :id, :author, :caption, :music_name)
  end

end
