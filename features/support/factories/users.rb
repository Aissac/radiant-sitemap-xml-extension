Factory.define(:user) do |f|
  f.sequence(:login) { |i| "user-#{i}"}
  f.email { |u| "#{u.login}@example.com"}
  f.name { |u| u.login }
  f.password "secret"
  f.password_confirmation { |u| u.password }
end

Factory.define(:admin, :parent => :user) do |f|
  f.admin true
end

Factory.define(:non_admin, :parent => :user) do |f|
  f.admin false
end

Factory.define(:designer, :parent => :user) do |f|
  f.designer true
end