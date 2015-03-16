class EmailProcessor

   def initialize(email)
    @email = email
  end

  def process
    # Post.create!({ body: email.body, email: email.from })
    @headers = @email.headers || []
    puts "Email from #{@email.from[:token]}"
    puts "Routing to account #{@email.to.first[:host].split('.').first}"
    puts "Command is #{@email.to.first[:token]}"
    puts "Subject is #{@email.subject}"
    puts "Headers:"
    @headers.each do |headerName, value|
      puts "  <#{headerName}> = #{value} "
    end

    Post.create!({ body: @email.body, email: @email.from, serial_email: @email.headers })
  end
end 
