class Section
	attr_accessor :sec_name,:count,:student_list
	def initialize(sec)
		self.count=0
		self.sec_name=sec
		self.student_list=[]
	end
	def enroll(student_name,student_department)
		student_list.push([student_name])
		self.count=self.count+1
		#puts "#{self.count}"
		self.student_list = self.student_list.sort.each{|i|
           if self.count < 10
               i[1]="#{student_department}#{self.sec_name}0#{self.student_list.sort.index(i)+1}"
          else
               i[1]="#{student_department}#{self.sec_name}#{self.student_list.sort.index(i)+1}"
          end}
		"You have been enrolled to #{student_department}" \
        "\nYou have been allotted section #{sec_name}" \
        "\nYour roll number is #{self.student_list.detect{|i| i[0]==student_name}[1]}"
     end
     def enroll1(student_name,student_department)
          student_list.push([student_name])
          self.count=self.count+1
          #puts "#{self.count}"
          self.student_list = self.student_list.sort.each{|i|
           if self.count < 10
               i[1]="#{student_department}#{self.sec_name}0#{self.student_list.sort.index(i)+1}"
          else
               i[1]="#{student_department}#{self.sec_name}#{self.student_list.sort.index(i)+1}"
          end}
        "You have been allotted section #{sec_name}" \
        "\nYour roll number is #{self.student_list.detect{|i| i[0]==student_name}[1]}"
     end

     def view()
     	if(self.count>0)
     		str=""
     	    self.student_list.each{|i| str += "\n#{i[0]} - #{i[1]}" }
              return str
     	end
     end

     def unenroll(student_name,student_department)
     	self.student_list.each{|i| 
     		if i[0] == student_name
     			self.student_list.delete_at(self.student_list.index(i))
     			self.count=self.count-1
     			self.student_list = self.student_list.sort.each{|i|
           if self.count < 10
               i[1]="#{student_department}#{self.sec_name}0#{self.student_list.sort.index(i)+1}"
          else
               i[1]="#{student_department}#{self.sec_name}#{self.student_list.sort.index(i)+1}"
          end}
     		end
     	}
     	#nil
     end
end