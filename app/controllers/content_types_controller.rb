class ContentTypesController < ApplicationController
  before_action :authenticate_user!
  before_action  :set_content_type, only: [:show, :edit, :update, :destroy]

  # GET /content_types
  def index
    @content_types = ContentType.my_contents(current_user)
  end

  # GET /content_types/1
  def show
  end

  # GET /content_types/new
  def new
    @content_type = ContentType.new
    @content_type.content_fields.build
  end

  # GET /content_types/1/edit
  def edit
  end

  # POST /content_types
  def create
    @content_type = ContentType.new(content_type_params)
    @content_type.user_id = current_user.id

    if @content_type.save
      redirect_to @content_type, notice: 'Content type was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /content_types/1
  def update
    if @content_type.update(content_type_params)
      redirect_to @content_type, notice: 'Content type was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /content_types/1
  def destroy
    @content_type.destroy
    redirect_to content_types_path, notice: 'Content type was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content_type
      @content_type = ContentType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def content_type_params
      params.require(:content_type).permit(:name, content_fields_attributes: [:id, :field_name, :field_type, :placeholder, :require, :_destroy])
    end
end
