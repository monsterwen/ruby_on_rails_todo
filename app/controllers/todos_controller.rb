class TodosController<ApplicationController
  before_action :set_todo, only: [:show, :destroy,:update,:edit]
  
  
  def new
   @todo=Todo.new 
  end
  
  def index
    @todos=Todo.all
  end
  def destroy
    @todo.destroy
    flash[:notice]="todo is deleted"
    redirect_to todos_path
    
  end
  
  
  def create
    @todo=Todo.new(todo_params)
    if @todo.save
    #the resource :todos create the show page for todos, 
      flash[:notice]="todo was created successfully!"
      redirect_to todo_path(@todo)
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @todo.update(todo_params)
      flash[:notice]="todo is successfully uptated"
      redirect_to todo_path(@todo)
    else
      render 'edit'
    end
  end
  
  def show
  end
  
  def set_todo
     @todo=Todo.find(params[:id])
  end
  
  private
  # white listing all allowed to pass the the page 
     def todo_params
       # .require(:todo) will create a hash map {name:, description}
       params.require(:todo).permit(:name,:description)
     end
end