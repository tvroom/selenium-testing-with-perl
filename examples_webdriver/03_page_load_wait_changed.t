use Selenium::Remote::Driver;
use Time::HiRes qw/time/;

my $driver = Selenium::Remote::Driver->new();
$driver->set_timeout('page load', 10000); # 10 second timeout in ms

my $start = time();

eval {
	$driver->navigate("http://timvroom.com/selenium/sleep.pl?seconds=240");
};

if($@) {
	print "Error: $@\n";
	print "Error/timeout occured after: ".(time()-$start). " seconds\n";
}

