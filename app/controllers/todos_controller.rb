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
  
  def show
    @todo=Todo.find(params[:id])
    
  end
  
  private
  # white listing all allowed to pass the the page 
     def todo_params
       # .require(:todo) will create a hash map {name:, description}
       params.require(:todo).permit(:name,:desctiption)
     end
end