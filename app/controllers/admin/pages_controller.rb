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

      k_per = Tag.find_by(name: "k_per")

      csv = CSV.parse(csv_text, :headers => true, col_sep: ';')
      csv.each_with_index do |row, index|
        begin
          first_name = row["First Name"]
          last_name = row["Last Name"]
          connect_date_str = row["Connected On"].split("/").insert(2, "20").join("-").gsub(/(.*)-/, '\1')
          biz = row["First Name"].parameterize + "-" + row["Last Name"].parameterize
          connected_on = Date.strptime(connect_date_str, "%m-%d-%Y, %I:%M %p")
          position = row["Position"]
          email = row["Email Address"]
          company = row["Company"]


          the_lead = Lead.new(
              first_name: first_name,
              last_name: last_name,
              biz: biz,
              connected_on: connected_on,
              position: position,
              email: email,
              company: company,
          )

          the_lead.tags.push(k_per) if row["Tags"] == "o"

          the_lead.save

          # Lead.where(email: email).first_or_create(the_lead.attributes)

        rescue
          p "row #{index} failed"
        end
      end
 

    end

  end
end
