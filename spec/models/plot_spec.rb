require 'rails_helper'

RSpec.describe Plot do
  describe 'relationships' do
    it { should belong_to(:garden) }
    it { should have_many(:plant_pots) }
    it { should have_many(:plants).through(:plant_pots) }

  end
end
