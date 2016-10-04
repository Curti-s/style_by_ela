class Post < ActiveRecord::Base
  belongs_to :user

  has_attached_file :image, styles: { medium: "644x429>", thumb: "300x300>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
