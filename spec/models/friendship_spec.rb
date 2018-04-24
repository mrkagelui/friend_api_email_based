require 'rails_helper'

RSpec.describe Friendship, type: :model do
  subject { create(:friendship) }
  it { is_expected.to validate_presence_of(:friend1) }
  it { is_expected.to validate_presence_of(:friend1) }
  it { is_expected.to validate_uniqueness_of(:friend1).scoped_to(:friend2) }

  it { is_expected.to allow_value('alice.bob@cat.com').for(:friend1) }
  it { is_expected.not_to allow_value('alice@bob').for(:friend1) }
  it { is_expected.to allow_value('alice.bob@cat.com').for(:friend2) }
  it { is_expected.not_to allow_value('alice@bob').for(:friend2) }
end
