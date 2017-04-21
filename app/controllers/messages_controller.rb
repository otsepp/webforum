class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
	@message = Message.new
	if params[:subject_id].nil?
		@subject_id = session[:subject_id]
		@category_id = session[:category_id]
	else
		@subject_id = params[:subject_id]
		session[:subject_id] = @subject_id

		@category_id = params[:category_id]
		session[:category_id] = @category_id
	end
	@subject = Subject.find_by(id: @subject_id)

	if params[:message_replying].nil?
		@message_replying = session[:message_replying]
		
	else
		@message_replying = params[:message_replying]
		session[:message_replying] = params[:message_replying]
	end
	@message_replying = Message.find_by(id: @message_replying)

	if !params[:last_page].nil?
		session[:last_page] = params[:last_page]
	end
  end

  # GET /messages/1/edit
  def edit
	if !params[:page].nil?
		session[:page] = params[:page]
	end
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)
    respond_to do |format|
      if @message.save
	format.html { redirect_to subject_path(@message.subject, :page => @message.subject.calculate_page_count), notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @message }	
      else
	format.html { redirect_to new_message_path, notice:'errors'}
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
	format.html { redirect_to subject_path(@message.subject, :page => session[:page]), notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy	
	subject = @message.subject
	@message.destroy
	respond_to do |format|
	#format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
	format.html { redirect_to subject_path(subject), notice: 'Message was successfully destroyed.' }
	format.json { head :no_content }
	end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:content, :subject_id, :user_id, :category_id, :quote_id)
    end
end
