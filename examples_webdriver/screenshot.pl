use Selenium::Remote::Driver;

my $driver = Selenium::Remote::Driver->new();
$driver->get("http://blogs.perl.org");
$driver->capture_screenshot("screenshot.png");
$driver->quit();
