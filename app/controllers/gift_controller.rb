class GiftController < ApplicationController
  before_action :confirm_logged_in

  def index
    @gifts = Gift.order("name ASC")
    @person = Person.all
  end


  def show
    @gift = Gift.find(params[:id])
    @person = Person.all
  end

  def new
    @gift = Gift.new
    @people = Person.order("name ASC")
  end

  def create
    @gift = Gift.create(gift_params)
    @person = Person.all

    if @gift.save
      flash[:notice] = "#{@gift.name} was created."
      redirect_to(:action => "index")
    else
      @person = Person.all
      render("new")
    end
  end

  def edit
    @gift = Gift.find(params[:id])
  end

  def editall
    @gift = Gift.find(params[:id])
  end

  def update
    @gift = Gift.find(params[:id])

    if @gift.update_attributes(gift_params)
      flash[:notice] = "#{@gift.name} was updated."
      redirect_to(:controller => 'gift', :action => 'index')
    else
      render('edit')
    end
  end

  def delete
    @gift = Gift.find(params[:id])
  end

  def destroy
    gift = Gift.find(params[:id]).destroy
    flash[:notice] = "#{gift.name} was deleted."
    redirect_to(:action => 'index')
  end

  private
    def gift_params
      params.require(:gift).permit(:name, :url, :purchased, :person_id, :comments)
    end
end
