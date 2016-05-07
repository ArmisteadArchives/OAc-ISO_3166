class Wiki::CountriesController < ApplicationController
  before_action :set_wiki_country, only: [:show, :edit, :update, :destroy]

  # GET /wiki/countries
  # GET /wiki/countries.json
  def index
    @wiki_countries = Wiki::Country.all
  end

  # GET /wiki/countries/1
  # GET /wiki/countries/1.json
  def show
  end

  # GET /wiki/countries/new
  def new
    @wiki_country = Wiki::Country.new
  end

  # GET /wiki/countries/1/edit
  def edit
  end

  # POST /wiki/countries
  # POST /wiki/countries.json
  def create
    @wiki_country = Wiki::Country.new(wiki_country_params)

    respond_to do |format|
      if @wiki_country.save
        format.html { redirect_to @wiki_country, notice: 'Country was successfully created.' }
        format.json { render :show, status: :created, location: @wiki_country }
      else
        format.html { render :new }
        format.json { render json: @wiki_country.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wiki/countries/1
  # PATCH/PUT /wiki/countries/1.json
  def update
    respond_to do |format|
      if @wiki_country.update(wiki_country_params)
        format.html { redirect_to @wiki_country, notice: 'Country was successfully updated.' }
        format.json { render :show, status: :ok, location: @wiki_country }
      else
        format.html { render :edit }
        format.json { render json: @wiki_country.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wiki/countries/1
  # DELETE /wiki/countries/1.json
  def destroy
    @wiki_country.destroy
    respond_to do |format|
      format.html { redirect_to wiki_countries_url, notice: 'Country was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wiki_country
      @wiki_country = Wiki::Country.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wiki_country_params
      params.require(:wiki_country).permit(:alpha_2, :alpha_3, :numeric, :iso_name, :year_added, :domain)
    end
end
