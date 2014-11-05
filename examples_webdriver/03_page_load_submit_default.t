use Selenium::Remote::Driver;
use Time::HiRes qw/time/;

my $driver = Selenium::Remote::Driver->new();
my $start = time();

$driver->navigate("http://timvroom.com/selenium/submit_form_start.html");

$driver->find_element('name','name')->send_keys('Bob');
eval {
	$driver->find_element('form','css')->submit();
};

if($@) {
	print "Error: $@\n";
	print "Error or timeout occured after: ".(time()-$start). " seconds\n";
}
for(1..25) {
print $driver->get_title() ."\n";
sleep 1;
}
