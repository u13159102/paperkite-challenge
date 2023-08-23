class VendorsController < ApplicationController
  def show
    @vendor = Vendor.where(outlet: params[:outlet], plate: params[:plateNumber]).first
    raise 'Vending machine not found' if @vendor.nil?

    @location = @vendor.locations.where(address: params[:location]).first

    respond_to do |format|
      format.json { render 'api_show' }
      format.html { render 'show' }
    end
  end

  def promos
    @vendor = Vendor.where(outlet: params[:outlet], plate: params[:plateNumber]).first
    raise 'Vending machine not found' if @vendor.nil?

    respond_to do |format|
      format.json { render 'api_promos' }
      format.html { render 'show_promos' }
    end
  end

  def show_promo
    @vendor = Vendor.where(outlet: params[:outlet], plate: params[:plateNumber]).first
    raise 'Vending machine not found' if @vendor.nil?

    @promo = @vendor&.promotions&.find_by_promotion_id(params[:promo_id])
    raise 'Promotion not found' if @promo.nil?

    respond_to do |format|
      format.json { render 'api_show_promo' }
      format.html { render 'promo' }
    end
  end
end