use Cwd;

my $presets = {
    java => {
        setup => sub { `javac main.java`; },
        run => sub { `java main`; },
        teardown => sub { `rm main.class`; }
    }, haskell => {
        setup => sub { },
        run => sub { `runhaskell main.hs`; },
        teardown => sub { }
    }, ghc => {
        setup => sub { `ghc -O2 main.hs`; },
        run => sub { `runhaskell main.hs`; },
        teardown => sub { `rm main.o main.hi main`; }
    }
};

sub run {
    my ($steps) = @_;
    $steps->{setup}->();
    $steps->{run}->();
    $steps->{teardown}->();
}

sub main {
    my ($problem, $language) = @ARGV;

    print "Running problem $problem in $language...\n";

    my $cwd = getcwd;
    chdir "Problem\ $problem" or die "$!";
    run($presets->{$language});

    chdir $cwd or die "$!";
}

main();
