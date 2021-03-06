def import_insurance(data)
	data.each do |line|
		title, valid_from, valid_to, baggage_cents,
		cancellation_cents, currency = line.split(",")
		Insurance.create(
			:title => title,
			:valid_form => valid_from,
			:valid_to => valid_to,
			:baggage_cents => baggage_cents,
			:cancellation_cents => cancellation_cents,
			:currency => currency)
		end
end

namespace :import do
	desc "Import new insurrances from csv-file"
		task :insurance => :environment do
			if ENV['FILE'] && File.exist?(ENV['FILE'])
				csv_file = ENV['FILE']
				data = File.open(csv_file).map |line| line.chop
				puts "Number of data to import: #data.size"
				import_insurance(data)
			else
				puts "Set FILE to the csv-files"
			end
		end
		
end
