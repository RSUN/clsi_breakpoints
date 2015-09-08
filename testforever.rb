puts "Watch log in new window with: tail -f log/test.log"
while true
    puts "running tests again..."
     `rake test:models`
    puts "Sleeping for 2 minutes so you can review log"
    sleep(120) 
end
