
use strict;
use warnings;

use 5.010;

use ExtUtils::MakeMaker 6.30;

use File::ShareDir::Install;
install_share dist => "share";


my %WriteMakefileArgs = (
  "ABSTRACT" => "SeeAlso Server as PSGI application",
  "AUTHOR" => "Jakob Voss",
  "BUILD_REQUIRES" => {
    "English" => 0,
    "HTTP::Request::Common" => 0,
    "Plack::Test" => 0,
    "Test::More" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30",
    "File::ShareDir::Install" => "0.03"
  },
  "DISTNAME" => "Plack-App-SeeAlso",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Plack::App::SeeAlso",
  "PREREQ_PM" => {
    "Carp" => 0,
    "Encode" => 0,
    "File::ShareDir" => 0,
    "JSON" => 0,
    "Plack::App::unAPI" => 0,
    "Plack::Component" => 0,
    "Plack::MIME" => 0,
    "Plack::Middleware::JSONP" => 0,
    "Plack::Middleware::Static" => 0,
    "Plack::Request" => 0,
    "Plack::Util" => 0,
    "Plack::Util::Accessor" => 0,
    "feature" => 0,
    "parent" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.01",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);

{
package
MY;
use File::ShareDir::Install qw(postamble);
}


