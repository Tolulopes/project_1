class ProducersController < ApplicationController

    before_action :authenticate_user!
    # http_basic_authenticate_with name: "abc", password: "secret", except: [:index, :show]
    authorize_resource


  def index
    @producers = Producer.all
  end

  def show
    @producer = Producer.find(params[:id])
    redirect_to @producer_path
  end

  def new
    @producer = Producer.new
    redirect_to @producer_path
  end

  def edit
    @producer = Producer.find(params[:id])
  end

  def create
    @producer = Producer.new(producer_params)

    if @producer.save
      redirect_to @producer
    else
      render 'new'
    end
  end

  def update
    @producer = Producer.find(params[:id])

    if @producer.update(producer_params)
      redirect_to @producer
    else
      render 'edit'
    end
  end

  def destroy
    @producer = Producer.find(params[:id])
    @producer.destroy

    redirect_to producers_path
  end

  private
    def producer_params
      params.require(:producer).permit(:name, :text)
    end
end
