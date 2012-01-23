package DateTimeFactory;
use strict;
use warnings;
use parent 'Class::Accessor::Fast';
our $VERSION = '0.01';
use DateTime;
use Smart::Args;
use DateTime::Format::Strptime;

__PACKAGE__->mk_accessors(qw/time_zone/);

sub create {
    args my $class     => 'ClassName',
         my $time_zone => { isa => 'DateTime::TimeZone' };

    bless {
        time_zone => $time_zone,
    }, $class;
}

sub new {
    my $self = shift;
    my %args = @_;

    unless( $args{time_zone} ) {
        $args{time_zone} = $self->time_zone;
    }

    DateTime->new( %args );
}

sub now      {
    my $self = shift;
    DateTime->now( time_zone => $self->time_zone );
}

sub today    {
    my $self = shift;
    DateTime->today( time_zone => $self->time_zone );
}

sub strptime {
    args my $self,
         my $string  => 'Str',
         my $pattern => 'Str';

    my $strp = new DateTime::Format::Strptime(
        pattern     => $pattern,
        time_zone   => $self->time_zone,
    );

    $strp->parse_datetime($string);
}

1;
__END__

=head1 NAME

DateTimeFactory 

=head1 SYNOPSIS

    use strict;
    use warnings;

    use DateTimeFactory;
    use DateTime::TimeZone;
    
    my $dtf = DateTimeFactory->create({
        time_zone => DateTime::TimeZone->new( name => 'Asia/Tokyo' )    
    });

    my $now   = $dtf->now();
    my $today = $dtf->today();

    my $dt    = $dtf->strptime({
        string  => "2012-01-01 00:00:00",
        pattern => "%Y-%m-%d %H:%M:%S",
    });


=head1 DESCRIPTION

DateTimeFactory is

=head1 AUTHOR

yamanaka hiroyuki E<lt>default {at} example.comE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
