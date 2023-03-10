class OrganizationsController < ApplicationController
  before_action :set_organization, only: %i[ show edit update destroy create_projects create_projects_background]
  before_action :authenticate_user!, only: %i[index]

  # GET /organizations or /organizations.json
  def index
    @organizations = current_user.organizations.all
  end

  # GET /organizations/1 or /organizations/1.json
  def show
  end

  # GET /organizations/new
  def new
    @organization = Organization.new
  end

  # GET /organizations/1/edit
  def edit
  end

  # POST /organizations or /organizations.json
  def create
    @organization = OrganizationService.create_organization(organization_params, current_user)

    respond_to do |format|
      if current_user.save
        format.html { redirect_to organization_url(@organization), notice: "Organization was successfully created." }
        format.json { render :show, status: :created, location: @organization }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organizations/1 or /organizations/1.json
  def update
    respond_to do |format|
      if @organization.update(organization_params)
        format.html { redirect_to organization_url(@organization), notice: "Organization was successfully updated." }
        format.json { render :show, status: :ok, location: @organization }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizations/1 or /organizations/1.json
  def destroy
    @organization.destroy

    respond_to do |format|
      format.html { redirect_to organizations_url, notice: "Organization was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  def create_projects
    @projects = ProjectService.create_from_organization(@organization)

    respond_to do |format|
      if @organization.save
        format.html { redirect_to organization_projects_path(@organization), notice: "Project was successfully created." }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_projects_background
    CreateProjectsJob.perform_later(@organization)
    redirect_to organization_projects_path(@organization), notice: "Projects were set to backgroundjob"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = OrganizationService.find(params[:id], current_user)
    end

    # Only allow a list of trusted parameters through.
    def organization_params
      params.require(:organization).permit(:name, :url, :app_type, :access_token, :access_user)
    end

    def app_types
      OrganizationService.app_type
    end
    helper_method :app_types
end
