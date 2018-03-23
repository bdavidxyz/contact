require 'csv' 

module Admin
  class PagesController < Admin::ApplicationController

    def load_csv_get
    end

    def load_csv_post
      a = params.extract!(:csv_text).permit(:csv_text).to_h
      csv_text = a[:csv_text]
      p '- - - - - - - - - - - - - - csv_text- - - - - - - - - - - - - - - -' 
      p csv_text.inspect
      p ''

      csv = CSV.parse(csv_text, :headers => true, col_sep: ';')
      csv.each do |row|
        p '- - - - - - - - - - - - - - row- - - - - - - - - - - - - - - -' 
        p row.to_h.inspect
        p ''

        first_name = row["First Name"]
        last_name = row["Last Name"]
        connected_on = Date.strptime(row["Connected On"].split(', ')[0].insert(-3, '20').gsub("/", "-"), '%m-%d-%Y')
        position = row["Position"]
        email = row["Email Address"]
        company = row["Company"]

        the_lead = Lead.new(
            first_name: first_name,
            last_name: last_name,
            connected_on: connected_on,
            position: position,
            email: email,
            company: company,
        )
      
        p '- - - - - - - - - - - - - - the_lead- - - - - - - - - - - - - - - -' 
        p the_lead.inspect
        p ''
        the_lead.save
      end
 

    end

  end
end
