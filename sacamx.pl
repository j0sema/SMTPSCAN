while (<>){
   chomp;
   @linea = split /\t/, $_ ;
   for $data (@linea){
      if ($data =~ /--/) { next;}
      if ($data =~ /\(\d+\)/) { next;}
      if ($data =~ /[\w\s]/) { $relays{$data} =1; }
   }
}
   for $mx (sort keys %relays){
      print $mx."\n";
   }

