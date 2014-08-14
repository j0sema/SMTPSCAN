use Parallel::ForkManager;
use Net::DNS::Resolver;
use Net::LibIDN ':all';

open $FILE, "<", "LISTACO.dominios" or die "could not open file ";

my $pm = new Parallel::ForkManager(50);


while (<$FILE>) {
      $pm->start and next;
         chomp;
         my $hostname = $_;
         my $res = Net::DNS::Resolver->new(
           nameservers => [qw(80.58.61.250 8.8.8.8 8.8.4.4)],
         ); 
# IDN por que españa es así:

         $idnhostname = idn_to_ascii($hostname);

         my $mx = $res->query( $idnhostname, 'MX' );
         print "\n-- $hostname\t";
         exit unless $mx;
            foreach my $rr ($mx->answer) {
               exit unless $rr->type eq "MX";
               print "\t", $rr->exchange,"\t", ' (', $rr->preference, ")\t";
         }
      $pm->finish; ## end point of the parallel process
  }



