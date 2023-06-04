User.destroy_all
Song.destroy_all

u1 = User.create(firstName: "Kota", lastName: "Ueshima", email: 'Kota@gmail.com', password: 'Redbear10')
# u2 = User.create(username: 'Jason', password: 'Redbear10')

100.times do
    Song.create(title: "More Than My Hometown", artist: "Morgan Wallen", lng: rand(-125..-70) + rand(), lat: rand(30..45) + rand(), user_id: u1.id, image_url: "https://i.scdn.co/image/ab67616d0000b2737d6813fd233f3bc4977cceca", spotify_url: "https://open.spotify.com/embed/track/6FniJZn4agmDtPx1pKZQsa?utm_source=generator")
end

100.times do
    Song.create(title: "Freestyle", artist: "Lil Baby", lng: rand(-118.5..-117.5) + rand(), lat: rand(33.5..34.5) + rand(), user_id: u1.id, image_url: "https://images.genius.com/ec02a06b4e57e742de70eafc2b1ab014.1000x1000x1.png", spotify_url: "https://open.spotify.com/embed/track/5BbdKBZO0TH0GhfxUfyhL9?utm_source=generator")
end

100.times do
    Song.create(title: "Have You Ever Seen The Rain", artist: "Creedence Clearwater Revival", lng: rand(-74.5..-73.5) + rand(), lat: rand(40.2..41.2) + rand(), user_id: u1.id, image_url: "https://i.scdn.co/image/ab67616d0000b27351f311c2fb06ad2789e3ff91", spotify_url: "https://open.spotify.com/embed/track/5DnT9a5IM3eMjKgXTWVJvi?utm_source=generator")
end

puts "Succesfully Seeded"

