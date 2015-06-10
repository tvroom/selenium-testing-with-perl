# Test to verify JS library inclusion
# Only one is included on test page, so 2 expected to fail

use Selenium::Remote::Driver;
use Test::More;

my $driver = Selenium::Remote::Driver->new();

$driver->navigate("http://timvroom.com/selenium/js_testing.html");

ok(js_defined("window.jQuery"), "jQuery installed on $_[0]");
ok(js_defined("window.jQuery.cookie"), "jQuery cookie plugin installed");
ok(js_defined("window.Handlebars"), "has Handlebars installed");

$driver->quit();
done_testing();

sub js_defined {
	my $val = shift;
	my $ret = $driver->execute_script("return !(typeof $val === 'undefined')");
	return $ret;
}
