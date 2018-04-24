require 'rails_helper'

RSpec.describe Following, type: :model do
  subject { create(:following) }
  it { is_expected.to validate_presence_of(:source) }
  it { is_expected.to validate_presence_of(:audience) }
  it { is_expected.to validate_uniqueness_of(:source).scoped_to(:audience) }

  it { is_expected.to allow_value('alice.bob@cat.com').for(:source) }
  it { is_expected.not_to allow_value('alice@bob').for(:source) }
  it { is_expected.to allow_value('alice.bob@cat.com').for(:audience) }
  it { is_expected.not_to allow_value('alice@bob').for(:audience) }
end
