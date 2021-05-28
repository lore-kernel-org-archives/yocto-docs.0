Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.10826.1622219524419935856
 for <docs@lists.yoctoproject.org>;
 Fri, 28 May 2021 09:32:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 790E8E000E;
	Fri, 28 May 2021 16:32:02 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] docs: replace ``FOO`` by :term:`FOO` where possible
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
 Quentin Schulz <foss@0leil.net>
References: <20210527184117.80067-1-foss@0leil.net>
 <CAP71Wjy9rLUs3kF7k9jjK04p8K4qLbqvzKXRtOQiKhOctxffxw@mail.gmail.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <abeceac5-5ab7-c9a4-8a6c-451c9169d597@bootlin.com>
Date: Fri, 28 May 2021 18:32:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAP71Wjy9rLUs3kF7k9jjK04p8K4qLbqvzKXRtOQiKhOctxffxw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Quentin,

On 5/27/21 9:45 PM, Nicolas Dechesne wrote:
>
>
>
> Have you checked what happens for the terms from the bitbake manual?
> Perhaps it would be better to split into 2 patches, and run with
> bitbake and without. You don't seem to add the bitbake prefix in the
> term role, right?  So we could potentially have a confusion if/when a
> term exists in both yp and bitake terms, no?


Good guess, Nico, I found at least one case where a reference to the
BitBake manual is needed instead... See below.

>
>
>         The ``SOURCE_MIRROR_URL`` and ``own-mirror``
>         class set up the system to use the downloads directory as your
>     "own
>     -   mirror". Using the ``BB_NO_NETWORK`` variable makes sure that
>     +   mirror". Using the :term:`BB_NO_NETWORK` variable makes sure that
>         BitBake's fetching process in step 3 stays local, which means
>     files
>         from your "own-mirror" are used.
>

Here, it should be substituted by ":term:`bitbake:BB_NO_NETWORK`" instead.

As far as I am concerned, I like your patch. Before it, the decision to
make a link to the variable index was a bit fuzzy, depending on how far
a previous reference to the index was made. That's probably safer this way.

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

