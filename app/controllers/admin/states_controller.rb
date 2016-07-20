class Admin::StatesController < Admin::AdminsController
  def index
    @states = State.all
  end

  def new
    @state = State.new
    @state.country_id = params[:format]
  end

  def create
    @state = State.create(permitted_columns)

    if @state.errors.any?
      render :new
    else
      redirect_to admin_states_path
    end
  end

  def edit
    find_params
  end

  def update
    find_params
    @state.update_attributes(permitted_columns)

    redirect_to admin_states_path
  end

  def show
    find_params
  end

  def destroy
    find_params
    if @state.destroy
      flash[:notice] = 'Delete success'
    else
      flash[:notice] = 'Delete error'
    end
    redirect_to admin_states_path
  end

  private
    def permitted_columns
      params.require(:state).permit(:name, :initials, :country_id)
    end

    def find_params
      @state = State.find(params[:id])
    end
end