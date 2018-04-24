class Following < ApplicationRecord
  VALID_EMAIL_REGEX = /\A(?:[\w+\-].?)+@[a-z\d\-]+(?:\.[a-z]+)*\.[a-z]+\z/i
  validates :source, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: { scope: [:audience] }
  validates :audience, presence: true, format: {with: VALID_EMAIL_REGEX}
end
