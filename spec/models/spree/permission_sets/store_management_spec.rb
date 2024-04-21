# frozen_string_literal: true

require 'spec_helper'

describe Spree::PermissionSets::StoreManagement do
  subject { ability }

  let(:ability) { Spree::Ability.new(user) }

  let(:user) { FactoryBot.create(:user) }

  let(:store) { FactoryBot.create(:store) }
  let(:kiosk) { FactoryBot.create(:store) }

  before do
    store.users << user
  end

  context "when activated" do
    before do
      described_class.new(ability).activate!
    end

    it { is_expected.to be_able_to(:manage, store) }

    it { is_expected.not_to be_able_to(:manage, kiosk) }
  end

  context "when not activated" do
    it { is_expected.not_to be_able_to(:manage, Spree::Store) }
  end
end
