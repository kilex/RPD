#!/usr/bin/perl
print '
package RPD::URI;
require Exporter;
@ISA = qw(Exporter);
@EXPORT_OK = qw(geturi listchans getchname getchans);

our %channels = (
';

foreach $chan(1..999) {
	my $result= `curl -s  http://radiopotok.ru/f/m3u/station_$chan.m3u | grep http -B1`;
		if ($result) {
			my ($first,$url)=split("\n",$result);
			my ($fufel,$descr)=split(",",$first);
			$descr=~s/\(поток 1\)//;
#			print "$url ($descr)\n";
			print"channel_$chan     => {\n\tname => '$descr',\n\turi  => '$url',\n\t},\n";
		}
}

print '

);

sub geturi {
  my $chname = shift;
  return undef unless exists $channels{$chname};
  return $channels{$chname}->{uri};
}

sub getchname {
  my $chname = shift;
  return $channels{$chname}->{name};
}

sub getchans {
  return \%channels;
}

sub listchans { #FIXME
  my %hash;
  for my $chname(sort(keys(%channels))) {
    $hash{$channels{$chname}{name}} = $chname;
  }
    for my $key(sort(keys(%hash))) {
      printf("%-40s %0s\n",
        $key, $hash{$key});
  }
}';

exit
