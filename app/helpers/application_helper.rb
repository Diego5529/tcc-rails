module ApplicationHelper
  def send_simple_message
    RestClient.post "https://api:key-2014d117b08f2315e8814583c821acf4@api.mailgun.net/v3/sandboxaa9dc6eed5d5483597d6429060deb429.mailgun.org/messages",
    :from => "Mailgun Sandbox <postmaster@sandboxaa9dc6eed5d5483597d6429060deb429.mailgun.org>",
    :to => "Diego <diego.6.souza@gmail.com>",
    :subject => "Hello Diego",
    :text => "Congratulations Diego, you just sent an email with Mailgun!  You are truly awesome! TESTE You can see a record of this email in your logs: https://mailgun.com/cp/log .  You can send up to 300 emails/day from this sandbox server.  Next, you should add your own domain so you can send 10,000 emails/month for free."
  end

  def bootstrap_class_for(flash_type)
    case flash_type
      when :success
       'alert-success'
      when :error
        'alert-error'
      when :alert
        'alert-block'
      when :notice
        'alert-info'
      else
        flash_type.to_s
    end
  end

  def active?(controller_name)
    servlet = params[:controller]
    puts controller_name, '@@@@', params
    if servlet == controller_name
      'active'
    else
      ''
    end
  end
end