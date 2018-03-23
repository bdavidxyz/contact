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

      csv = CSV.parse(csv_text, :headers => true)
      csv.each do |row|
        p '- - - - - - - - - - - - - - row- - - - - - - - - - - - - - - -' 
        p row.inspect
        p ''
      end


    end

  end
end
