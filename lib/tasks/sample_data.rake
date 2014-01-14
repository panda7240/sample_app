namespace :db do
  desc "Fill database with sample data"
  #确保任务可以获取rails环境的信息
  task populate: :environment do
    #构造用户
    make_users
    #给每个用户构造微博
    make_microposts
    #构造用户之间的关系
    make_relationships
  end
end



def make_users
  #生成管理员数据
  admin = User.create!(name: "Example User",
                       email: "example@railstutorial.org",
                       password: "foobar",
                       password_confirmation: "foobar")
  admin.toggle!(:admin)

  #生成普通用户数据
  99.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password = "password"
    User.create!(name: name,
                 email: email,
                 password: password,
                 password_confirmation: password)
  end
end


def make_microposts
  #给前6个用户生成50条微博
  users = User.all(limit: 6)
  50.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.microposts.create!(content: content) }
  end
end


def make_relationships
  users = User.all
  user = users.first
  followed_users = users[2..50]
  followers = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each { |follower| follower.follow!(user) }
end