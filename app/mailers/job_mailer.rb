class JobMailer < ActionMailer::Base
  default from: "no-reply@goninis.com"
  
  def notify_assigned(job)
    @job = job
    @last_index = @job.contact.to_s.index('@')
    @url  = "http://goninis.com/jobs?id=#{@job.id}&status=3&email=#{@job.contact}"
    mail(to: @job.contact, subject: 'goninis - Permiso para realizar tarea')
  end
end
