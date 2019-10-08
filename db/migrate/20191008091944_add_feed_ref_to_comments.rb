class AddFeedRefToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :feed, foreign_key: true
  end
end
