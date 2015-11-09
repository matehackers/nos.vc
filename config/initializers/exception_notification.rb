require 'exception_notification/rails'

ExceptionNotification.configure do |config|
  # Ignore additional exception types.
  # ActiveRecord::RecordNotFound, AbstractController::ActionNotFound and ActionController::RoutingError are already added.
  # config.ignored_exceptions += %w{ActionView::TemplateError CustomError}

  # Adds a condition to decide when an exception must be ignored or not.
  # The ignore_if method can be invoked multiple times to add extra conditions.
  config.ignore_if do |exception, options|
    not Rails.env.production?
  end

  # Email notifier sends notifications by email.
  config.add_notifier :email, {
   :email_prefix     => "[vila-encontros] ",
   :sender_address    => ["Vila Encontros  <noreply@encontros.vilaflores.org>"],
   :exception_recipients => [ENV['EXCEPTION_RECIPIENT']]
  }

end
