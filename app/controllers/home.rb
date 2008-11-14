class Home < Application

  # ...and remember, everything returned from an action
  # goes to the client...
  def index
    render
  end

  def rps_calc
    redirect '/' if request.get?
    if params[:rpd]
      @rpd = params[:rpd].tr(',','').to_i
      if @rpd >= 86_400
        @rps = @rpd / 86_400 # number of seconds in a day
      else
        message[:error] = "You need a number greater than 86,400"
      end
    end
    render
  end
end
