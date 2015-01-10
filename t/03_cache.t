use strict;
use warnings;
use Test::More;
use Plack::Test;
use HTTP::Request::Common;
use Imager;

use Plack::Middleware::Favicon;

{
    my $cache = Cache::Foo->new;

    my $fav_app = Plack::Middleware::Favicon->new(
        src_image_file  => 'share/src_favicon.png',
        cache => $cache,
    )->to_app;

    test_psgi $fav_app, sub {
        my $cb = shift;
        my $res = $cb->(GET '/favicon.ico');

        is $res->code, 200;
        my $img = Imager->new(data => $res->content);
        is $img->getwidth, 16;
        like $cache->get('16:16:png'), qr/PNG/;
    };
}

done_testing;

package # hide from PAUSE
    Cache::Foo;
use strict;
use warnings;

sub new {
    my $class = shift;
    bless +{}, $class;
}

my $c;
sub set {
    my ($self, $key, $value) = @_;

    $c->{$key} = $value;
}

sub get {
    my ($self, $key) = @_;

    $c->{$key};
}

1;
