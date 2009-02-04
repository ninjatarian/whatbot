package whatbot::Command::Blackjack::Stack;
use Moose;

has 'cards' => ( is => 'rw', isa => 'ArrayRef' );

sub shuffle {
    my ( $self ) = @_;
    
    my %seen;
    my @cards;
    my $stack_size = scalar( @{$self->cards} );
    while ( scalar( keys %seen ) < $stack_size ) {
        my $index = -1;
        while ( $index < 0 or $seen{$index} ) {
            $index = int( rand($stack_size) );
        }
        push( @cards, $self->cards->[$index] );
        $seen{$index} = 1;
    }
    $self->cards(\@cards);
}

1;

=pod

=head1 NAME

whatbot::Command::Blackjack::Stack - Represents an independent, arbitrary stack of cards

=head1 DESCRIPTION

Acts as a base class for a deck or a shoe to provide helper functions for a
stack of cards.

=head1 PUBLIC ACCESSORS

=over 4

=item cards

Array reference containing each card in the stack.

=back

=head1 PUBLIC METHODS

=over 4

=item shuffle()

Shuffles the cards in the cards array reference.

=back

=head1 LICENSE/COPYRIGHT

Undetermined at this time. :)

=cut