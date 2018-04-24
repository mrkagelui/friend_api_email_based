class Friendship < ApplicationRecord
  VALID_EMAIL_REGEX = /\A(?:[\w+\-].?)+@[a-z\d\-]+(?:\.[a-z]+)*\.[a-z]+\z/i
  validates :friend1, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: { scope: [:friend2] }
  validates :friend2, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: { scope: [:friend1] }
end
