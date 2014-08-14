use Parallel::ForkManager;
open $FILE, "<", "testfile" or die "could not open file ";

my $pm = new Parallel::ForkManager(50);


while (<$FILE>) {
      $pm->start and next;
         chomp;
         $dominio=$_;
         $salida = ` dig $dominio mx +noqr +short`;
         print "--".$dominio."\n".$salida."\n";
#         $data = system(" dig $dominio mx +noqr +short");
      $pm->finish; ## end point of the parallel process
  }



