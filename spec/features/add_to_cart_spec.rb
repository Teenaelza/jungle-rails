require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature ,js: true do
  before :each do
    @category = Category.create! name: 'Apparel'
    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end
  scenario "They can navigate to add to cart" do
    # ACT
    visit root_path
    all(".product").first.find('.button_to').click        
       # DEBUG / VERIFY
    save_screenshot
  end
end
