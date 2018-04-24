class Blockade < ApplicationRecord
  VALID_EMAIL_REGEX = /\A(?:[\w+\-].?)+@[a-z\d\-]+(?:\.[a-z]+)*\.[a-z]+\z/i
  validates :blocker, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: { scope: [:blockee] }
  validates :blockee, presence: true, format: {with: VALID_EMAIL_REGEX}
end
