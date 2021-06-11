Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web11.6396.1623406388634704569
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Jun 2021 03:13:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id 4282B100004;
	Fri, 11 Jun 2021 10:13:05 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: move release notes to separate document
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Nicolas Dechesne <nicolas.dechesne@linaro.org>,
 "Tummalapalli, Vineela" <vineela.tummalapalli@intel.com>
References: <1675A932C413C877.8243@lists.yoctoproject.org>
 <16872EDF3FBC0621.15202@lists.yoctoproject.org>
 <9c29810b-b20f-f752-d914-0f27f779ba2d@bootlin.com>
 <CAP71Wjyy=KM+EFt69rMg5vGJwS6xiG8tsFHfZ_eTZLhjg5vhWA@mail.gmail.com>
 <168736F45421387B.20336@lists.yoctoproject.org>
 <63f24dc7-4fbf-6543-6e1d-8eadfe3cd338@bootlin.com>
 <59c947fa6fc26b984a54b9b781367e41360a713b.camel@linuxfoundation.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <3cd15f0a-5a79-13e0-d44a-e7d8872cc285@bootlin.com>
Date: Fri, 11 Jun 2021 12:13:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <59c947fa6fc26b984a54b9b781367e41360a713b.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Richard,

On 6/11/21 11:15 AM, Richard Purdie wrote:
>
>> Another question is whether "Release notes" is the right title for these
>> migration guides, at least in the left menu. Shouldn't we just call them
>> "Release migration guides" as they truly are, knowing that the true
>> release notes are on
>> https://www.yoctoproject.org/software-overview/downloads/?
> Yes, they're migration guides, the release notes are something different.


Right, thanks for confirming.
I updated my branch and you can see the result on
http://docs.yoctoproject.org/next/

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

