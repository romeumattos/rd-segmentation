require 'rails_helper'

RSpec.describe Contact, type: :model do
  context 'validations' do
    before { FactoryGirl.build(:contact) }

    it do
      should validate_presence_of(:name)
      should validate_presence_of(:email)
      should validate_presence_of(:state)

    end

  end
end
