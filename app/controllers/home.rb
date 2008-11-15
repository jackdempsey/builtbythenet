class Home < Application

  # ...and remember, everything returned from an action
  # goes to the client...
  def index
    render
  end

  def rps_calc
    redirect '/' if request.get?
    if params[:requests_per]
      @requests_per = params[:requests_per].tr(',','').to_i
      if params[:convert_to] == 'rpd'
        @answer = @requests_per * 86_400 # number of seconds in a day
      else
        if @requests_per >= 86_400
          @answer = @requests_per / 86_400 # number of seconds in a day
        else
          message[:error] = "You need a number greater than 86,400"
        end
      end
    end
    render
  end
end
