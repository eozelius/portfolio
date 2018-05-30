task :add_dates => :environment do
	Blip.all.each_with_index do |blip, index|
		if blip.date.nil?
			date = Date.new(2016, 1, 1)
			blip.date = date
			blip.save
			p "#{blip.title}: #{blip.date}"
		else
			p "all dates defined"
		end
	end
end
