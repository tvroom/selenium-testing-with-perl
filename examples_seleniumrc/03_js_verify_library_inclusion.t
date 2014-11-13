# Test for JS library inclusion with WWW::Selenium / Selenium RS

use WWW::Selenium;
use Test::More;

my $sel = WWW::Selenium->new(browser_url => 'http://timvroom.com');
$sel->start();

$sel->open("http://timvroom.com/selenium/js_testing.html");

ok(js_defined("window.jQuery"), "jQuery installed");
ok(js_defined("window.jQuery.cookie"), "jQuery cookie plugin installed");
ok(js_defined("window.Handlebars"), "has Handlebars installed");
$sel->stop();
done_testing();

sub js_defined {
	my $val = shift;
	my $ret = $sel->get_eval("!(typeof $val === 'undefined')");
	print $ret."\n";
	return js_true($ret);
}

# map values coming back to true or false
sub js_true {
       my $val = shift;
       return 0 if !$val || $val eq "null" || $val eq "false" || $val eq "undefined";
       return 1;
}
