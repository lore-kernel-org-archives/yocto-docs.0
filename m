Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web09.9678.1618385675472952588
 for <docs@lists.yoctoproject.org>;
 Wed, 14 Apr 2021 00:34:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 92.150.42.106
Received: from [10.0.0.9] (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 1D4CD240010;
	Wed, 14 Apr 2021 07:34:31 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>,
 "Robert P. J. Day" <rpjday@crashcourse.ca>,
 "Tummalapalli, Vineela" <vineela.tummalapalli@intel.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [docs] ref-manual: reverse the order of migration guides?
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
 Paul Eggleton <bluelightning@bluelightning.org>
References: <7ff7831f-4539-8e5c-cfc6-d081651374f2@bootlin.com>
 <4706379.0VBMTVartN@linc>
 <CAP71WjzS-a9MNtyDeOwDV6oqhp8mNpNWmnoeuUyf2w_Qu+t2gg@mail.gmail.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <274c25bd-700e-2ab1-22b5-c074b9d9fd4d@bootlin.com>
Date: Wed, 14 Apr 2021 09:34:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAP71WjzS-a9MNtyDeOwDV6oqhp8mNpNWmnoeuUyf2w_Qu+t2gg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Greetings,

On 4/14/21 7:33 AM, Nicolas Dechesne wrote:
>
>
> On Wed, Apr 14, 2021 at 2:15 AM Paul Eggleton
> <bluelightning@bluelightning.org
> <mailto:bluelightning@bluelightning.org>> wrote:
>
>
>
>     I guess the thinking was that you would start at the point in the
>     documentation where you are currently at and then follow it
>     downwards to the
>     current version. Whether that's the most logical I'm not sure, but
>     if we're
>     changing it we should give some thought to how it will be used.
>     People do
>     often go a while between upgrades, but I'll definitely agree 1.3
>     is much
>     further back than most people would need.
>
>     Robert suggests moving it out, I'm wondering if it's worth
>     considering going a
>     step further and turning our release notes into a proper document,
>     to which
>     this content would be added - I've often felt that the current
>     text-only
>     format is a bit restrictive. That would mean there would be a
>     separate
>     document per release, which is how many other software packages do
>     it (e.g.
>     Django). However, I'm not sure if that would cause us too much
>     overhead or
>     hassle with the other places where we currently post the release
>     notes e.g.
>     announcements on the mailing list - thoughts? (For clarity I
>     wouldn't propose
>     changing this until the next release.)
>
>
> I have had this thought already, and like it! Especially now that we
> have a 'unified' doc website, having a 'release notes' manual/section
> in the left side navigation bar would be good. Here is an example I
> have seen with another project:
> https://projectacrn.github.io/latest/release_notes/index.html
> <https://projectacrn.github.io/latest/release_notes/index.html>


I definitely vote for this. This would make our documentation much
easier to use.

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

