class NumbersController < ApplicationController
   before_action :authenticate_user!
  def new
    @number = Number.new
    @board  = Board.new
    session[:board] = @board
  end

  def create
    @board = Board.from(session[:board])
    @number = Number.new(number_param)
    if @number.save
      #could be save! -- if we want to have exaption
      render 'show'
    else
      render plain: "Sorry, please read rules again"
    end
  end

  def show
    @number = Number.find(params[:id])
  end

  private

  def number_param
    params.require(:number).permit(:numb)
  end
end
