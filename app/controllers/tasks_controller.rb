class TasksController < ApplicationController

  def list
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
    # when executing show, I will take the selected TASK, and find the corresponding task
    # via its ID. Then display that page as a '/:ID' extension of the URL
  end

  def new
    @task = Task.new
    # with this I package the filled form with the information of the task and
    # create an instance with it. I then POST that instance to create to create and save it.
  end

  def edit
    @task = Task.find(params[:id])
  end

  def destroy
    @task = Task.find(params[:id])
    # again finding this particular Task
    @task.destroy
    # bye bye
    redirect_to tasks_path, status: :see_other
    # redirect to home
  end

  def update
    @task = Task.find(params[:id])
    # with this I find the task in question and return it
    if @task.update(task_params)
      # .update does what it do, however to ensure no FORBIDDEN ATTRIBUTE ERROR, I once again pass task_params
      # (which is in the private section)
      redirect_to task_path(@task)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to task_path(@task)
      # this will redirect to the task/ID of the task you just created. IF SUCCESSFUL
    else
      render :new, status: :unprocessable_entity
      # if theres issues, RENDER will take take the page '/new' and present it again
      # but with a status, in this case: "unprocessable entity"
      # idk wtf this means
    end
  end

  private

  # you know what private does, puts the following methods behind a privacy wall
  # ensures inaccessibility to outside sources
  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
  # here we say, the method task_params, does this:
  # PARAMETERS are REQUIRED for TASK model.
  # We will only PERMIT these fields: "title" and "details"
  # all others will be rejected/filtered out

  # we then use this method as a variable to pass into the CREATE method.
  # this ensure the information we pass through has been formated and filtered
  # to guarentee it conforms to our needs
end
