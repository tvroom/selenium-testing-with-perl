# Test to see what default page load timeout is for webdriver when 
# navigating to a new page

use Selenium::Remote::Driver;
use Time::HiRes qw/time/;

my $driver = Selenium::Remote::Driver->new();

$driver->navigate("http://timvroom.com/selenium/sleep.pl?seconds=1");

my $start = time();

eval {
	$driver->find_element("#notthere", "css");
};

if($@) {
	print "Error or timeout occured after: ".(time()-$start). " seconds\n";
	print "Error: $@\n";
}

