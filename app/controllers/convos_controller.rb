class ConvosController < ApplicationController
  before_action :set_convo, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:new, :create]
  before_action :require_admin, only: [:destroy]

  # GET /convos
  # GET /convos.json
  def index
    @convos = Convo.all.order(created_at: :desc)
  end

  # GET /convos/1
  # GET /convos/1.json
  def show
  end

  # GET /convos/new
  def new
    @convo = Convo.new
    @convo.user = current_user
  end

  # GET /convos/1/edit
  def edit
  end

  # POST /convos
  # POST /convos.json
  def create
    @convo = Convo.new(convo_params)
    @convo.user = current_user

    respond_to do |format|
      if @convo.save
        format.html { redirect_to @convo, notice: 'Convo was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /convos/1
  # PATCH/PUT /convos/1.json
  def update
    respond_to do |format|
      if @convo.update(convo_params)
        format.html { redirect_to @convo, notice: 'Convo was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /convos/1
  # DELETE /convos/1.json
  def destroy
    @convo.destroy
    respond_to do |format|
      format.html { redirect_to convos_url, notice: 'Convo was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_convo
      @convo = Convo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def convo_params
      params.require(:convo).permit(:user_id, :topic_id, :title, :body)
    end
end
