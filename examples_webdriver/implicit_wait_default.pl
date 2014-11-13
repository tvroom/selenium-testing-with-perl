# Test to see what the implicit wait timeout is for looking for an element
# Default is 0 ms which we'll see for looking for #notthere (actual operation may take longer than that)

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

