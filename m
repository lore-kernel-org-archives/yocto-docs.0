Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.1143.1623434693376168491
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Jun 2021 11:04:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 35AC220004;
	Fri, 11 Jun 2021 18:04:50 +0000 (UTC)
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Nicolas Dechesne <nicolas.dechesne@linaro.org>,
 "Tummalapalli, Vineela" <vineela.tummalapalli@intel.com>,
 YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: move release notes to separate document
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
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <33cf1ae5-5fa9-eabf-c2fa-13d3fe2d7284@bootlin.com>
Date: Fri, 11 Jun 2021 20:04:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210611172430.3ozoucxrbzkdtikd@qschulz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

HI Quentin,

On 6/11/21 7:24 PM, Quentin Schulz wrote:
> I can't. I only have a fileserver webpage on which I can click on ../
> which redirects me to http://docs.yoctoproject.org/

Oops, maybe because my "master-next" branch was broken until 15 minutes
ago. This is fixed now but the autobuilder may need time to update the
contents.

Thanks for the notification.

Cheers,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

