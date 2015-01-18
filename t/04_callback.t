use strict;
use warnings;
use Test::More;
use Plack::Test;
use HTTP::Request::Common;
use Imager;

use Plack::Middleware::Favicon;

unless ( grep { $_ =~ m!png! } Imager->read_types ) {
    plan skip_all => "You must install 'libpng'";
}
unless ( grep { $_ =~ m!ico! } Imager->write_types ) {
    plan skip_all => "You must install 'libico'";
}

{
    my $fav_app = Plack::Middleware::Favicon->new(
        src_image_file  => 'share/src_favicon.png',
        callback => sub {
            my ($self, $f, $img) = @_;
            $img->scale(
                xpixels => $img->getwidth  * 2,
                ypixels => $img->getheight * 2,
            );
        },
    )->to_app;

    test_psgi $fav_app, sub {
        my $cb = shift;
        my $res = $cb->(GET '/favicon.ico');

        is $res->code, 200;
        my $img = Imager->new(data => $res->content);
        is $img->getwidth, 32;
    };
}

done_testing;
