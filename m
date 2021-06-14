Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web09.30012.1623677977859215602
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Jun 2021 06:39:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id 3046C100004;
	Mon, 14 Jun 2021 13:39:33 +0000 (UTC)
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Nicolas Dechesne <nicolas.dechesne@linaro.org>,
 "Tummalapalli, Vineela" <vineela.tummalapalli@intel.com>,
 YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: move release notes to separate document
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
References: <16872EDF3FBC0621.15202@lists.yoctoproject.org>
 <9c29810b-b20f-f752-d914-0f27f779ba2d@bootlin.com>
 <CAP71Wjyy=KM+EFt69rMg5vGJwS6xiG8tsFHfZ_eTZLhjg5vhWA@mail.gmail.com>
 <168736F45421387B.20336@lists.yoctoproject.org>
 <63f24dc7-4fbf-6543-6e1d-8eadfe3cd338@bootlin.com>
 <59c947fa6fc26b984a54b9b781367e41360a713b.camel@linuxfoundation.org>
 <3cd15f0a-5a79-13e0-d44a-e7d8872cc285@bootlin.com>
 <20210611172430.3ozoucxrbzkdtikd@qschulz>
 <16879940C9237AEB.32248@lists.yoctoproject.org>
 <4f3eab88-a3c2-f386-1cdb-f775785afe5f@bootlin.com>
 <20210614081021.zoh3ph7mgtjuui5u@qschulz>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <44a668f4-5923-bddc-992f-69c00bfb8f1c@bootlin.com>
Date: Mon, 14 Jun 2021 15:39:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210614081021.zoh3ph7mgtjuui5u@qschulz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Quentin,

On 6/14/21 10:10 AM, Quentin Schulz wrote:
> I was wondering if it made more sense to pick more expressive words for
> "current" and "previous" release manuals. Something like
> maintained/unmaintained for example? Or... EOL/outdated for the second
> kind?


Very idea. It always sounded strange to me. I could propose "maintained"
(or supported?) and "outdated" (which is shorter than "unmaintained" for
use in the left menu).

>
> Also, I would move the release number after the release name, because
> it's the place where you usually have section number in e.g. Reference
> Manual in the navigation panel.


Indeed, for the same reason, I had to prefix the title of migration
guides by "Release" to avoid this confusion.
A benefit of doing this is that we would be more consistent withe the
way the migration guides are listed.

I'll submit the two changes that you proposed.

Thanks again :-)

Michael.

-- 

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

