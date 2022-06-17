class TodosController < ApplicationController
  before_action  only: %i[ new create show update destroy ]

  # GET /projects
  def index
    @todos = Todo.all
    render json: @todos
  end

  # PATCH /projects/:id/todos/:idx
  def update
    @project =  Project.find(params[:id])
    @todo = @project.todos.find(params[:idx])
    @todo.update(todo_idx)
    render json: @todo.to_json(except: [:created_at, :updated_at]), status: :ok
  end

    private  def new_project
      params.require(:todo).permit(:title)
    end

    private def todo_params
      params.require(:todo).permit(:text, :isCompleted)
    end

    private def todo_idx
      params.require(:todo).permit(:isCompleted)
    end
  end