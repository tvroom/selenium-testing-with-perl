# Sample code to verify analytics tracking -- in this case GA tracking

use WWW::Selenium;
use WWW::Selenium::NetworkCapture;
use Data::Dumper;
use Test::More;

my $sel=WWW::Selenium->new(
	browser_url => "http://timvroom.com"
);

# Call this below instead of a $sel->start -- it's a $sel->start with some special config to capture network traffic
$sel->{session_id} = $sel->get_string(
	"getNewBrowserSession",
	$sel->{browser_start_command},
	$sel->{browser_url},
	undef,
	'captureNetworkTraffic=true'
);

$sel->open("http://timvroom.com/selenium/ga_test.html");
$sel->wait_for_page_to_load(10000);

my $traffic_xml = $sel->get_string('captureNetworkTraffic', 'xml');
    
my $netcap = WWW::Selenium::NetworkCapture->new($traffic_xml);

my @requests = @{$netcap->{dom}{entry}};


my @ga_track_pv = grep { $_->{url} =~ m|www.google-analytics.com/r/collect\?.*t=pageview| } @requests;

print Dumper(\@ga_track_pv);
my @non_200_ga_track = grep { !$_->{statusCode} == 200 } @ga_track_pv;

ok(@ga_track_pv == 1, "Got exactly 1 GA track pageview request");
ok(!@non_200_ga_track, "All GA track pageview requests got a 200 statusCode");


$sel->stop();
done_testing();
