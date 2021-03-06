require 'rails_helper'

RSpec.describe Order, type: :model do
  context "associations" do
    it { should belong_to :user }
    it { should have_many :item_orders }
    it { should have_many(:items).through(:item_orders) }
  end

  

end
