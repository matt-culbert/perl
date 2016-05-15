use warnings;
use net::smtp;  
use IO::Socket;

my $path_to_file = "/var/runeScapeChallenge/list.txt";
my $server = "https://secure.runescape.com/m=weblogin/loginform.ws?mod=www&ssl=0&dest=community";
my $username = "hackmereddit@gmx.co.uk";
my ($password) = open(my $handle, '<', $path_to_file); close $handle;

my $sock = new IO::Socket::INET(PeerAddr => $server,
						PeerPort => 9615,
						Proto => 'tcp') or
							die "Can't connect\n";

print $sock "Email / Username $username\r\n";
print $sock "Password $password\r\n";

while (my $input = <$sock>) {
   chop $input;
   if ($input =~ /^PING(.*)$/i) {

        print $sock "PONG $1\r\n";
    }
}