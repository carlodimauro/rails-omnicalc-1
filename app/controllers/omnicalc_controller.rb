class OmnicalcController < ApplicationController

  def square

    render({:template => "/squarenew"})

  end  

  def squareroot

    render({:template => "/squareroot"})

  end  
  

  def payment

    render({:template => "/payment"})

  end  
  
  def random

    render({:template => "/random"})

  end  

  def compute
    @function = params.fetch(:function)

    if @function == "square"
      @number = params.fetch(:number).to_f
      @result = @number ** 2
      render({:template => "/sqresult"})
    elsif @function == "square_root"
      @number = params.fetch(:number).to_f
      @result = @number ** 0.5
      render({:template => "/rootresult"})
    elsif @function == "payment"
      @apr = params.fetch(:user_apr).to_f
      @yrs = params.fetch(:user_years).to_f
      @pv = params.fetch(:user_pv).to_f  
      @result = ((@apr/1200) * @pv) / (1 - ((1 + (@apr/1200))**(@yrs* -12.0)))
      # formatt for output
      @result = @result.to_fs(:currency)
      @pv = @pv.to_fs(:currency)
      @apr = sprintf("%.4f%%",@apr)
      
      render({:template => "/paymentresult"})
    
    elsif @function == "random"
      @min = params.fetch(:user_min).to_f
      @max = params.fetch(:user_max).to_f
      @result = rand(@min..@max)
      render({:template => "/randresult"})
    
    end

  end
end
