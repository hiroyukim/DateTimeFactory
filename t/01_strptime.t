use strict;
use Test::More tests => 1;
use DateTimeFactory;
use DateTime::TimeZone;

subtest 'strptime method' => sub {
    my $dtf = DateTimeFactory->new({ time_zone => DateTime::TimeZone->new( name => 'Asia/Tokyo' ) });    

    my $string  = "2012-01-01";
    my $pattern = "%Y-%m-%d";

    my $dt = $dtf->strptime({ string => $string , pattern => $pattern });

    isa_ok( $dt, 'DateTime' );
};

done_testing();
