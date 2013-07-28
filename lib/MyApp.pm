package MyApp;
use Dancer ':syntax';
use Dancer::Plugin::Ajax;

our $VERSION = '0.1';

my $content;

get '/' => sub {
    template 'index';
};

get '/sync' => sub {
	template 'form.tt', {content => $content}; 
};

ajax '/sync' => sub {
	{
		content => $content
	};
};

post '/sync/add' => sub {
	$content = params->{text};
	redirect '/sync';
};

true;
