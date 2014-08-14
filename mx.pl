#!/usr/bin/perl
use strict;
use warnings;

use Net::DNS::Resolver;

my $hostname = 'nic.es';
my $res = Net::DNS::Resolver->new(
  nameservers => [qw(8.8.8.8 8.8.4.4)],
);

for my $domain( @ARGV ) {
    my $mx = $dns->query( $domain, 'MX' );

    print "$domain\n";
    foreach my $rr ($mx->answer) {
        print "\t", $rr->exchange, ' (', $rr->preference, ")\n";
    }
}

