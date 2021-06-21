Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.50131.1624294542472665866
 for <docs@lists.yoctoproject.org>;
 Mon, 21 Jun 2021 09:55:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 8C78520005;
	Mon, 21 Jun 2021 16:55:40 +0000 (UTC)
Subject: Re: [docs] Yocto Doc Thoughts
To: Randy Yates <yates@ieee.org>, docs@lists.yoctoproject.org
References: <CALJBDKjUGx=xWMzypOLCMWRVfW6vCvv3=9fWFnZpeqZ_O7q62w@mail.gmail.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <fc73a1a1-e3e0-e5ab-1d0c-ddb668d43ccc@bootlin.com>
Date: Mon, 21 Jun 2021 18:55:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CALJBDKjUGx=xWMzypOLCMWRVfW6vCvv3=9fWFnZpeqZ_O7q62w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Randy,

Many thanks about your feedback about our documentation! See my comments
below...

On 6/19/21 7:30 AM, Randy Yates wrote:
>
> Hello All,
>
> I was asked to provide my feedback on the Yocto documentation on the
> #yocto irc channel a few weeks ago, so here goes. Sorry it’s taken me
> so long to get around to it.
>
> First I want to say thank you to all who have volunteered their time
> to create the Yocto documentation. The documentation has improved
> significantly over the past few years I’ve been using Yocto (since
> about 2016). The sheer amount and number of documents means this
> was/is a Herculean task, even for a large group of volunteers such as
> yourselves.
>
> Also let me say (as will become obvious) that these ideas are not on
> specific problems but address general attributes of the documentation
> that I feel could be improved.
>
> OK, so the feedback:
>
> 1.
>
>     Be less flowery. Many of the docs seem to be written with more
>     words than are necessary, as if embedding the information in some
>     amount of niceties helps engage the reader. In my opinion, it
>     hurts. The overriding goal of documentation should be to state
>     things as precisely and succinctly as possible so that the reader
>     gets to their information quickly and clearly. The writer should
>     spend x amount of time once writing things well so that 100,000
>     users don’t have to spend 100,000⁢x hours.
>

I agree with this. As the new (part-time) maintainer of the
documentation, I had that impression too and found redundant
explanations or types of sentences that would be worth factorizing, not
mentioning the style that is definitely worth simplifying too. I already
started some "simple" simplifications, but there is a long way to go.

> 1.
>
>     Related to the previous point, factor the information into logical
>     pieces and define things once. It seems that many parts of the
>     Yocto system are described across several documents. This makes it
>     difficult to digest.
>

Agreed too. The current documentation can definitely be made simpler and
easier to follow, and therefore less time consuming for readers.

> 1.
>
>     Be less grammatically and/or syntactically ambiguous, and provide
>     sufficient context.
>
> I should have taken some time to provide specific examples, but this
> is a start. If it doesn’t irritate folks too much, I can put together
> a followup with specifics.
>
I'd definitely be interested in examples, indeed.

All this is only my opinion, and I'm not the only one in charge (the
community of developers we submit documentation patches to ultimately
decides), but it's good to know that our views intersect.

Thanks again for your contribution.

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

