require 'rails_helper'

RSpec.describe Review, type: :model do

  describe 'relationships' do
    it {should belong_to :book}
  end

  describe 'validations' do
    it {should validate_presence_of :user_name}
    it {should validate_presence_of :rating}
    it {should validate_presence_of :review_headline}
    it {should validate_presence_of :review_body}
  end
end
