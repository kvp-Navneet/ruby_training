
puts"********************************************************Welcome To Electricity Board********************************************************"
module ElectricityBill
class Authentication
def login()
      puts"=======LOGIN ACCOUNT=====" 
      puts "Enter Username"
      @username=STDIN.gets.chomp
      puts "Enter Password"
      @password =STDIN.gets.chomp  
     if (@username == "ADMIN" && @password=="ADMIN")
     true
     else
     false
     end
 end
 end
check=ElectricityBill::Authentication.new
#-------------------- Starting if block--------------------------------------------------------
if check.login() ==true
   #------continue with the class TEST------------------------------------------------------------------
 class ConsumerDetails
  puts "Hey welcome you are login now!!"
      def initialize(con_name,con_id,con_phone,con_address,prev_reading,curr_reading)
          @con_name=con_name
          @con_id=con_id
          @con_phone=con_phone
          @con_address=con_address
          @prev_reading=prev_reading
          @curr_reading=curr_reading
      end
 #-----------------------------------accessor attribute--------------------------------------------
     attr_accessor :con_name
     attr_accessor :con_id
     attr_accessor :con_phone
     attr_accessor :con_address
     attr_accessor :prev_reading
     attr_accessor :curr_reading
end
 #--------------------------------end of class Test--------------------------------------------------
class BillGenerator < ConsumerDetails

 def initialize(con_name,con_id,con_phone,con_address,prev_reading,curr_reading,meter_no,branch_EB)#over-riding
   super(con_name,con_id,con_phone,con_address,prev_reading,curr_reading)
   @branch_EB = branch_EB
   @meter_no =meter_no
 end
 attr_accessor :branch_EB
 attr_accessor :meter_no
 def totCost(pr,cr)
   @Unitcost = 3 
   @Unitcost1 = 4
   @Unitcost2 = 6
   @Metercharge=80
@unit=cr.to_i-pr.to_i # calculating comsumed unit
p @unit
@unit=@unit.to_i
@totcost = 0
if @unit < 51
    @totcost=@Metercharge+@unit*@Unitcost
elsif 50 < @unit and @unit< 100
          @totcost=@Metercharge+@unit*@Unitcost1
else 
            @totcost=@Metercharge+@unit*@Unitcost2
end
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
if (cread!=~/^[0-9]+$/ and pread>cread)
  puts "invalid reading"
end
puts "Enter Electricity Board Branch :"
branch= STDIN.gets 
Generate_bill=ElectricityBill::BillGenerator.new(name,id,phone,address,pread,cread,meterno,branch)# passing argumnets values 
#--------------------------------------calling Getters -------------------------------------------------------
@N=Generate_bill.con_name
@N=@N.chomp
@I=Generate_bill.con_id
@P=Generate_bill.con_phone
@A=Generate_bill.con_address
@M=Generate_bill.meter_no
@Pr=Generate_bill.prev_reading
@Cr=Generate_bill.curr_reading
@B=Generate_bill.branch_EB

puts "***********************************Electricity Bill***********************************"
time2 = Time.now
print "Time : " + time2.inspect+"|||"
print"Pending From:10/12/2015"+"--"+ "To:10/01/2016"
if @N=="\n" or @I==0 or @P==0 or @A=="\n" or @M==0 or @Pr==0 or @Cr==0 or @B=="\n" 
puts ""
		puts "ENTER ALL INPUTS TO GENERATE BILL"
	else 
    puts""
puts "---------------------------------------CONSUMER DETAILS--------------------------------"
puts "CONSUMER NAME:#{@N}"
puts "CONSUMER ID:#{@I}"
puts "CONSUMER PHONE NO.:#{@P}"
puts"CONSUMER ADDRESS:#{@A}"
puts "=======================================BILL DETAILS====================================="
puts "METER NUMBER:#{@M}"
puts "PREVIOUS READING:#{@Pr}"
puts "CURRENT READING:#{@Cr}"
puts "EB BRANCH NAME:#{@B}"
print "UNIT CONSUMED:#{@unit}"
print " "
@tot=Generate_bill.totCost(pread,cread)
puts "Total Bills:#{@tot}"
puts "#**********************************Charges Dtails*************************************#"
print "if consumend unit is within 50units:"
puts"Rs. 3 per unit "
print "if consumend unit is within 50units to 100units :"
puts"Rs. 4 per unit "
print "if consumend unit is above 100units :"
puts"Rs. 6 per unit "
end
      puts "**************************************THANK YOU***************************************"
else 
	puts  "Login Unsucessful"
 end
end