use Selenium::Remote::Driver;
use Test::More;

my $driver = Selenium::Remote::Driver->new(default_finder => 'css');

$driver->get('http://www.google.com');

my $elem = $driver->find_element('q','name')->send_keys('Pittsburgh Perl Workshop');
sleep 2;
$driver->find_element('//*[@id="rso"]/div[2]/li[1]/div/h3/a','xpath')->click(); 

my $title = $driver->get_title();
like($title, qr/The Pittsburgh Perl Workshop/, "Title for PPW is what is expected");

$driver->find_element('Talks and Schedule', 'link_text')->click();

$driver->find_element('Schedule','link_text')->click();

$driver->find_element('Sunday','link_text')->click();

$driver->find_element('Selenium','partial_link_text')->click();

$title = $driver->get_title();

like($title, qr/Testing.*Selenium/, "Title seems to be about testing with Selenium");

$driver->quit();

done_testing();

