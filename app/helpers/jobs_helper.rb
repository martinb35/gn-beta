module JobsHelper
  def gn_datetime_select
    days = 8
    index = 1
    html = "<select class='job_when_date' name='job[when]'>"
    date_now = Time.now    
    while index < days

        day = date_now + index.days
        if index == 1
            day_text = "Hoy"
        elsif index == 2
            day_text = "Manana " + day.strftime("%d de %b %Y")
        else   
            day_text = day.strftime("%d de %b %Y")

        end
        
        day_value = day.strftime("%d/%m/%Y")
        html = html + "<option value='#{day_value}' >#{day_text}</option>"
        index=index+1 
    end
    @ouput = html +"<option value='otro'>Otro</option></select>"    
  end
end
