class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]

  # GET /subjects
  # GET /subjects.json
  def index
    @subjects = Subject.all
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
	@messages = Message.where(:subject_id => @subject.id)

	pages_and_messages = calculate_pages(@messages)
	@pages = pages_and_messages.size

	page = params[:page]	
	if page.nil?
		@messages = pages_and_messages[1]
	else
		@messages = pages_and_messages[page]
	end

	@has_rights = false
	if current_user && current_user.can_edit_and_delete_subject(@subject)
		@has_rights = true
	end
  end

  # GET /subjects/new
  def new
	@subject = Subject.new
	@subject.messages.build
	@category_id = params[:category_id]
	@user_id = params[:user_id]
  end

  # GET /subjects/1/edit
  def edit
	@has_rights = false
	if current_user && current_user.can_edit_and_delete_subject(@subject)
		@has_rights = true
	end
  end

  # POST /subjects
  # POST /subjects.json
  def create
    @subject = Subject.new(subject_params)
    respond_to do |format|
      if @subject.save
        format.html { redirect_to @subject, notice: 'Subject was successfully created.' }
        format.json { render :show, status: :created, location: @subject }
      else
        format.html { render :new }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subjects/1
  # PATCH/PUT /subjects/1.json
  def update
    respond_to do |format|
      if @subject.update(subject_params)
        format.html { redirect_to @subject, notice: 'Subject was successfully updated.' }
        format.json { render :show, status: :ok, location: @subject }
      else
        format.html { render :edit }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
	category = @subject.category
    @subject.destroy
    respond_to do |format|
      format.html { redirect_to category_path(category), notice: 'Subject was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

	def calculate_pages(messages)
		page_length = 5
		pages = @messages.size / page_length
		pages_and_messages = Hash.new 

		start = 0
		for page in 1..pages
			last = start + page_length
			pages_and_messages["#{page}"] = messages[start, last]					
			start = last 
		end
		if @messages.size % page_length != 0
			pages+=1
			pages_and_messages["#{pages}"] = messages[start, messages.size - 1]
		end		
		return pages_and_messages
	end

    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_params
      params.require(:subject).permit(:name, :category_id, :user_id, messages_attributes: [:id, :created_at, :update_at, :subject_id, :content, :user_id, :category_id])
    end
end
