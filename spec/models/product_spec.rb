require 'rails_helper'

# RSpec.describe Product, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    # before do
    #   @category = Category.new
    #   @product = Product.new
      
    # end
    it "should check if its valid" do
      category = Category.new(name: "books" )
      product = Product.new( name:"book", price_cents: 240, quantity: 25, category: category  )
      # puts product.price
      expect(product).to be_valid
      expect(product.errors.full_messages).to be_empty
    end
    it "should check if its not valid without a name" do
      category = Category.new(name: "books" )
      product = Product.new( name: nil, price_cents: 240, quantity: 25, category: category  )
      puts '------------'
      puts product.errors
      product.errors.full_messages.each do |num|     
        puts num 
        puts '*****'
      end
      expect(product).to_not be_valid

      expect(product.errors.full_messages).to include("Name can't be blank")
    end
    it "should check if its not valid without a price" do
      category = Category.new(name: "books" )
      product = Product.new( name: "example", price_cents: nil, quantity: 25, category: category  )
      expect(product).to_not be_valid
      
      # expect(product.errors.full_messages).to include("Name can't be blank")
    end 
    it "should check if its not valid without a quantity" do
      category = Category.new(name: "books" )
      product = Product.new( name: "example", price_cents: 250, quantity: nil, category: category  )
      expect(product).to_not be_valid
      
      # expect(product.errors.full_messages).to include("Name can't be blank")
    end 
    it "should check if its not valid without a category" do
      category = Category.new(name: "books" )
      product = Product.new( name: "example", price_cents: 250, quantity: 12, category: nil  )
      expect(product).to_not be_valid
      
      # expect(product.errors.full_messages).to include("Name can't be blank")
    end 
    
  end
end