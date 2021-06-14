Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web12.27218.1623657935468898071
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Jun 2021 01:05:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id 1EAD2100002;
	Mon, 14 Jun 2021 08:05:31 +0000 (UTC)
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Nicolas Dechesne <nicolas.dechesne@linaro.org>,
 "Tummalapalli, Vineela" <vineela.tummalapalli@intel.com>,
 YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: move release notes to separate document
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
References: <1675A932C413C877.8243@lists.yoctoproject.org>
 <16872EDF3FBC0621.15202@lists.yoctoproject.org>
 <9c29810b-b20f-f752-d914-0f27f779ba2d@bootlin.com>
 <CAP71Wjyy=KM+EFt69rMg5vGJwS6xiG8tsFHfZ_eTZLhjg5vhWA@mail.gmail.com>
 <168736F45421387B.20336@lists.yoctoproject.org>
 <63f24dc7-4fbf-6543-6e1d-8eadfe3cd338@bootlin.com>
 <59c947fa6fc26b984a54b9b781367e41360a713b.camel@linuxfoundation.org>
 <3cd15f0a-5a79-13e0-d44a-e7d8872cc285@bootlin.com>
 <20210611172430.3ozoucxrbzkdtikd@qschulz>
 <16879940C9237AEB.32248@lists.yoctoproject.org>
Organization: Bootlin
Message-ID: <4f3eab88-a3c2-f386-1cdb-f775785afe5f@bootlin.com>
Date: Mon, 14 Jun 2021 10:05:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <16879940C9237AEB.32248@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Quentin,

On 6/11/21 8:04 PM, Michael Opdenacker wrote:
> HI Quentin,
>
> On 6/11/21 7:24 PM, Quentin Schulz wrote:
>> I can't. I only have a fileserver webpage on which I can click on ../
>> which redirects me to http://docs.yoctoproject.org/
> Oops, maybe because my "master-next" branch was broken until 15 minutes
> ago. This is fixed now but the autobuilder may need time to update the
> contents.
>
> Thanks for the notification.


That's fixed now if you're interested in having a look:
https://docs.yoctoproject.org/next/
I guess pushing one update wasn't enough, but that's fixed since the two
new commits that I've just merged.

Cheers,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

