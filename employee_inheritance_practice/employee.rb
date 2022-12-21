class Employee
    attr_accessor :name, :title, :salary, :boss

    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
        temp_boss = @boss.dup
        while temp_boss != nil
            temp_boss.add_employees(self)
            temp_boss = temp_boss.boss
        end
    end

    def bonus(multiplier)
        if self.is_a?(Manager)
            sum = 0
            self.employees.each do |emp|
               sum +=  emp.salary
            end
            return sum * multiplier
        else
            return self.salary * multiplier
        end
     end
end