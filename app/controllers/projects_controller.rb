class ProjectsController < ApplicationController
  before_action  only: %i[ create show update destroy ]
  # GET /
  def show
    render json: {  "Get":"/","get - all projects":"/projects", "post - create project or todo":"/projects/:id/todos","patch - update todo":"/projects/:id/todos/:idx" }
  end

  # GET /projects
  def index
    @project = Project.all
    render json: @project, except: [:created_at, :updated_at], include: {todos: {except: [:created_at, :updated_at, :project_id]}}, status: :ok
  end

  # POST /projects/:id/todos
  def create
    if Project.exists?(params[:id])
      @project = Project.find(params[:id])
      @todo = @project.todos.new(todo_params)
        if @project.save
          render json: @todo.to_json(except: [:created_at,  :updated_at, :project_id]), status: :created
        else
          render json: @todo.errors, status: :unprocessable_entity
        end
    else
      @project = Project.new(new_project)
        @todo = @project.todos.new(todo_params)
          if @project.save
            render json: @project.to_json(except: [:created_at, :updated_at, :project_id], include: {todos: {except: [:created_at, :updated_at, :project_id]}}), status: :created
          else
            render json: @todo.errors, status: :unprocessable_entity
         end
    end
  end

  # DELETE /projects/:id
  def delete
    @project = Project.find(params[:id])
    if @project.destroy
      render json: {"message":"ok"}, status: :ok
    else
      render json: {"message":"bad"}, status: :unprocessable_entity
    end
  end

  private  
  def new_project
    params.permit(:title)
  end

  def todo_params
    params.require(:todos).map { |m| m.permit(:isCompleted, :text) }
  end
end
