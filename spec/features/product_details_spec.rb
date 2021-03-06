require 'rails_helper'

RSpec.feature "Users can navigate from the home page.", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: "Apparel"

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset("apparel1.jpg"),
        quantity: 10,
        price: 64.99,
      )
    end
  end

  scenario "They go to the product detail page by clicking on a product" do

    visit root_path
  
    click_link("Details »", match: :first)

    expect(page).to have_css '.product-detail'

    save_screenshot('test2.png')


  end
end
