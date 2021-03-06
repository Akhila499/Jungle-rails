require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  
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

    # find('article.product').click_link('Details')
    find("article.product", match: :first).click_link('Details')
    # find('article.product').first(:link, "Details").click
    # DEBUG / VERIFY
    # save_screenshot
    
    expect(page).to have_css 'section.products-show'
  end
end
