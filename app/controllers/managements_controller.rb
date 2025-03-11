class ManagementsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_management, only: %i[ show edit update destroy ]

  # GET /managements or /managements.json
  def index
    @managements = Management.by_user(current_user)
    @exceptions = Management.by_exception(current_user)
 
  end

  # GET /managements/1 or /managements/1.json
  def show
  end

  # GET /managements/new
  def new
    @management = Management.new
  end

  # GET /managements/1/edit
  def edit
  end

  # POST /managements or /managements.json
  def create
    @management = Management.new(management_params)

    respond_to do |format|
      if @management.save
        format.html { redirect_to @management, notice: "Management was successfully created." }
        format.json { render :show, status: :created, location: @management }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @management.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /managements/1 or /managements/1.json
  def update
    respond_to do |format|
      if @management.update(management_params)
        format.html { redirect_to @management, notice: "Management was successfully updated." }
        format.json { render :show, status: :ok, location: @management }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @management.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /managements/1 or /managements/1.json
  def destroy
    @management.destroy!

    respond_to do |format|
      format.html { redirect_to managements_path, status: :see_other, notice: "Management was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_management
      @management = Management.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def management_params
      params.require(:management).permit(:user_id, :project_id)
    end
end
