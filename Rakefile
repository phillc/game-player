task :default => :test

task :test do
  puts `node specs.js`
end

desc "Watch coffeescripts and compile"
task :watch do
  puts `coffee --watch --compile -o public/javascripts/ -c client/`
end