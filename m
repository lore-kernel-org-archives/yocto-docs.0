Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web08.21389.1622299585152286891
 for <docs@lists.yoctoproject.org>;
 Sat, 29 May 2021 07:46:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.196, mailfrom: foss@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPA id B765FE0002;
	Sat, 29 May 2021 14:46:22 +0000 (UTC)
MIME-Version: 1.0
Date: Sat, 29 May 2021 16:46:22 +0200
From: "Quentin Schulz" <foss@0leil.net>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>, YP docs mailing list
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] docs: replace ``FOO`` by :term:`FOO` where possible
In-Reply-To: <abeceac5-5ab7-c9a4-8a6c-451c9169d597@bootlin.com>
References: <20210527184117.80067-1-foss@0leil.net>
 <CAP71Wjy9rLUs3kF7k9jjK04p8K4qLbqvzKXRtOQiKhOctxffxw@mail.gmail.com>
 <abeceac5-5ab7-c9a4-8a6c-451c9169d597@bootlin.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <1fe5b4bfee4cfb55a7c3a15b725f2b1f@0leil.net>
X-Sender: foss@0leil.net
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

Michael, Nicolas,

On 2021-05-28 18:32, Michael Opdenacker wrote:
> Hi Quentin,
> 
> On 5/27/21 9:45 PM, Nicolas Dechesne wrote:
>> 
>> 
>> 
>> Have you checked what happens for the terms from the bitbake manual?
>> Perhaps it would be better to split into 2 patches, and run with
>> bitbake and without. You don't seem to add the bitbake prefix in the
>> term role, right?  So we could potentially have a confusion if/when a
>> term exists in both yp and bitake terms, no?
> 
> 
> Good guess, Nico, I found at least one case where a reference to the
> BitBake manual is needed instead... See below.
> 

It's actually not needed (I just re-tested and we already talked about 
it with Nicolas a few months back). If there is an entry in both 
glossaries, only YP's will be taken. If there's an entry only in 
Bitbake's, it will point to Bitbake's.

The nice thing with not explicitly targeting Bitbake's is that in the 
event it gets a YP-specific or longer/clearer/better explanation in YP, 
there'll be no change needed. No maintenance on that side which is 
great. I think this is something we should aim for, thus, no change 
needed in my opinion.

>> 
>> 
>>         The ``SOURCE_MIRROR_URL`` and ``own-mirror``
>>         class set up the system to use the downloads directory as your
>>     "own
>>     -   mirror". Using the ``BB_NO_NETWORK`` variable makes sure that
>>     +   mirror". Using the :term:`BB_NO_NETWORK` variable makes sure 
>> that
>>         BitBake's fetching process in step 3 stays local, which means
>>     files
>>         from your "own-mirror" are used.
>> 
> 
> Here, it should be substituted by ":term:`bitbake:BB_NO_NETWORK`" 
> instead.
> 

See above :)

> As far as I am concerned, I like your patch. Before it, the decision to
> make a link to the variable index was a bit fuzzy, depending on how far
> a previous reference to the index was made. That's probably safer this 
> way.
> 

And it makes it super easy 1) to run the script if need be to check if 
some were forgotten or recently added (while being already highlighted 
in the doc), 2) a simple consistent rule of "if it is documented, always 
use :term:`` for variables". This brings me also to the fact that we 
should start adding rules to a README or CONTRIBUTING to keep track of 
those, because I'm pretty sure there is already one or two we agreed on 
and I forgot about :)

Cheers,
Quentin
