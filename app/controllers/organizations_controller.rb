class OrganizationsController < ApplicationController
  before_action :set_org, only: %i[edit update destroy]

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(org_params)

    respond_to do |format|
      if @organization.save
        format.html { redirect_to dashboard_path }
        format.turbo_stream {
          flash.now[notice] = "Organization created successfully!"
        }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @organization.update(org_params)
        format.html { redirect_to dashboard_path, notice: "Organization update successfully!" }
        format.turbo_stream {
          flash.now[notice] = "Organization updated successfully!"
        }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @organization.destroy
        format.html { redirect_to dashboard_path, notice: "successfully destroy!" }
        format.turbo_stream {
          flash.now[:notice] = "organization destroyed successfully!"
        }
      end
    end
  end

  private

  def set_org
    @organization = Organization.find(params[:id])
  end

  def org_params
    params.require(:organization).permit(:name, :logo)
  end
end
