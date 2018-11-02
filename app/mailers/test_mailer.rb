
class TestMailer < ActionMailer::Base
  default :from => '314658@gmail.com'

  include AbstractController::Callbacks

  def do_send
    mail( :to => 'piousbox@gmail.com', :subject => "Creek - SMT - Estimate Denied" )
  end

end

