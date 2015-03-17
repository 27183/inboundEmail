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

    Post.create!({
                     to: @email.to,
                     from: @email.from,
                     cc: @email.cc,
                     subject: @email.subject,
                     body: @email.body,
                     raw_text: @email.raw_text,
                     raw_html: @email.raw_html,
                     raw_body: @email.raw_body,
                     attachments: @email.attachments,
                     headers: @email.headers,
                     raw_headers: @email.raw_headers
                 })
  end
end 
