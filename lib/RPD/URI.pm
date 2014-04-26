package RPD::URI;
require Exporter;
use YAML::Tiny;
@ISA = qw(Exporter);
@EXPORT_OK = qw(geturi listchans getchname getchans random_channel);

our %channels;

open (MYFILE, '< /etc/channels.txt')  || die("Could not open file!");
while (<MYFILE>) {
 	chomp;
 	my ($chan,$name,$uri)=split("::",$_);
	$channels{$chan}{'name'}=$name;
	$channels{$chan}{'uri'}=$uri;
 }
close (MYFILE); 

sub geturi {
  my $chname = shift;
  return undef unless exists $channels{$chname};
  return $channels{$chname}{uri};
}

sub getchname {
  my $chname = shift;
  return $channels{$chname}{name};
}

sub getchans {
  return \%channels;
}

sub random_channel {
	my $channel = (keys %channels)[rand keys %channels];
	return $channel
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
}
