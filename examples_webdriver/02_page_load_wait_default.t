# Test to see what default page load timeout is for webdriver when 
# navigating to a new page

use Selenium::Remote::Driver;
use Time::HiRes qw/time/;

my $driver = Selenium::Remote::Driver->new();
my $start = time();

eval {
	$driver->navigate("http://timvroom.com/selenium/sleep.pl?seconds=240");
};

if($@) {
	print "Error: $@\n";
	print "Error or timeout occured after: ".(time()-$start). " seconds\n";
}

