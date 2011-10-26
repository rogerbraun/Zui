require "nokogiri"
require "open-uri"
require "pry"
namespace :db do

  task :import_tsurezure => :environment do
    doc = Nokogiri::HTML(open("http://etext.virginia.edu/japanese/tsure/YosTsur.html"), nil, "EUC-JP")

    res = doc.css("td")

    out = []
    temp = nil
    res.each do |r|
      r.children.each do |child|
        if child.name == "center"
          out << temp
          temp = []
          temp << child.text
        end
        temp << child.text if child.name == "p"
      end
    end 
    out.compact!
    out.map!{|o|[o.first, o[1..-1].join("\n\n")]}
    project = Project.find(1)
    project.fragments.destroy_all
    out.each do |title, text|
      f = project.fragments.build
      f.title = title
      f.content = text
      f.save

    end
  end
end
