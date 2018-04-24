require 'rails_helper'

RSpec.describe Blockade, type: :model do
  subject { create(:blockade) }
  it { is_expected.to validate_presence_of(:blocker) }
  it { is_expected.to validate_presence_of(:blockee) }
  it { is_expected.to validate_uniqueness_of(:blocker).scoped_to(:blockee) }

  it { is_expected.to allow_value('alice.bob@cat.com').for(:blocker) }
  it { is_expected.not_to allow_value('alice@bob').for(:blocker) }
  it { is_expected.to allow_value('alice.bob@cat.com').for(:blockee) }
  it { is_expected.not_to allow_value('alice@bob').for(:blockee) }
end
