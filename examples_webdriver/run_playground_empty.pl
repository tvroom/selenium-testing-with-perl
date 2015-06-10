use Selenium::Firefox;

my $driver = Selenium::Remote::Driver->new();

$driver->get("http://timvroom.com/selenium/playground");



my $redbox_class = $driver->find_element_by_id('redbox')->get_attribute('class');
$driver->find_element_by_id('answer6')->send_keys($redbox_class);

#8
my $js_return = $driver->execute_script("return got_return_from_js_function()");
$driver->find_element_by_id('answer8')->send_keys($js_return);


#11 
my $orange_location = $driver->find_element_by_id('orangebox')->get_element_location();
my $green_location = $driver->find_element_by_id('greenbox')->get_element_location();

my $arrange_answer = $green_location->{y} < $orange_location->{y} ? "green" : "orange";
$driver->find_element_by_id('answer11')->send_keys($arrange_answer);


$driver->find_element_by_id('checkresults')->click();


my $tophead = $driver->find_element_by_id('tophead');
$driver->mouse_move_to_location(element => $tophead, xoffset => 0, yoffset => 0);

print "Press enter once you're done evaluating the results after 'check results'\n";
<>;

