module Merb
  module HomeHelper
    def show_conversion_message(convert_to)
      conversion_string = if convert_to == 'rpd'
                            "reqs/sec is #{@answer} reqs/day"
                          else
                            "reqs/day is #{@answer} reqs/sec"
                          end
      "#{h params[:requests_per]} #{conversion_string}"
    end
  end
end # Merb