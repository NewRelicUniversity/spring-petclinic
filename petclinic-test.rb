require 'watir-webdriver'

  @rooturl = 'http://localhost:8080/petclinic'

case ARGV[0]
  when 'ff', 'Firefox'
    @b = Watir::Browser.new :firefox, :profile => 'default'
  when 'chrome'
    @b = Watir::Browser.new :chrome
  else
    @b = Watir::Browser.new :phantomjs
end

while true do
  for owner in 1..10
    @b.goto @rooturl + '/'
    @b.goto @rooturl + '/vets.html'
    @b.goto @rooturl + '/owners/find.html'
    @b.goto @rooturl + '/owners.html?lastName=Davis'
    @b.goto @rooturl + '/owners/' + owner.to_s + '.html'
    @b.goto @rooturl + '/owners/' + owner.to_s + '/edit.html'
    for pet in 1..13
      @b.goto @rooturl + '/owners/' + owner.to_s + '/pets/' + pet.to_s + '/visits/new'
    end
  end
end