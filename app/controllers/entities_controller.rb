class EntitiesController < ApplicationController
  before_action :set_entity, only: %i[show edit update destroy]

  # GET /entities or /entities.json
  def index
    @category = Category.find_by_id(params[:category_id])
    @entities = Entity.where(category_id: params[:category_id], user: current_user).order('created_at ASC')
  end

  # GET /entities/1 or /entities/1.json
  def show
    @transaction = Entity.find_by_id(params[:id])
  end

  # GET /entities/new
  def new
    @category = Category.find_by_id(params[:category_id])
    @entity = Entity.new
  end

  def create
    puts 'Processing create'
    transaction = Entity.new(entity_params)
    transaction.category_id = params[:category_id]
    transaction.user = current_user
    if transaction.valid?
      transaction.save
      redirect_to entities_path(category_id: params[:category_id]), notice: 'Transaction added'
    else
      redirect_to new_entity_path(category_id: params[:category_id]),
                  alert: transaction.errors.first.message, status: 400
    end
  end

  # DELETE /entities/1 or /entities/1.json
  def destroy
    @entity.destroy

    respond_to do |format|
      format.html do
        redirect_to entity_index_path(category_id: params[:category_id]), notice: 'Entity was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_entity
    @entity = Entity.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def entity_params
    params.require(:entity).permit(:name, :amount, :category_id)
  end
end
