class CalcController < ApplicationController
  def show
    @history = Calculator.read('tmp/history')
  end

  def compute
    c = Calculator.new params[:problem]
    Calculator.write(c, 'tmp/history')
    redirect_to calc_path
  end

  def delete
    Calculator.delete('tmp/history')
    redirect_to calc_path
  end
end
