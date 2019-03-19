require 'rails_helper'

RSpec.describe BookAuthor, type: :model do
  describe 'relationships' do
    it {should belong_to :books}
    it {should belong_to :authors}
  end
end
