class TracksController < ApplicationController

  
  authorize_resource

  def index
    @tracks = Track.all
  end

  
  def show
    @track = Track.find(params[:id])
    @comment = Comment.new
  end

  
  def new
    @track = Track.new
  end

 
  def edit
    @track = Track.find(params[:id])
  end

  
  def create
    @track = Track.new(track_params)

    respond_to do |format|
      if @track.save
        format.html { redirect_to @track, notice: 'Track was successfully created.' }
        format.json { render :show, status: :created, location: @track }
      else
        format.html { render :new }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    @track = Track.new(track_params)

    respond_to do |format|
      if @track.update(track_params)
        format.html { redirect_to @track, notice: 'Track was successfully updated.' }
        format.json { render :show, status: :ok, location: @track }
      else
        format.html { render :edit }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def destroy
    @track.destroy
    respond_to do |format|
      format.html { redirect_to tracks_url, notice: 'Track was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def track_params
      params.require(:track).permit(:name, :user_id, :description, :song)
    end
end
