# Show that increasing implicit_wait_timeout makes us look for #notthere longer


use Selenium::Remote::Driver;
use Time::HiRes qw/time/;

my $driver = Selenium::Remote::Driver->new();

$driver->navigate("http://timvroom.com/selenium/sleep.pl?seconds=1");
$driver->set_implicit_wait_timeout(5000);

my $start = time();

eval {
	$driver->find_element("#notthere",'css');
};

if($@) {
	print "Error or timeout occured after: ".(time()-$start). " seconds\n";
	print "Error: $@\n";
}

