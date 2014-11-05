use WWW::Selenium;
use WWW::Selenium::NetworkCapture;
use Data::Dumper;
use Test::More;

my $sel=WWW::Selenium->new(
	browser_url => "http://timvroom.com/selenium/ga_test.html"
);
$sel->start();
$sel->{session_id} = $sel->get_string(
	"getNewBrowserSession",
	$sel->{browser_start_command},
	$sel->{browser_url},
	undef,
	'captureNetworkTraffic=true'
);

$sel->open("http://timvroom.com/selenium/broken_resources.html");
$sel->wait_for_page_to_load(10000);

my $traffic_xml = $sel->get_string('captureNetworkTraffic', 'xml');
    
my $netcap = WWW::Selenium::NetworkCapture->new($traffic_xml);
my @stat_code_urls = map { [$_->{statusCode}, $_->{url}]} grep { $_->{url} !~ /favicon.ico/ } grep { $_->{statusCode} =~/^(4|5)/  }  @{$netcap->{dom}{entry}};

ok(!@stat_code_urls, "Resources loaded w/o 40x or 50x errors for $key $url\n") or diag Dumper(@stat_code_urls);

$sel->stop();
done_testing();
