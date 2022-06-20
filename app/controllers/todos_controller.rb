class TodosController < ApplicationController
  before_action  only: %i[ new create show update destroy ]

  # GET /projects
  def index
    @todos = Todo.All
    render json: @todos
  end

  # PATCH /projects/:id/todos/:idx
  def update
    set_projects
    set_todo
    @todo.update_column(:isCompleted, params[:isCompleted])
    render json: @todo.to_json(except: [:created_at, :updated_at, :project_id]), status: :ok
  end

    private 
    def todo_params
      params.require(:todo).permit(:isCompleted)
    end
    def set_projects
      @projects = Project.find(params[:id])
    end
    def set_todo
      @todo = @projects.todos.find(params[:idx])
    end
    def todo_status
      params.require(:todo).permit(:isCompleted)
    end
  end