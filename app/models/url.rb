class Url < ApplicationRecord
    validates :longURL, presence: true
    validates :shortURL, presence: true
end
