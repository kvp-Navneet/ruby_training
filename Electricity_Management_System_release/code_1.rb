puts"********************************************************Welcome To Electricity Board********************************************************"
module Charges
$unitcost = 3 
$unitcost1 = 4
$unitcost2 = 6
$metercharge=80
end

def prompt(*username,password)
	print(*username)
	print(*password)
    gets
end 
 $User_Name= prompt "Enter Username:"
 $User_Name=$User_Name.chomp
 $Password = prompt "Enter Password:"
 $Password = $Password.chomp
#-------------------- Starting if block--------------------------------------------------------
if $User_Name=="ADMIN" and $Password=="ADMIN"
	puts "Hey you are logged in"
 #------continue with the class TEST------------------------------------------------------------------
class Test 
  include Charges
     def initialize(con_name,con_id,con_phone,con_address,prev_reading,curr_reading)
          @con_name=con_name
          @con_id=con_id
          @con_phone=con_phone
          @con_address=con_address
          @prev_reading=prev_reading
          @curr_reading=curr_reading
    end
 #-------------getters----------------------------------------------------------------------------
 def get_name
   @con_name
 end
 def get_id
   @con_id
 end
 def get_phone
   @con_phone
 end
 def get_address
   @con_address
 end
  def get_prev_reading
   @prev_reading
  end
   def get_curr_reading
   @curr_reading
   end
 #-------------setters-----------------------------------------------------------------------------
  def set_name=(value)
   @con_name=value
  end
  def set_id=(value)
   @con_id=value
  end
  def set_phone=(value)
   @con_phone=value
  end
  def set_address=(value)
   @con_address=value
  end
  def set_prev_reading=(value)
   @prev_reading=value
  end
  def set_curr_reading=(value)
   @curr_reading=value
  end
end 
#--------------------------------end of class Test--------------------------------------------------
class BillGenerator < Test
  include Charges
 def initialize(con_name,con_id,con_phone,con_address,prev_reading,curr_reading,meter_no,branch_EB)#over-riding
   super(con_name,con_id,con_phone,con_address,prev_reading,curr_reading)
   @branch_EB = branch_EB
   @meter_no =meter_no
 end
 def get_branch_EB
	@branch_EB
 end 
 def set_branch_EB=(value)
		@branch_EB= value
 end 
 def get_meter_no
	@meter_no
 end 
 def set_meter_no=(value)
		@meter_no= value
 end 
end 
#--------------------------------end of class BillGenerator--------------------------------------------------
puts "Enter Consumer NAME:"
name= STDIN.gets 
puts "Enter Consumer ID:"
id= gets.to_i
puts "Enter Consumer PHONE no.:"
phone= gets.to_i
puts "Enter Consumer ADDRESS:"
address= STDIN.gets 
puts "Enter meter  no:"
meterno= gets.to_i
puts "Enter meter previous month reading:"
pread= gets.to_i
puts "Enter meter current reading:"
cread= gets.to_i
puts "Enter Electricity Board Branch :"
branch= STDIN.gets 
Generate_bill=BillGenerator.new(name,id,phone,address,pread,cread,meterno,branch)# passing argumnets values 
#--------------------------------------calling Getters -------------------------------------------------------
@N=Generate_bill.get_name()
@I=Generate_bill.get_id()
@P=Generate_bill.get_phone()
@A=Generate_bill.get_address()
@M=Generate_bill.get_meter_no()
@Pr=Generate_bill.get_prev_reading()
@Cr=Generate_bill.get_curr_reading()
@B=Generate_bill.get_branch_EB()
@unit=@Cr-@Pr # calculating comsumed unit
@unit=@unit.to_i 
$unitcost = $unitcost.to_i
$unitcost1 = $unitcost1.to_i
$unitcost2 = $unitcost2.to_i
$metercharge=$metercharge.to_i
@totcost
if @unit < 51
    @totcost=$metercharge+@unit*$unitcost
elsif 50 < @unit and @unit< 100
    	    @totcost=$metercharge+@unit*$unitcost1
    	else 
    		    @totcost=$metercharge+@unit*$unitcost2
    		end

puts "***********************************Electricity Bill***********************************"
time2 = Time.now
puts "Time : " + time2.inspect
print "CONSUMER NAME:"
puts @N
puts "---------------------------------------"
print "CONSUMER ID:"
puts @I
puts "---------------------------------------"
print "CONSUMER PHONE NO.:"
puts @P
puts "---------------------------------------"
print "CONSUMER ADDRESS:"
puts @A
puts "---------------------------------------"
print "METER NUMBER:"
puts @M
puts "---------------------------------------"
print "PREVIOUS READING:"
puts @Pr
puts "---------------------------------------"
print "CURRENT READING:"
puts @Cr
puts "---------------------------------------"
print "EB BRANCH NAME:"
puts @B
puts "---------------------------------------"
print "UNIT CONSUMED:"
puts @unit
puts "---------------------------------------"
print "Total Bills:"
puts @totcost
puts "#***********************Charges Dtails***********************#"
print "if consumend unit is within 50units:"
puts"Rs. 3 per unit "
print "if consumend unit is within 50units to 100units :"
puts"Rs. 4 per unit "
print "if consumend unit is above 100units :"
puts"Rs. 6 per unit "
puts "***********************************THANK YOU***********************************"
else 
	puts  "Login Unsucessful"
end
#--------------------------------end of class Test--------------------------------------------------


