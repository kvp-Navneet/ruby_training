puts"********************************************************Welcome To Electricity Board********************************************************"
class ElecticityBill
	 def initialize
    @bill_inputs = ["name", "id","phone_no", "meter_no", "prev_reading", "current_reading", "branch"]
  end
  def login
      puts"=======LOGIN ACCOUNT====="	
      puts "Enter Username"
      @username=STDIN.gets.chomp
     puts "Enter Password"
     @password =STDIN.gets.chomp  
     if (@username=="ADMIN" and @password=="ADMIN")
       true
       else
   	  false
       end
  end
     def get_details
         @bill_inputs.each do |b|
          puts "Enter #{b.capitalize.sub("_", " ")}"
           instance_variable_set("@#{b}", gets.chomp)
          end
        end
def generate_bill
    @metercharge = 80
    @unitcost = 3
    @unitcost1 = 4
    @unitcost2 = 6
    @current_reading = @current_reading.to_i
    @prev_reading = @prev_reading.to_i
    @unit_diff=@current_reading - @prev_reading
    @unit_diff=@unit_diff.to_i
    @totcost = 0
    if @unit_diff < 51
      @totcost=@metercharge+@unit_diff*@unitcost
    elsif 50 < @unit_diff and @unit_diff< 100
      @totcost=@metercharge+@unit_diff*@unitcost1
    else
      @totcost=@metercharge+@unit_diff*@unitcost2
    end
  end
  def display_bill
    generate_bill
    puts "==========================Consumer Details======================================"
    @bill_inputs.each do |data|
      puts "#{data.capitalize.sub("_", " ")} : #{instance_variable_get("@#{data}")}"
    end
    puts "==========================Bill Details============================="
    puts "Unit Consumed: #{@unit_diff}"
    puts "Total Cost : #{@totcost}"
  end
end
check= ElecticityBill.new
if check.login
   check.get_details
   check.display_bill
  else
  puts "Enter correct Login Details"
end
