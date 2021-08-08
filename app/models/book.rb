class Book < ApplicationRecord
  belongs_to :publisher, required: false
  belongs_to :author

  validates :title, presence: true
  validates :released_on, presence: true
  validates :author, presence: true

  validates :isbn_10, presence: true, length: { is: 10 }, uniqueness: true, case_sensitive: false
  validates :isbn_13, presence: true, length: { is: 13 }, uniqueness: true, case_sensitive: false

  mount_base64_uploader :cover, CoverUploader
end
