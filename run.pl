use Cwd;
use Time::HiRes qw(gettimeofday tv_interval);

my $presets = {
    java => {
        setup => sub { `javac main.java`; },
        run => sub { print `java main`; },
        teardown => sub { `rm main.class`; }
    }, haskell => {
        setup => sub { },
        run => sub { print `runhaskell main.hs`; },
        teardown => sub { }
    }, ghc => {
        setup => sub { `ghc -O2 main.hs`; },
        run => sub { print `./main`; },
        teardown => sub { `rm main.o main.hi main`; }
    }
};

sub run {
    my ($steps) = @_;
    $steps->{setup}->();
    my $t = [gettimeofday];
    $steps->{run}->();
    print tv_interval($t) . " seconds\n";
    $steps->{teardown}->();
}

sub main {
    my ($problem, $language) = @ARGV;

    print "Running problem $problem in $language...\n";

    my $cwd = getcwd;
    chdir "Problem$problem" or die "$!";
    run($presets->{$language});

    chdir $cwd or die "$!";
}

main();
