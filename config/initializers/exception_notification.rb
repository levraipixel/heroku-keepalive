HerokuKeepalive::Application.config.middleware.use ExceptionNotifier,
  :email_prefix =>          "[Exception Notification] ",
  :sender_address =>        '"exception-notifier" <'+ENV["GMAIL_USERNAME"]+'>',
  :exception_recipients =>  ENV["EXC_RECIPIENTS"]
