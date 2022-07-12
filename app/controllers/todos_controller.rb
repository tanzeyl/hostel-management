class TodosController < ApplicationController
  def index
    # render plain: Todo.order(:id).map{ |todo| todo.toPleasantString }.join("\n")
    render "index"
  end

  def show()
    id = params[:id]
    todo = Todo.find(id)
    # render plain: todo.toPleasantString
    render "todo"
  end

  def create
    text = params[:todo_text]
    date = Date.today + params[:due_date].to_i
    new_todo = Todo.create!(todo_text: text, due_date: date, completed: false)
    render plain: "New todo created with ID: #{new_todo.id}"
  end

  def update
    id = params[:id]
    todo = Todo.find(id)
    todo.completed = true
    todo.save!
    render plain: "Todo updated."
  end
end
