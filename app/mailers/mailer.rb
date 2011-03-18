class Mailer < ActionMailer::Base
  default :from => "ideas@ncm.org"
  
  def comment_email(person,comment)
    @person  = person
    @comment = comment
    mail(:to => person.email,
         :subject => "[ideas] Comment: #{comment.idea.name}")
  end
end
