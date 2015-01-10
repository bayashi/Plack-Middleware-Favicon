package Plack::Middleware::Favicon;
use strict;
use warnings;
use Carp qw/croak/;

our $VERSION = '0.01';

sub new {
    my $class = shift;
    my $args  = shift || +{};

    bless $args, $class;
}

1;

__END__

=head1 NAME

Plack::Middleware::Favicon - one line description


=head1 SYNOPSIS

    use Plack::Middleware::Favicon;


=head1 DESCRIPTION

Plack::Middleware::Favicon is


=head1 REPOSITORY

Plack::Middleware::Favicon is hosted on github: L<http://github.com/bayashi/Plack-Middleware-Favicon>

I appreciate any feedback :D


=head1 AUTHOR

Dai Okabayashi E<lt>bayashi@cpan.orgE<gt>


=head1 SEE ALSO

L<Other::Module>


=head1 LICENSE

This module is free software; you can redistribute it and/or
modify it under the same terms as Perl itself. See L<perlartistic>.

=cut
