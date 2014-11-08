use Selenium::Remote::Driver;
use Test::More;

my $driver = Selenium::Remote::Driver->new('default_finder' => 'css');

$driver->navigate("http://timvroom.com/selenium/js_testing.html");

my $shopping_count = $driver->execute_script('return $(".shopping-list li").length');

ok($shopping_count >= 3, "Shopping list has at least 3 items");

done_testing();
