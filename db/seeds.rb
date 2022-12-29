require "time"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


(1..5).each do |i|
         @user = User.create!(name: "User number #{i}", manager:true)
        #  BillProduct.create!(bill_id:@bill.id,product_id:@product.id)
        #  CustomerProductsList.create(bill_id:@bill.id,product_id:@product.id,quntity: i, price:i,total_price: i*i)
    end

(1..10).each do |i|
    @jogging_time = JoggingTime.create!(minutes: i + (i*0.1), distance: i + (i*0.1),date: Date.current,user_id:1)
    @jogging_time = JoggingTime.create!(minutes: i + (i*0.2), distance:i + (i*0.2),date: Date.current,user_id:2)
    @jogging_time = JoggingTime.create!(minutes: i + (i*0.3), distance:i + (i*0.3),date: Date.current,user_id:3)

end

@user_three = User.find 3
@user_three.destroy