use Selenium::Firefox;

my $driver = Selenium::Remote::Driver->new();

$driver->get("http://timvroom.com/selenium/playground");

#15
$driver->set_implicit_wait_timeout(11000);
$driver->find_element('click then wait', 'link_text')->click();
$driver->find_element('click after wait', 'link_text')->click();
print "Completed #15\n";

$driver->accept_alert();
print "Completed #16\n";

$driver->find_element_by_id('checkresults')->click();



my $tophead = $driver->find_element_by_id('tophead');
$driver->mouse_move_to_location(element => $tophead, xoffset => 0, yoffset => 0);

print "Press enter once you're done evaluating the results after 'check results'\n";
<>;

