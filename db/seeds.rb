# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Track.delete_all

u1 = User.create!(email: 'test1@test.com', password: 'password', password_confirmation: 'password')
u2 = User.create!(email: 'test2@test.com', password: 'password', password_confirmation: 'password')
u3 = User.create!(email: 'test3@test.com', password: 'password', password_confirmation: 'password')
u4 = User.create!(email: 'tolu@underground.com', password: 'password', password_confirmation: 'password`')

t1 = Track.create(name: 'track1', user_id: u1.id, description: 'first song')
t1.song = 'song_1.mp3'
t1.save

t2 = Track.create(name: 'track2', user_id: u1.id, description: 'Secong song', song: 'song_2.mp3' )
t3 = Track.create(name: 'track3', user_id: u1.id, description: 'Third song', song: 'song_3.mp3' )
