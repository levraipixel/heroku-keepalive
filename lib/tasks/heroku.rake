namespace :heroku do
  task :keepalive => :environment do
    
    class CustomLogger < Logger
      def error(e)
        ExceptionNotifier::Notifier.background_exception_notification(e)
        super
      end
    end
    Clockwork.config[:logger] = CustomLogger.new(STDOUT)
    
    # Send Keepalive requests
    Clockwork.every(10.minutes, "keepalive.request") {
      ENV['KEEPALIVE_URL'].split(',').each do |url|
        puts "Keepalive #{url}"
        resp = HTTParty.get(url)
        puts resp
      end
    }
    Clockwork.run
  end
end
