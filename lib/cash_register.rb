require "pry"
class CashRegister
  attr_accessor :total, :discount, :items, :last_transaction 
  
  def initialize(discount = 0)
    @total = 0
    @discount = discount 
    @items = []
    @last_transaction = last_transaction
  end 

  def add_item(title, price, quantity = 1)
    #binding.pry
    quantity.times {@items << title}
     
    @last_transaction = price*quantity
    @total = @total + @last_transaction
    
  end 

  def apply_discount
    #binding.pry
    if @discount != 0 
      
    @total = (@total.to_f)*(0.8)
    "After the discount, the total comes to $#{@total.to_i}."
  else 
    "There is no discount to apply."
  end 
  end 

  def void_last_transaction
    #binding.pry 
     @total = @total - @last_transaction
  end 

end 

# describe 'CashRegister' do
#   l
#   end

#   describe '#total' do
#     it 'returns the current total' do
#       cash_register.total = 100
#       expect(cash_register.total).to eq(100)
#     end
#   end

#   describe '#add_item' do
#     it 'accepts a title and a price and increases the total' do
#       expect{cash_register.add_item("eggs", 0.98)}.to change{cash_register.total}.by(0.98)
#     end

#     it 'also accepts an optional quantity' do
#       expect{cash_register.add_item("book", 5.00, 3)}.to change{cash_register.total}.by(15.00)
#     end

#     it "doesn't forget about the previous total" do
#       cash_register.add_item("Lucky Charms", 4.5)
#       expect(cash_register.total).to eq(4.5)
#       cash_register.add_item("Ritz Crackers", 5.0)
#       expect(cash_register.total).to eq(9.5)
#       cash_register.add_item("Justin's Peanut Butter Cups", 2.50, 2)
#       expect(cash_register.total).to eq(14.5)
#     end
#   end

#   describe '#apply_discount' do
#     context 'the cash register was initialized with an employee discount' do
#       it 'applies the discount to the total price' do
#         cash_register_with_discount.add_item("macbook air", 1000)
#         cash_register_with_discount.apply_discount
#         expect(cash_register_with_discount.total).to eq(800)
#       end

#       it 'returns success message with updated total' do
#         cash_register_with_discount.add_item("macbook air", 1000)
#         expect(cash_register_with_discount.apply_discount).to eq("After the discount, the total comes to $800.")
#       end

#       it 'reduces the total' do
#         cash_register.total = 0
#         cash_register_with_discount.add_item("macbook air", 1000)
#         expect{cash_register_with_discount.apply_discount}.to change{cash_register_with_discount.total}.by(-200)
#       end
#     end

#     context 'the cash register was not initialized with an employee discount' do
#       it 'returns a string error message that there is no discount to apply' do
#         expect(cash_register.apply_discount).to eq("There is no discount to apply.")
#       end
#     end
#   end

#   describe '#items' do
#     it 'returns an array containing all items that have been added' do
#       new_register = CashRegister.new
#       new_register.add_item("eggs", 1.99)
#       new_register.add_item("tomato", 1.76, 3)
#       expect(new_register.items).to eq(["eggs", "tomato", "tomato", "tomato"])
#     end
#   end

#   describe '#void_last_transaction' do
#     it 'subtracts the last item from the total' do
#       cash_register.add_item("apple", 0.99)
#       cash_register.add_item("tomato", 1.76)
#       cash_register.void_last_transaction
#       expect(cash_register.total).to eq(0.99)
#     end

#     it 'returns the total to 0.0 if all items have been removed' do
#       cash_register.add_item("tomato", 1.76, 2)
#       expect{cash_register.void_last_transaction}.to change{cash_register.total}.from(3.52).to(0.0)
#     end
#   end
# end