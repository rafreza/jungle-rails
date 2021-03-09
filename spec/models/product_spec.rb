require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "is valid with valid attributes" do 
      @category = Category.new(name: "Pants")
      @product = Product.new(
        name: "Classic Jeans",
        category: @category,
        description: "Levis-inspired jeans with a low cut, for those looking for a 80s feel.",
        quantity: 10,
        price: 2500, 
        image:'https://images.pexels.com/photos/603022/pexels-photo-603022.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260'
      )

      @product.save!

      expect(@product).to be_valid
    end

    it "is invalid without name attribute" do 
      @category = Category.new(name: "Pants")
      @product = Product.new(
        name: nil,
        category: @category,
        description: "Levis-inspired jeans with a low cut, for those looking for a 80s feel.",
        quantity: 10,
        price: 2500, 
        image:'https://images.pexels.com/photos/603022/pexels-photo-603022.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260'
      )

      @product.save

      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to eq(["Name can't be blank"])
    end

    it "is invalid without category attribute" do 
      @category = Category.new(name: "Winter Clothes")
      @product = Product.new(
        name: "Classic Jeans",
        category: nil,
        description: "Levis-inspired jeans with a low cut, for those looking for a 80s feel.",
        quantity: 10,
        price: 2500, 
        image:'https://images.pexels.com/photos/603022/pexels-photo-603022.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260'
      )

      @product.save

      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to eq(["Category can't be blank"])
    end

    it "is invalid without quantity attribute" do 
      @category = Category.new(name: "Winter Clothes")
      @product = Product.new(
        name: "Classic Jeans",
        category: @category,
        description: "Levis-inspired jeans with a low cut, for those looking for a 80s feel.",
        quantity: nil,
        price: 2500, 
        image:'https://images.pexels.com/photos/603022/pexels-photo-603022.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260'
      )

      @product.save

      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to eq(["Quantity can't be blank"])
    end

    it "is invalid without price attribute" do 
      @category = Category.new(name: "Winter Clothes")
      @product = Product.new(
        name: "Classic Jeans",
        category: @category,
        description: "Levis-inspired jeans with a low cut, for those looking for a 80s feel.",
        quantity: 10,
        price: nil, 
        image:'https://images.pexels.com/photos/603022/pexels-photo-603022.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260'
      )

      @product.save

      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to eq(["Price cents is not a number", "Price is not a number", "Price can't be blank"])
    end
  end

end

