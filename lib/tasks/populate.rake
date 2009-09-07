namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
    10.times do
      user = User.create(
        :login => Faker::Internet.user_name,
        :name => Faker::Name.name,
        :email => Faker::Internet.email,
        :password => 'asdfasdf',
        :password_confirmation => 'asdfasdf'
      )
      user.state = "active"
      user.created_at = Populator.value_in_range(1.years.ago..25.weeks.ago)
      user.save
      ((rand * 9).floor + 1).times do
        project = user.projects.new(
          :title => Populator.words(3..8).titleize,
          :description => Populator.sentences(2..9),
          :created_at => Populator.value_in_range(user.created_at..Time.now),
          :owner_id => user.id
        )
        user.save_object(project)
        user.projects << project
        ((rand * 3).floor + 1).times do
          experiment = project.experiments.new(
            :user_id => user.id,
            :title => Populator.words(3..9).titleize,
            :description => Populator.sentences(2..9),
            :created_at => Populator.value_in_range(project.created_at..Time.now)
          )
          user.save_object(experiment)
          ((rand * 6).floor + 1).times do
            note = experiment.notes.new(
              :body => Populator.sentences(2..9),
              :created_at => Populator.value_in_range(experiment.created_at..Time.now)
            )
            if rand > 0.5
              note.title = Populator.words(3..9)
            end
            user.save_object(note)
          end
        end
      end
    end
  end
end