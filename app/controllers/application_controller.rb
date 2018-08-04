require './config/environment'
#require './app/models/quizz.rb'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
end

get '/' do
  erb :index
end

post '/results' do
  answers = []
  answers << params.values
  
  @total = 0 #at the beginning of the quiz
  
  answers.each do |x| #goes to the array of values
    num = 0
    while num < 4
      new_count = x[num].to_i
      @total += new_count #adds up numbers that user chose -- also convert to integer bc we're taking in numbers
      num += 1 
    end
  end
  puts "here is the total: #{@total}"

   @combo = cool_generator(@total)
   if @combo == "You're an FBI agent!"
     erb :success
   elsif @combo == "You're fired from the FBI team"
     erb :failure
   end
 end
end