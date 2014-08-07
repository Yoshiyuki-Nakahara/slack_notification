
use strict;
use warnings;
use utf8;

use JSON::XS;

my $team_name = 'xxxxxxxxx';
my $token     = 'xxxxxxxxx';
my $channel   = 'xxxxxxxxx';
my $messgae   = 'xxxxxxxxx';
my $user_name = 'xxxxxxxxx';

slack_notification(
    "https://$team_name.slack.com/services/hooks/incoming-webhook?token=$token",
    $channel,
    $messgae,
    $user_name,
);

sub slack_notification
{
    my ( $url, $channel, $text, $user_name ) = @_;

    my $json_text = JSON::XS->new->utf8->encode( {
        "channel"  => $channel,
        "text"     => $text,
        "username" => $user_name,
    } );
    my $http_content = sprintf( "payload=%s", $json_text );

    `curl -X POST --data-urlencode '$http_content' $url > /dev/null 2>&1`;
}

