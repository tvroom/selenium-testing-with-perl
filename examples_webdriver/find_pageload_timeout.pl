use Test::Selenium::Remote::Driver;

my $td = Test::Selenium::Remote::Driver->new();

$td->set_timeout('page load', 10000);

my $start = time();
eval {
	$td->navigate("http://timvroom.com/selenium/sleep.pl");
};

if($@) {
	print "$@\n\n";
	print "Failed -- timeout ".(time()-$start)." seconds after start of navigate()\n";
}

