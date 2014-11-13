# Test to see what behavior is for submitting a form with changed page load timeout
# Shows it respects page load timeout setting as well

use Selenium::Remote::Driver;
use Time::HiRes qw/time/;

my $driver = Selenium::Remote::Driver->new();
my $start = time();

$driver->set_timeout('page load', 10000); # 10 second timeout in ms
$driver->navigate("http://timvroom.com/selenium/submit_form_start.html");


$driver->find_element('name','name')->send_keys('Bob');
eval {
	$driver->find_element('form','css')->submit();
};

if($@) {
	print "Error or timeout occured after: ".(time()-$start). " seconds\n";
	print "Error: $@\n";
}

$driver->quit();
