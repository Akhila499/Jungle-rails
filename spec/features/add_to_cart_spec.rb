require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  # pending "add some scenarios (or delete) #{__FILE__}"
  # SETUP
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


  scenario "click the product and see the details of the product" do
    # ACT
    visit root_path
    first('article.product').click_on('Add')
    
    expect(page).to have_text 'My Cart (1)'
    # DEBUG / VERIFY
    save_screenshot

  end
end
