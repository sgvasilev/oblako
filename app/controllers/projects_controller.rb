class ProjectsController < ApplicationController
  before_action  only: %i[ create show update destroy ]
  # GET /
  def show
    render json: {  "Get":"/","get - all projects":"/projects", "post - create project or todo":"/projects/:id/todos","patch - update todo":"/projects/:id/todos/:idx" }
  end

  # GET /projects
  def index
    project = Project.all
    render json: project.to_json(except: [:created_at, :updated_at], include: {todos: {except: [:created_at, :updated_at]}}), status: :ok
  end

  # POST /projects/:id/todos
  def create
    if Project.where(:id => params[:id]).blank?
      @project = Project.new(new_project)
      if @project.save
        @todo = @project.todos.new(todo_params)
        if @todo.save
          render json: @todo.to_json(except: [:created_at, :updated_at]), status: :created
        else
          render json: @todo.errors, status: :unprocessable_entity
        end
      else
        render json: @todo.errors, status: :unprocessable_entity
      end
    else
      @project = Project.find(params[:id])
      @todo = @project.todos.new(todo_params)
        if @todo.save
          render json: @todo.to_json(except: [:created_at, :updated_at]), status: :created
        else
          render json: @todo.errors, status: :unprocessable_entity
        end
    end
end

private  def new_project
  params.require(:project).permit(:title)
end

private def todo_params
  params.require(:todo).permit(:text, :isCompleted)
end
end
