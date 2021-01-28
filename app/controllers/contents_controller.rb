class ContentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_content, only: [:show, :edit, :update, :destroy]
  before_action :set_content_type, only: [:new, :destroy]
  # GET /contents
  def index
    @contents = Content.all
  end

  # GET /contents/1
  def show
  end

  # GET /contents/new
  def new
    @url_path = content_type_contents_path(@content_type)
    @method = :post
    @content = Content.new(content_type_id: params[:content_type_id])
  end

  # GET /contents/1/edit
  def edit
    @url_path = content_type_content_path(@content.content_type, @content)
    @method = :put
  end

  # POST /contents
  def create
    @content = Content.new(content_params)

    if @content.save
      redirect_to content_type_content_path(@content.content_type, @content), notice: 'Content was successfully created.'
    else
      render :new, locals: { "@url_path": content_type_contents_path(params[:content_type_id])}
    end
  end

  # PATCH/PUT /contents/1
  def update
    if @content.update(content_params)
      redirect_to content_type_content_path(@content.content_type, @content), notice: 'Content was successfully updated.'
    else
      render :edit, locals: { "@url_path": content_type_contents_path(params[:content_type_id])}
    end
  end

  # DELETE /contents/1
  def destroy
    @content.destroy
    redirect_to content_type_path(@content_type), notice: 'Content was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content
      @content = Content.find(params[:id])
    end

    def set_content_type
      @content_type = ContentType.find(params[:content_type_id])
    end

    # Only allow a trusted parameter "white list" through.
    def content_params
      properties_params = (params[:content] || {})[:properties].keys
      params.require(:content).permit(:content_type_id, properties: properties_params)
    end
end
