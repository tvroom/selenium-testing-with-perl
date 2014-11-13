# Sample making JS call with WWW::Selenium
use WWW::Selenium;
use Test::More;

my $sel = WWW::Selenium->new('browser_url' => 'http://timvroom.com');
$sel->start();

$sel->open("http://timvroom.com/selenium/js_testing.html");
$sel->wait_for_page_to_load(10000);

# Run a snippet of JS - need to reference window. to get at jQuery's $
my $shopping_count = $sel->get_eval('window.$(".shopping-list li").length');

ok($shopping_count >= 3, "Shopping list has at least 3 items");
$sel->stop();
done_testing();
