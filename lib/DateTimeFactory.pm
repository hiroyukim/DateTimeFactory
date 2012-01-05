package DateTimeFactory;
use strict;
use warnings;
use parent 'Class::Accessor::Fast';
our $VERSION = '0.01';
use DateTime;
use Smart::Args;
use DateTime::Format::Strptime;

__PACKAGE__->mk_accessors(qw/time_zone/);

sub new {
    args my $class     => 'ClassName',
         my $time_zone => { isa => 'DateTime::TimeZone' };

    bless {
        time_zone => $time_zone,
    }, $class;
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

DateTimeFactory -

=head1 SYNOPSIS

  use DateTimeFactory;

=head1 DESCRIPTION

DateTimeFactory is

=head1 AUTHOR

yamanaka hiroyuki E<lt>default {at} example.comE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
