require 'rails_helper'
require 'product'
require 'category'
RSpec.describe Product, type: :model do

  it "is valid with valid attributes" do
    @category=Category.new(name: "name")
    @product=Product.new(
      name: 'name',
      price_cents: 5000,
      quantity: 4,
      category: @category
    )
    @product.validate
    end

  describe 'Validations' do
    it "is not valid without a name" do 
      @category=Category.new(name: "name")
      @product=Product.new(
        name: 'name',
        price_cents: 5000,
        quantity: 4,
        category: @category
      )
      @product.name = nil
      expect(@product).to_not be_valid
      expect(@product.errors.messages[:name]).to eq(["can't be blank"])
    end
    it "is not valid without a price" do 
      @category=Category.new(name: "name")
      @product=Product.new(
        name: 'name',
        price_cents: 5000,
        quantity: 4,
        category: @category
      )
      @product.price_cents = nil
      expect(@product).to_not be_valid
      expect(@product.errors.messages[:price_cents]).to eq(["is not a number"])
    end
    it "is not valid without a quantity" do
      @category=Category.new(name: "name")
      @product=Product.new(
        name: 'name',
        price_cents: 5000,
        quantity: 4,
        category: @category
      )
      @product.quantity = nil
      expect(@product).to_not be_valid
      expect(@product.errors.messages[:quantity]).to eq(["can't be blank"])
    end

    it "is not valid without a category" do
      @category=Category.new(name: "name")
      @product=Product.new(
        name: 'name',
        price_cents: 5000,
        quantity: 4,
        category: @category
      )
      @product.category = nil
      expect(@product).to_not be_valid
      expect(@product.errors.messages[:category]).to eq(["can't be blank"])

    end
  end  
  end

