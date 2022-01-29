class Article < ApplicationRecord
    validates :title, presence: true, length: {minimum:6 , maximum: 100 }
    validates :description, presence: true, length: { minimum: 50 }
    has_rich_text :description
end