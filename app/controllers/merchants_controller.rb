# frozen_string_literal: true

class MerchantsController < ApplicationController
  before_action :set_merchant, only: %i[edit show update destroy]

  def index
    @merchants = policy_scope(Merchant)
  end

  def show
    authorize @merchant
  end

  def edit
    authorize @merchant
  end

  def update
    authorize @merchant
    if @merchant.update(merchant_params)
      redirect_to merchant_path(@merchant), flash: { notice: 'Successfully updated' }
    else
      render :edit
    end
  end

  def destroy
    @merchant.destroy
    redirect_to merchants_path, flash: { notice: 'Successfully deleted' }
  end

  private

  def merchant_params
    params.require(:merchant).permit(:name, :description, :total_transaction_sum, :status)
  end

  def set_merchant
    @merchant = Merchant.find_by(id: params[:id])
  end
end
