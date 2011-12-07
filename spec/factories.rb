# require fields are *

FactoryGirl.definde do
  factory :invoice do
    id 1
    tdate "#{future(0)}"    # * invoice date
    edate "#{future(30)}"   # * expiration date
    ddate "#{future(30)}"   # delivery date
    ourref "Jonas Arnklint"
    yourref "Kevin Sjöberg"
    roundoff 1
    freight 200
    totalvat 419
    total 2095
  end
end
