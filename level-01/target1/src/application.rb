require_relative './department' # Include other files in the same directory
require_relative './section'
# Your application
class Application
  attr_accessor :departments
  

  def initialize
    self.departments =[]
     ['EEE', 'MECH', 'CSE', 'CIVIL'].each do |dept|
      self.departments<<Department.new(dept) 
    end 
   #puts self.departments[0] 
  end

  def enroll(student_name, student_department)
    # This is a sample implementation. you can write your own code
     #puts department
     department = self.departments.detect{|i| i.dept_name == student_department }
     department.enroll(student_name)
  end

  def change_dept(student_name, student_department)
    ## write some logic to frame the string below
    departments.each{|i| i.sections.each{|j| j.student_list.each{|k| 
      if(k[0] == student_name)
       i.total = i.total-[student_name] 
       j.unenroll student_name,i.dept_name
      end
    }}}
    department = self.departments.detect{|i| i.dept_name == student_department }
    return department.enroll student_name
  end

  def change_section(student_name, section)
    ## write some logic to frame the string below
    dep=""
    departments.each{|i|
    	if i.total.include?student_name
    		dep=i.dept_name
    	end

    }
   self.departments.each{|i| 
   	if i.dept_name == dep
   		i.sections.each{|j|
   	j.student_list.each{|k| 
      if(k[0] == student_name) 
       j.unenroll student_name,dep
      end
    }
}
    l=i.sections.detect{|x| x.sec_name == section}
    if l.count>10
        return "Error: Seats are not available in #{sec.sec_name} section"
       else
        return l.enroll1 student_name,dep
       end
   end
}
#nil
  end

  def department_view(student_dept)
    ## write some logic to frame the string below
    department = self.departments.detect{|i| i.dept_name == student_dept }
    #puts "#{department.dept_name}" 
    return "List of students:" + department.dept_view()
  end

  def section_view(student_dept, section)
    ## write some logic to frame the string below
    department = self.departments.detect{|i| i.dept_name == student_dept }
    return "List of students:" + department.sec_view(section)
  end

  def student_details(student_name)
    ## write some logic to frame the string below
    departments.each{|i| i.sections.each{|j| j.student_list.each{|k| 
      if(k[0] == student_name) 
        return "#{student_name} - #{i.dept_name} - Section #{j.sec_name} - #{k[1]}"
      end
    }}}
    #nil
  end
end
