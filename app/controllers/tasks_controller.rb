class TasksController < ApplicationController
  def index
  end
  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  def edit
    @task = Task.find_by(id: params[:id])
  end

  def create
    @task = Task.create(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to project_path(@task.project_id), notice: 'Task was successfully saved.' }
        format.json { render :show, status: :ok, location: @task  }
      else
        redirect_to root_path
      end
    end

  end

  #PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    @task = Task.find_by(id: params[:id])
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to project_path(@task.project_id), notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task  }
      else
        redirect_to root_path
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    task = Task.find_by(id: params[:id])
    project = Project.find_by(id: task.project_id)
    task.destroy
    respond_to do |format|
      format.html { redirect_to project_path(project), notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :status, :completed, :deadline, :project_id)
  end

end
