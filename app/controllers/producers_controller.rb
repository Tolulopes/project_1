class ProducersController < ApplicationController
    load_and_authorize_resource

    before_action :authenticate_user!, only:[:new, :create, :edit, :update, :destroy]
    # http_basic_authenticate_with name: "abc", password: "secret", except: [:index, :show]

  def index
    @producers = Producer.all
    authorize! :index, @producers
  end

  def show
    @producer = Producer.find(params[:id])
    authorize! :read, @producer
  end

  def new
    @producer = Producer.new
    authorize! :create, @producer
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
