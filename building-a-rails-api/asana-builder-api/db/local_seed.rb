# remove all existing Asanas from db
User.destroy_all
Asana.destroy_all
Sequence.destroy_all
Posture.destroy_all

# Instantiate Asana objects from web-scraped json data
JSON.parse(File.read("asanas.json")).each do |asana_attrs|
    Asana.create(asana_attrs)
end

user = User.create(username: 'ally', password: 'ally', password_confirmation: 'ally')
user.sequences.build(name: 'test sequence 1').postures << [Posture.create(duration: 15, asana: Asana.first), Posture.create(duration: 10, asana: Asana.second), Posture.create(duration: 20, asana: Asana.third)]