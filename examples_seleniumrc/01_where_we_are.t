# Simple demo of navigating through some pages with Perl & Selenium RC 
# using Selenium::Remote::Driver

use WWW::Selenium;
use Test::More;

my $sel = WWW::Selenium->new('browser_url' => 'http://timvroom.com');
$sel->start(); 

$sel->open('http://www.google.com');
$sel->wait_for_page_to_load(10000);
$sel->type('q','Pittsburgh Perl Workshop');

sleep 2; # just wait a couple seconds for result to come in / better to use wait_for_condition, but keeping it simple here

$sel->click('css=#rso li h3 a'); 
$sel->wait_for_page_to_load(10000);

my $title = $sel->get_title();
like($title, qr/The Pittsburgh Perl Workshop/, "Title for PPW is what is expected");

$sel->click('link=Talks and Schedule');
sleep 1;
$sel->click('link=Schedule');
$sel->wait_for_page_to_load(10000);

$sel->click('link=Sunday');
$sel->wait_for_page_to_load(10000);

# Click on link to Selenium talk
$sel->click('link=regexp:.*Selenium.*');
$sel->wait_for_page_to_load(10000);

$title = $sel->get_title();
like($title, qr/Testing.*Selenium/, "Title seems to be about testing with Selenium");

sleep 5; # For demo purposes wait a bit before closing so we can see the final page
$sel->stop();

done_testing();
