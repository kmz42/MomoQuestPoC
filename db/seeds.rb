# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


w = Adventure.find_or_create_by!(name: "Wolfgang's Lair")
Enemy.find_or_create_by!(name: "Stinky Dog", hp: 10, power: 4, xp_on_defeat: 3, gold_on_defeat: 1)
Enemy.find_or_create_by!(name: "Smelly Dog", hp: 20, power: 2, xp_on_defeat: 3, gold_on_defeat: 1)
Enemy.find_or_create_by!(name: "Noisy Dog", hp: 40, power: 1, xp_on_defeat: 3, gold_on_defeat: 1)
Enemy.find_or_create_by!(name: "Stinky Smelly Noisy Dog", hp: 50, power: 5, xp_on_defeat: 50, gold_on_defeat: 30)

std = Event.find_or_create_by!(kind: 'EnemyEvent', enemy: Enemy.find_by(name: "Stinky Dog"))
smd = Event.find_or_create_by!(kind: 'EnemyEvent', enemy: Enemy.find_by(name: "Smelly Dog"))
nd = Event.find_or_create_by!(kind: 'EnemyEvent', enemy: Enemy.find_by(name: "Noisy Dog"))
stsmnd = Event.find_or_create_by!(kind: 'EnemyEvent', enemy: Enemy.find_by(name: "Stinky Smelly Noisy Dog"))

te = Event.find_or_create_by!(kind: 'TreasureEvent', name: "Dog's Stash", description: "You found the dog's stash of toys and treats!", gold_found: 10)

fe = Event.find_or_create_by!(kind: 'FluffEvent', name: "Naptime", description: "All this adventuring tired you out. You take a nice long nap.")

AdventureEvent.find_or_create_by!(adventure: w, event: std, completes_adventure: false, weight: 10)
AdventureEvent.find_or_create_by!(adventure: w, event: smd, completes_adventure: false, weight: 10)
AdventureEvent.find_or_create_by!(adventure: w, event: nd, completes_adventure: false, weight: 10)
AdventureEvent.find_or_create_by!(adventure: w, event: stsmnd, completes_adventure: true, weight: 6)

AdventureEvent.find_or_create_by!(adventure: w, event: te, completes_adventure: false, weight: 3)
AdventureEvent.find_or_create_by!(adventure: w, event: fe, completes_adventure: false, weight: 20)
