# Sample showing how you could extend Selenium::Remote::Driver
# to have a wait_for_condition method
#
# Package / code to run it all in a single script for simplicity in the proof of concept
#


package MySelenium;
use base 'Selenium::Remote::Driver';
use Time::HiRes;
use strict;

our $DEBUG = 1; # show debug messages

sub wait_for_condition {
	my($driver, $script, $timeout, $checkevery) = @_;
	use Time::HiRes;
	
	my $start_time = Time::HiRes::time();

	my $end_time = $start_time + $timeout / 1000;

	$checkevery ||= 500;
	my $checkevery_secs = $checkevery / 1000;
	my $ret = 0;
	my $remaining_secs = $timeout / 1000;

	do {
		print "wait_for_condition check\n" if $DEBUG;
		$ret = $driver->execute_script($script);
		
		if(!$ret) {
			$remaining_secs = $end_time - Time::HiRes::time();
			$remaining_secs = 0 if $remaining_secs < 0;
			my $sleep_time = $remaining_secs < $checkevery_secs ? $remaining_secs : $checkevery_secs;
			print "Sleeping for $sleep_time\n" if $DEBUG;
			Time::HiRes::sleep($sleep_time);
		}
	
	} while(!$ret && Time::HiRes::time() < $end_time);

	die "wait_for_condition timeout" if !$ret;

	print "Condition passed with a return of '$ret', returning\n" if $DEBUG;
	return $ret;
}
1;

my $driver = MySelenium->new();
$driver->get("http://timvroom.com/selenium/js_testing.html");
print STDERR "Wait for h1 there...\n";
$driver->wait_for_condition('return $("h1").length > 0', 5000, 1000);

print STDERR "\n\nWait for #notthere element there...\n";
$driver->wait_for_condition('return $("#notthere").length > 0', 5000, 1000);
$driver->quit();
