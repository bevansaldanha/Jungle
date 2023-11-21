require 'rails_helper'

RSpec.describe Product, type: :model do
  before do 
    @category = Category.create!({name:'random'})

  end
  describe 'Validations' do
      it 'should not validate a product without a name' do
        product = Product.new({name:nil,description:'a description',image:'img',price:1000,quantity:5,category_id:@category.id})
        expect(product).to_not be_valid
      end
      it 'should not validate a product without a price' do
        product = Product.new({name:'name',description:'a description', image:'img', price:'', quantity:5, category_id:@category.id})
        expect(product).to_not be_valid
      end
      it 'should not validate a product without a quantity' do
        product = Product.new({name:'name',description:'a description', image:'img', price:'', quantity:'', category_id:@category.id})
        expect(product).to_not be_valid
      end
      it 'should not validate a product without a quantity' do
        product = Product.new({name:'name',description:'a description', image:'img', price:'', quantity:'', category_id:''})
        expect(product).to_not be_valid
      end
  end
end
