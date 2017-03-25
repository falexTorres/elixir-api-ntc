# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ApiTry.Repo.insert!(%ApiTry.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias ApiTry.Repo
alias ApiTry.Products
alias ApiTry.User

# Repo.insert!(%User{email: "all_might", password: "ima_g"})
# Repo.insert!(%Products{name: "Product 1", price: "$1.00", description: "this is product 1's description"})
# Repo.insert!(%Products{name: "Product 2", price: "$2.00", description: "this is product 2's description"})
# Repo.insert!(%Products{name: "Product 3", price: "$3.00", description: "this is product 3's description"})
# Repo.insert!(%Products{name: "Product 4", price: "$4.00", description: "this is product 4's description"})
# Repo.insert!(%Products{name: "Product 5", price: "$5.00", description: "this is product 5's description"})
# Repo.insert!(%Products{name: "Product 6", price: "$6.00", description: "this is product 6's description"})
# Repo.insert!(%Products{name: "Product 7", price: "$7.00", description: "this is product 7's description"})
# Repo.insert!(%Products{name: "Product 8", price: "$8.00", description: "this is product 8's description"})
# Repo.insert!(%Products{name: "Product 9", price: "$9.00", description: "this is product 9's description"})
# Repo.insert!(%Products{name: "Product 10", price: "$10.00", description: "this is product 10's description"})
# Repo.delete!(%User{id: 1})
# Repo.insert!(%User{email: "all_might", password: "ima_g", role: "system_admin"})
# Repo.insert!(%User{email: "fake@email.com", password: "password"})