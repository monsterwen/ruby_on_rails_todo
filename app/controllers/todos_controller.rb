class TodosController<ApplicationController
  def new
   @todo=Todo.new 
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
    @todo=Todo.find(params[:id])
  end
  
  def update
    @todo=Todo.find(params[:id])
    if @todo.update(todo_params)
      flash[:notice]="todo is successfully uptated"
      redirect_to todo_path(@todo)
    else
      render 'edit'
    end
  end
  
  def show
    @todo=Todo.find(params[:id])
  end
  
  private
  # white listing all allowed to pass the the page 
     def todo_params
       # .require(:todo) will create a hash map {name:, description}
       params.require(:todo).permit(:name,:description)
     end
end