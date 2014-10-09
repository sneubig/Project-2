namespace :test do
  desc "This is a test"
  task test1: :environment do
    logger           = Logger.new(STDOUT)
    logger.level     = Logger::INFO
    Rails.logger     = logger
    logger.info "This is my most recent test!!"
  end

end
