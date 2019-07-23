require_relative './section'
class Department
	attr_accessor :sections ,:dept_name,:total
	def initialize(dept)
		self.total= []
		self.dept_name=dept
		self.sections =[]
		 ['A','B','C'].each do |sec|
		  self.sections<<Section.new(sec)
		 end
	end

	def enroll(student_name)
		if sections[0].count + sections[1].count + sections[2].count > 30
			puts "Error : Seats are not available in #{self.dept_name} department"
		else
			total<<student_name
			if self.sections[0].count >= 10 
				if self.sections[1].count >= 10
					self.sections[2].enroll student_name,self.dept_name
				else
					self.sections[1].enroll student_name,self.dept_name
				end
			else
				self.sections[0].enroll student_name,self.dept_name
			end
		end
	end

	def dept_view()
		str=""
		if self.sections[0].view != nil
			str += self.sections[0].view
			if self.sections[1].view != nil
				str += self.sections[1].view
				if self.sections[2].view != nil
					str += self.sections[2].view
				end
			end
		else
			str += "No students in #{self.dept_name}"
		end
		return str
	end

	def sec_view(section)
		str=""
		sec=self.sections.detect{|i| i.sec_name == section}
		if sec.view != nil
			str+=sec.view()
		end
		return str
		#nil
	end
end