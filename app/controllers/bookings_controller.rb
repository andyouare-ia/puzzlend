class BookingsController < ApplicationController
  before_action :set_puzzle, only: [:new, :create]
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.puzzle = @puzzle
    if @booking.save
      redirect_to puzzles_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:puzzle_id, :start_date, :end_date)
  end

  def set_puzzle
    @puzzle = Puzzle.find(params[:puzzle_id])
  end
end
