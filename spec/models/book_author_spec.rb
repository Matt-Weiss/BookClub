require 'rails_helper'

RSpec.describe BookAuthor, type: :model do
  it {should have_many :books}
  it {should have_many :authors}
end
