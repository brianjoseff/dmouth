namespace :db do
  desc "erase and fill database"
  task :populate => :environment do
    require 'faker'
    require 'forgery'
    
    [Chef, Article, Quote, Admin].each(&:delete_all)
    User.create!(:email => "admin@mouth.com",
                 :password => "000000")
    
    #article
    10.times do |n|
      title = Forgery(:LoremIpsum).word(:random => true)
      blurb = Forgery(:LoremIpsum).paragraph(:random => true)
      author = Faker::Name.name
      content = Forgery(:LoremIpsum).paragraph(:random => true)
      Article.create!(:title => title,
                   :blurb => blurb,
                   :author => author,
                   :content => content)
    end
    
    #chef
    4.times do |y|
      name = Faker::Name.name
      title = Forgery(:LoremIpsum).word(:random => true)
      Chef.create!(:name => name,
                    :title => title)
    end
    
    #quote
    5.times do |y|
      quote = Forgery(:LoremIpsum).sentence(:random => true)
      source = Faker::Name.name
      Quote.create!(:source => source,
                    :quote => quote)
    end
    
    
  end
end 
    
