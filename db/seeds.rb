User.destroy_all
Song.destroy_all

users = []
50.times do
    firstName = Faker::Name.first_name
    lastName = Faker::Name.last_name
    user = User.create(firstName: firstName, lastName: lastName, email: "#{firstName}@gmail.com", password: "#{firstName}12345")
    users << user
end

# Gets my ancient bangers playlist
playlist = RSpotify::Playlist.find('rachiko38','5FarOdSNewgMP4kYECLout')

for track in playlist.tracks
    title = track.name
    artist = track.artists[0].name
    lat = Faker::Address.latitude
    lng = Faker::Address.longitude
    image_url = track.album.images[0]["url"]
    spotify_url = track.preview_url
    user_id = users[rand(50).round].id
    song = Song.create(title: title, artist: artist, lat: lat, lng: lng, image_url: image_url, spotify_url: spotify_url, user_id: user_id)
end

puts "Succesfully Seeded"

