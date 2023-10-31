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

end
