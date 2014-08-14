use Parallel::ForkManager;
use Net::DNS::Resolver;
use Net::LibIDN ':all';

open $FILE, "<", "RELAYS.filtered" or die "could not open file ";

my $pm = new Parallel::ForkManager(50);


while (<$FILE>) {
      $pm->start and next;

         chomp;
         my $hostname = $_;
         $idnhostname = idn_to_ascii($hostname);
         $salida = ` smtpscan -i=2  $idnhostname| grep " - " `;
         print "--".$hostname.":\t".$idnhostname.":\tRESULTADO: ".$salida."\n";

      $pm->finish; ## end point of the parallel process
  }



