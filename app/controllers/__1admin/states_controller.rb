class Admin::StatesController < Admin::AdminsController
  before_action :set_admin_state, only: [:show, :edit, :update, :destroy]

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
  end

  def update
    @state.update_attributes(permitted_columns)

    redirect_to admin_states_path
  end

  def show
  end

  def destroy
    if @state.destroy
      flash[:notice] = 'Delete success'
    else
      flash[:notice] = 'Delete error'
    end
    redirect_to admin_states_path
  end

  private
    def set_admin_state
      @state = State.find(params[:id])
    end

    def permitted_columns
      params.require(:state).permit(:name, :initials, :country_id)
    end
end