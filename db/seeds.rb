User.destroy_all
Song.destroy_all

u1 = User.create(username: 'KJU', password: '12345')

500.times do
    Song.create(title: "Freestyle", artist: "Lil Baby", lng: rand(-180..180), lat: rand(-90..90), user_id: u1.id, image_url: "https://images.genius.com/ec02a06b4e57e742de70eafc2b1ab014.1000x1000x1.png", spotify_url: "https://open.spotify.com/embed/track/5BbdKBZO0TH0GhfxUfyhL9?utm_source=generator")
end