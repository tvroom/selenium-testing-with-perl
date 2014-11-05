#!/usr/bin/perl
use CGI;
my $q = CGI->new();
print $q->header();
my $secs = $q->param('seconds');

if($secs =~/^\d+$/) {
	
} else {
	$secs = 5;
}

$secs = 240 if $secs > 240;

print $q->start_html('Sleeping page');

print "Going to sleep for $secs seconds<br>\n";
sleep $secs;
print "Completed sleeping for $secs seconds<br>\n";
print $q->end_html();
