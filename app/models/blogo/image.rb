class Blogo::Image < ActiveRecord::Base

  belongs_to :post
  has_attached_file :image, styles: {small: '64x64', med: '100x100', large: '200x200', xlarge: '800x800'}
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  # When first created the url needs to be saved to the post
  after_create do
    self.post.update(meta_image: self.image.url(:xlarge)) if self.post
  end
end
