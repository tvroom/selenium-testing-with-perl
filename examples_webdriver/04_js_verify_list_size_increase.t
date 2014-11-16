# Use JS to verify that we have successfully increased the number of items on our shopping list

use Selenium::Remote::Driver;
use Test::More;

my $driver = Selenium::Remote::Driver->new('default_finder' => 'css', 'javascript' => 1);

$driver->navigate("http://timvroom.com/selenium/js_testing.html");

my $shopping_count_orig = $driver->execute_script('return $(".shopping-list li").length');

$driver->find_element('#newitem')->send_keys('Soda');
$driver->find_element('#additem')->click();
my $shopping_count_after = $driver->execute_script('return $(".shopping-list li").length');

ok($shopping_count_after > $shopping_count_orig, "Shopping list has grown after adding Soda");


done_testing();
