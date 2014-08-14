# añado linea para subir a git por comando
#!/usr/bin/perl
use strict;
use warnings;

use Net::DNS::Resolver;

my $hostname = 'nic.es';
my $res = Net::DNS::Resolver->new(
  nameservers => [qw(8.8.8.8 8.8.4.4)],
);

    my $mx = $res->query( $hostname, 'MX' );

    print "$hostname\n";
    foreach my $rr ($mx->answer) {
        print "\t", $rr->exchange, ' (', $rr->preference, ")\n";
    }

