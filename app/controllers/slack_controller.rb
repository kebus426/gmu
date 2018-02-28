# coding: utf-8
require 'net/http'
require 'uri'
require 'json'

class SlackController < ApplicationController
  def new
  end

  def post
    param = slack_params
    flash[:success] = "slackに投稿しました!"
    uri  = URI.parse('Webhook URL を指定する')
    params = { text: 'POST したいメッセージ' }
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.start do
      request = Net::HTTP::Post.new(uri.path)
      request.set_form_data(payload: params.to_json)
      http.request(request)
    end

    #直す
    begin
      redirect_to request.env["HTTP_REFERER"]
    rescue ActionController::RedirectBackError
      redirect_to root
    end
    
  end

  def slack_params
    params.permit(:channel, :content)
  end

end
