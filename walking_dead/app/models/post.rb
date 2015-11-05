class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  def date_published
    created_at.localtime.strftime("%A, %B %-d, %Y at %l:%M %p")
  end
end
