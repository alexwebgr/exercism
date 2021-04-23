class School
  def initialize
    @grades = Hash.new { |grades, grade| grades[grade] = [] }
  end

  def add(student, grade)
    @grades[grade] << student
  end

  def students(grade)
    @grades[grade].sort
  end

  def grades
    @grades.keys.sort
  end

  def students_by_grade
    grades.map { |grade| { grade: grade, students: students(grade) } }
  end
end
