class Wiki::CountrySubdivisionsController < ApplicationController
  before_action :set_wiki_country_subdivision, only: [:show, :edit, :update, :destroy]

  # GET /wiki/country_subdivisions
  # GET /wiki/country_subdivisions.json
  def index
    @wiki_country_subdivisions = Wiki::CountrySubdivision.all
  end

  # GET /wiki/country_subdivisions/1
  # GET /wiki/country_subdivisions/1.json
  def show
  end

  # GET /wiki/country_subdivisions/new
  def new
    @wiki_country_subdivision = Wiki::CountrySubdivision.new
  end

  # GET /wiki/country_subdivisions/1/edit
  def edit
  end

  # POST /wiki/country_subdivisions
  # POST /wiki/country_subdivisions.json
  def create
    @wiki_country_subdivision = Wiki::CountrySubdivision.new(wiki_country_subdivision_params)

    respond_to do |format|
      if @wiki_country_subdivision.save
        format.html { redirect_to @wiki_country_subdivision, notice: 'Country subdivision was successfully created.' }
        format.json { render :show, status: :created, location: @wiki_country_subdivision }
      else
        format.html { render :new }
        format.json { render json: @wiki_country_subdivision.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wiki/country_subdivisions/1
  # PATCH/PUT /wiki/country_subdivisions/1.json
  def update
    respond_to do |format|
      if @wiki_country_subdivision.update(wiki_country_subdivision_params)
        format.html { redirect_to @wiki_country_subdivision, notice: 'Country subdivision was successfully updated.' }
        format.json { render :show, status: :ok, location: @wiki_country_subdivision }
      else
        format.html { render :edit }
        format.json { render json: @wiki_country_subdivision.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wiki/country_subdivisions/1
  # DELETE /wiki/country_subdivisions/1.json
  def destroy
    @wiki_country_subdivision.destroy
    respond_to do |format|
      format.html { redirect_to wiki_country_subdivisions_url, notice: 'Country subdivision was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wiki_country_subdivision
      @wiki_country_subdivision = Wiki::CountrySubdivision.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wiki_country_subdivision_params
      params.require(:wiki_country_subdivision).permit(:country_id, :alpha, :native_name, :iso_name)
    end
end
