class JobMailer < ActionMailer::Base
  default from: "no-reply@goninis.com"
  
  def notify_assigned(job, user_id)
    @job = job
    @user_id = user_id
    @user = User.find_by_id(@user_id)
    @last_index = @job.contact.to_s.index('@')
    @cat_name = JobCategory.find_by_id (@job.job_category_id)
    @cat_name = @cat_name.title
    @url  = "http://pre.goninis.com/jobs?id=#{@job.id}&status=3&revision=#{@user_id}"
    mail(to: @job.contact, subject: 'goninis - Permiso para realizar tarea')
  end
  def notify_accepted(user, job)
    @job = job
    @user = user
    @cat_name = JobCategory.find_by_id (@job.job_category_id)
    @cat_name = @cat_name.title
    @url  = "http://pre.goninis.com/jobs?id=#{@job.id}&status=4&revision=#{@user.id}"
    mail(to: @user.email, subject: 'goninis - Felicidades, te han asignado una tarea')
  end
  def notify_rejected(user, job)
    @job = job
    @user = user
    @last_index = @job.contact.to_s.index('@')
    @cat_name = JobCategory.find_by_id (@job.job_category_id)
    @cat_name = @cat_name.title
    @url  = "http://pre.goninis.com/jobs?id=#{@job.id}&status=3&revision=#{@user.id}"
    mail(to: @job.contact, subject: 'goninis - Permiso para realizar tarea')
  end
end
