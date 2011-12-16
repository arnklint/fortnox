FactoryGirl.define do
	factory :invoice do
		tdate			future(0)
		ddate			future(30)
		edate			future(30)
		ourref		'Kevin Sjöberg'
		yourref		'Jonas Arnklint'
		roundoff	1
		freight		0
		totalvat	419
		total			2095
	end
end