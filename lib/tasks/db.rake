# frozen_string_literal: true
namespace :db do
  namespace :seed do
    desc 'Seed single file from `db/` with given filename'
    task :single, [:filename] => :environment do |_task, args|
      if Rails.env.production?
        puts 'You are in production environment'
        puts 'Are you sure that you want to run seeds? [y/n]'

        abort unless STDIN.gets.strip.casecmp('y').zero?
      end

      filename = File.basename(args[:filename], '.rb') + '.rb'
      filename = Rails.root.join('db', filename)

      if File.exist?(filename)
        load(filename)
        puts "file #{filename} was seeded"
      else
        abort "file #{filename} does not exists"
      end
    end
  end
end
