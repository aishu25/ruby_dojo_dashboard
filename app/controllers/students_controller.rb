class StudentsController < ApplicationController
  def new
    @dojos = Dojo.all
    @dojo = Dojo.find(params[:dojo_id])
  end
  def show
    @dojo = Dojo.find(params[:dojo_id])
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
    @dojo = Dojo.find(params[:dojo_id])
    @dojos = Dojo.all
  end


  def update
    @student = Student.find(params[:id])
    @student.first_name = params[:first_name]
    @student.last_name = params[:last_name]
    @student.email = params[:email]   
    @student.dojo_id = params[:dojo_locations]
    @student.save
    redirect_to '/dojos/' + @student.dojo_id.to_s + '/students/' + @student.id.to_s
  end

  def destroy
    student = Student.find(params[:id])
    student.destroy
    redirect_to '/dojos/' + student.dojo_id.to_s
  end

  def create
    @dojo = Dojo.find(params[:dojo_id])
    @student = Student.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], dojo_id: params[:dojo_locations])
    if @student.valid?
      redirect_to '/dojos/' + params[:dojo_locations].to_s
    else
      flash[:error] = @student.errors
      redirect_to '/dojos/' + @student.dojo_id.to_s
    end
  end
end
