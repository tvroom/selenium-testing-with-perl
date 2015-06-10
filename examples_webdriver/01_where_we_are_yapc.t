#Simple demo of navigating through some pages with Perl & Webdriver
# using Selenium::Remote::Driver

use Selenium::Remote::Driver;
use Selenium::Remote::WDKeys;
use Test::More;

my $driver = Selenium::Remote::Driver->new(default_finder => 'css');

# Navigate to google.com
$driver->get('http://www.google.com');

# Type in query into q named input field & press enter
$driver->find_element('q','name')->send_keys('YAPC Salt Lake City',KEYS->{'enter'});

# Wait for up to 5 seconds on find_elements, before saying element isn't there
$driver->set_implicit_wait_timeout(5000);

# click on first search result
$driver->find_element('#rso li h3 a')->click();
 
my $title = $driver->get_title();
like($title, qr/YAPC/, "Title for YAPC page is what is expected");

$driver->find_element('Talks and Schedule', 'link_text')->click();
$driver->find_element('Schedule','link_text')->click();

# Disable when it's Wednesday and it defaults to this page... then switch back later
#$driver->find_element('Wednesday','link_text')->click();
$driver->find_element('Selenium','partial_link_text')->click();

$title = $driver->get_title();
like($title, qr/Selenium/, "Title seems to be about testing with Selenium");
sleep 5; # For demo purposes wait a bit before closing so we can see the final page
$driver->quit();

done_testing();
