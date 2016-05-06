
class Employee

	attr_reader :name

	# attr_writer methods
	def name=(value)
		if value == "" || value.class != String
			raise "Employee's must have a name!"
		else
			@name = value
		end
	end 

	# +++++++++++++++++++++++++++++++++++
	# +++++++++++++++++++++++++++++++++++

	# variable init
	def initialize(name="")
		self.name = name
	end

	# class method
	def print_name
		puts "From classEmployee, Name: #{name}"
	end

end

class SalariedEmployee < Employee

	attr_reader :salary

	# attr_writer methods
	def salary=(value)
		valClass = value.class
		if (valClass == Fixnum || valClass == Float) && value > 0
			@salary = value
		else
			raise "Salary must have a dollar amount!"
		end
	end 

	# +++++++++++++++++++++++++++++++++++
	# +++++++++++++++++++++++++++++++++++

	def testSelf(what)
		puts "testSelf: #{what}, SELF: #{self}, Name: #{name}, Salary: #{salary}"
	end

	def initialize(name="",salary="")
		# access super class initializer
		super(name)
		self.salary = salary
		self.testSelf(self)
	end

	# method
	def print_pay_stub()
		print_name
		pay_for_period = format("%0.2f",(salary / 365.0) * 14)
		puts "Pay this period: $#{pay_for_period}"
	end
end

class HourlyEmployee < Employee

	# factory class methods
	def self.security_guard(name)
		HourlyEmployee.new(name,19.25,30)
	end

	def self.cashier(name)
		HourlyEmployee.new(name,12.75,25)
	end

	def self.janitor(name)
		HourlyEmployee.new(name,10.50,20)
	end

	# ++++++++++++++++++++++++++++++++++

	attr_reader :hourly_wage, :hours_per_week

	# attr_writer methods
	def hourly_wage=(value)
		valClass = value.class
		if (valClass == Fixnum || valClass == Float) && value > 0
			@hourly_wage = value
		else
			raise "Hourly_wage must have a dollar amount!"
		end
	end 

	def hours_per_week=(value)
		valClass = value.class
		if (valClass == Fixnum || valClass == Float) && value > 0
			@hours_per_week = value
		else
			raise "Hours_per_week must have hours!"
		end
	end 

	# +++++++++++++++++++++++++++++++++++
	# +++++++++++++++++++++++++++++++++++

	def testSelf(what)
		puts "testSelf: #{what}, SELF: #{self}, Name: #{name}"
	end

	def initialize(name="",hourly_wage="",hours_per_week="")
		# access super class initializer
		super(name)
		self.hourly_wage = hourly_wage
		self.hours_per_week = hours_per_week
		self.testSelf(self)
	end

	# 
	def print_pay_stub()
		print_name
		pay_for_period = hourly_wage * hours_per_week * 2
		formatted_pay = format("%0.2f", pay_for_period)
		puts "Pay this period: $#{formatted_pay}"
	end
end