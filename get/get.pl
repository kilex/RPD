#!/usr/bin/perl

foreach $chan(1..999) {
	my $result= `curl -s  http://radiopotok.ru/f/m3u/station_$chan.m3u | grep http -B1`;
		if ($result) {
			my ($first,$url)=split("\n",$result);
			my ($fufel,$descr)=split(",",$first);
			$descr=~s/\(поток 1\)//;
#			print "$url ($descr)\n";
			print"channel_$chan::$descr::$url\n";
		}
}

exit
