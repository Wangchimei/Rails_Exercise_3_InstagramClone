class FeedMailer < ApplicationMailer

  def feed_email
    @feed = feed
    mail to: "kimmy0929@gmail.com", subject: "フィードを投稿しました"
  end
end
