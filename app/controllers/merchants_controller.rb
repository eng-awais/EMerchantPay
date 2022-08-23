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
    if @merchant.update(merchant_params)
      redirect_to merchant_path(@merchant), flash: { notice: 'Successfully updated' }
    else
      redirect_to edit_merchant_path(@merchant), flash: { error: @merchant.errors.full_messages.first }
    end
  end

  def destroy
    authorize @merchant
    if @merchant.destroy
      redirect_to merchants_path, flash: { notice: 'Successfully deleted' }
    else
      redirect_to merchants_path, flash: { error: @merchant.errors.full_messages.first }
    end
  end

  private

  def merchant_params
    params.require(:merchant).permit(:name, :description, :total_transaction_sum, :status)
  end

  def set_merchant
    @merchant = Merchant.find_by(id: params[:id])
  end
end
