class CouponsController < ApplicationController
  before_action :set_coupon, only: [:show, :edit, :update, :destroy]

  # GET /coupons
  def index
    @coupons = Coupon.all
  end

  # GET /coupons/1
  def show
  end

  # GET /coupons/new
  def new
    @coupon = Coupon.new
  end

  # GET /coupons/1/edit
  def edit
  end

  # POST /coupons
  def create
    @coupon = Coupon.new(coupon_params)
    respond_to do |format|
      if !Coupon.exists?(name: @coupon.name)
        if @coupon.save
          format.html { redirect_to new_coupon_path, notice: 'สร้างคูปองสำเร็จ' }
          format.json { render json: { coupon: @coupon , status: true} }
        else
          format.html { render :new }
          format.json { render json: {status: false , message: @coupon.errors.full_messages.join(' and ')}, status: 400 }
        end
      else
        format.html { redirect_to new_coupon_path, flash: { warning: 'มีคูปองแล้ว'} }
        format.json { render json: { status: false, message: 'มีคูปองแล้ว'}, status: 400 }
      end
    end

  end

  # PATCH/PUT /coupons/1
  def update
    if @coupon.update(coupon_params)
      redirect_to @coupon, notice: 'Coupon was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /coupons/1
  def destroy
    @coupon.destroy
    respond_to do |format|
      format.html { redirect_to cooking_run_coupons_path, notice: 'ลบคูปองเรียบร้อย' }
      format.json { render json: { status: true, message: 'ลบคูปองเรียบร้อย'}}
    end
  end

  def claim_coupon
    email = params[:coupon][:email]
    @coupons = Coupon.all
    respond_to do |format|
      if email.present?
        @coupons.each do |coupon|
          HTTParty.post('https://account.devplay.com/v2/coupon/ck', body:  {
            email: email,
            coupon_code: coupon.name
          }.to_json)
        end
        format.html { redirect_to cooking_run_coupons_path, notice: 'รับคูปองเรียบร้อย' }
        format.json { render json: { status: true, message: 'รับคูปองเรียบร้อย' }}
      else
        format.html {  redirect_to cooking_run_coupons_path, :flash => { warning: "โปรดกรอกอีเมล์" } }
        format.json { render json: { status: false, message: 'โปรดกรอกอีเมล์'}, status: 400}
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coupon
      @coupon = Coupon.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def coupon_params
      params.require(:coupon).permit(:name)
    end
end
