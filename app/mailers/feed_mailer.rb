class FeedMailer < ApplicationMailer
  def feed_mail(feed)
    @feed = feed
    mail to: "kimmy0929@gmail.com", subject: "フィードを投稿しました"
  end
end
