class Todo < ApplicationRecord
  belongs_to :user
  def toPleasantString
    is_completed = completed ? "Yes" : "No"
    "#{id}. #{todo_text} \t\t#{due_date.to_fs(:short)}\t#{is_completed}"
  end
end
