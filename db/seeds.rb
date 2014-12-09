# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# require 'open-uri'
# require 'active_record/fixtures'

Problem.delete_all

aFile = File.new("#{Rails.root}/db/codeforces_problemsetproblems.txt", "r")

S = aFile.read

hash = JSON.parse S
count = 50
hash["result"]["problems"].each do |problem|
  Problem.create!(:title => problem["name"], :content => "Fuck", :ptype => "CF",
  :pid => "#{problem["contestId"]}#{problem["index"]}")
  count -= 1
  if count <= 0 then
  	break
  end
end

aFile.close