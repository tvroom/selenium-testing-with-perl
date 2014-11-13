use Test::Selenium::Remote::Driver;

my $td = Test::Selenium::Remote::Driver->new();

my $start = time();
eval {
	$td->navigate("http://timvroom.com/selenium/sleep.pl?seconds=240");
};

if($@) {
	print "Failed -- timeout ".(time()-$start)." seconds after start of navigate()\n";
	print "$@\n\n";
}

