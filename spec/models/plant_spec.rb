require 'rails_helper'

RSpec.describe Plant, type: :model do
  describe 'relationships' do
    it { should have_many(:plant_pots) }
    it { should have_many(:plots).through(:plant_pots) }
  end

  # describe 'validations' do
  #   it { should validate_presence_of(:) }
  # end
  #
  # before :each do
  #
  # end
  #
  # describe 'class methods' do
  #   describe '.' do
  #   end
  # end
  #
  # describe 'instance methods' do
  #   describe '#' do
  #   end
  # end
end
