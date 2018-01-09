class CourseOfferingsController < ApplicationController
  before_action :set_course_offering, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with name: "eps", password: (ENV["COURSESPWD"] ? ENV["COURSESPWD"] || 'changeme')
  # GET /course_offerings
  # GET /course_offerings.json
  def index
    set_working_year
    @course_offerings = CourseOffering.joins(:course).where("year_id = ?",@year).order('courses.department_id,sort_order').all
  end

  # GET /course_offerings/1
  # GET /course_offerings/1.json
  def show
  end

  # GET /course_offerings/new
  def new
    @course_offering = CourseOffering.new
  end

  # GET /course_offerings/1/edit
  def edit
    @course_offering = CourseOffering.find(params[:id])
  end

  # POST /course_offerings
  # POST /course_offerings.json
  def create
    @course_offering = CourseOffering.new(course_offering_params)

    respond_to do |format|
      if @course_offering.save
        format.html { redirect_to @course_offering, notice: 'Course offering was successfully created.' }
        format.json { render action: 'show', status: :created, location: @course_offering }
      else
        format.html { render action: 'new' }
        format.json { render json: @course_offering.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course_offerings/1
  # PATCH/PUT /course_offerings/1.json
  def update
    respond_to do |format|
      if @course_offering.update(course_offering_params)
        format.html { redirect_to @course_offering, notice: 'Course offering was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @course_offering.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_offerings/1
  # DELETE /course_offerings/1.json
  def destroy
    @course_offering.destroy
    respond_to do |format|
      format.html { redirect_to course_offerings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_offering
      @course_offering = CourseOffering.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_offering_params
      params[:course_offering].permit(:description,:info,:gradelevels,:sort_order)
    end
end
