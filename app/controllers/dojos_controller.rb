class DojosController < ApplicationController
  def index
  	@dojos = Dojo.all
  	@count = Dojo.count	
  end
  def new
  end
  def create
  	@dojo = Dojo.create(branch: params[:branch], street: params[:street], city: params[:city],
  		states: params[:states])
    if @dojo.valid?
      redirect_to '/dojos' 
    else
      flash[:error] = @dojo.errors
      redirect_to '/dojos'
    end
  end
  def show
  	@dojo = Dojo.find(params[:id])
    @students = Dojo.find(params[:id]).students
  end
  def edit
  	@dojo = Dojo.find(params[:id])
  end
  def update
  	dojo = Dojo.find(params[:id])
  	dojo.branch = params[:branch]
  	dojo.street = params[:street]
  	dojo.city = params[:city]
  	dojo.states = params[:states]
  	dojo.save
  	redirect_to ('/dojos')
  end
  def destroy
	dojo = Dojo.find(params[:id])
	dojo.destroy
	redirect_to '/dojos'
  end
end
