require_relative '../../config/environment'

namespace :db do

    desc 'scrape data from web and save to local json file'
    task :scrape do
        AsanaScraper.new.scrape_asanas
        puts 'Scraping done, local json file rewritten.'
    end

    namespace :seed do

        desc 'seed db from local json file'
        task :local do
            require_relative '../../db/local_seed'
            puts 'Seeding done.'
        end

    end
end