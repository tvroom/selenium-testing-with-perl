use Selenium::Firefox;

my $driver = Selenium::Remote::Driver->new();

$driver->get("http://timvroom.com/selenium/playground");
$driver->set_implicit_wait_timeout(1000);

#1 
my $title = $driver->get_title();
$driver->find_element_by_css('#answer1')->send_keys($title);
print "Answered 1\n";

#2
$driver->find_element_by_name('name')->send_keys('Kilgore Trout');
print "Answered 2\n";

#3
$driver->find_element_by_css('#occupation > [value=scifiauthor]')->click();
print "Answered 3\n";

#4
my $boxes = $driver->find_elements('.bluebox','css');
$driver->find_element_by_id('answer4')->send_keys(scalar @$boxes);
print "Answered 4\n";

#5 
$driver->find_element('click me', 'link_text')->click();
print "Answered 5\n";

#6 
my $redbox_class = $driver->find_element_by_id('redbox')->get_attribute('class');
$driver->find_element_by_id('answer6')->send_keys($redbox_class);
print "Answered 6\n";

#7 
$driver->execute_script('ran_this_js_function()');
print "Answered 7\n";

#8
my $js_return = $driver->execute_script('return got_return_from_js_function()');
$driver->find_element_by_id('answer8')->send_keys($js_return);
print "Answered 8\n";

#9
$driver->find_element_by_css('[value=wrotebook]')->click();
print "Answered 9\n";

#10
my $redtext= $driver->find_element_by_id('redbox')->get_text();
$driver->find_element_by_id('answer10')->send_keys($redtext);
print "Answered 10\n";

my $orange_location = $driver->find_element_by_id('orangebox')->get_element_location();
my $green_location = $driver->find_element_by_id('greenbox')->get_element_location();
my $arrange_answer = $green_location->{y} < $orange_location->{y} ? "green" : "orange";
$driver->find_element_by_id('answer11')->send_keys($arrange_answer);
print "Answered 11\n";

#12
$driver->set_window_size(650,850);
print "Did Task 12\n";

#13
my $elems = $driver->find_elements('#ishere','css');
$driver->find_element_by_id('answer13')->send_keys(@$elems ? "yes" : "no");
print "Answered 13\n";

#14
my $displayed = $driver->find_element_by_id('purplebox')->is_displayed();
$driver->find_element_by_id('answer14')->send_keys($displayed ? "yes" : "no");
print "Answer 14\n";

#15
$driver->set_implicit_wait_timeout(11000);
$driver->find_element('click then wait', 'link_text')->click();
$driver->find_element('click after wait', 'link_text')->click();
print "Completed 15\n";

#16
$driver->accept_alert();
$driver->set_implicit_wait_timeout(1000);  # modal / confirm / alert needs to be closed before we can do this
print "Completed 16\n";

#17
$driver->find_element_by_id('submitbutton')->submit();
print "Completed 17\n";

my $tophead = $driver->find_element_by_id('tophead');
$driver->mouse_move_to_location(element => $tophead, xoffset => 0, yoffset => 0);

$driver->find_element_by_id('checkresults')->click();
print "Press enter when you check results\n";
<>;

