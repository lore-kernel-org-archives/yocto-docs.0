Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web11.11640.1619095808922014238
 for <docs@lists.yoctoproject.org>;
 Thu, 22 Apr 2021 05:50:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: from [10.0.0.8] (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id B127D100008;
	Thu, 22 Apr 2021 12:50:06 +0000 (UTC)
Cc: michael.opdenacker@bootlin.com
Subject: Re: [docs] Vector sources for the manual figures ?
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: <7f2f05a5-7492-ff74-e756-09937f59643f@bootlin.com>
 <7f0f5f4c9bb5bc35972dc6db560c30247c48099c.camel@linuxfoundation.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <9856a0ec-7175-08b8-4185-93c865ccec20@bootlin.com>
Date: Thu, 22 Apr 2021 14:50:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <7f0f5f4c9bb5bc35972dc6db560c30247c48099c.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Richard,

On 4/22/21 11:13 AM, Richard Purdie wrote:
> Over time we may want to look at rebuilding them but other than the older
> architecture diagram, I think we would have to rebuild.

Indeed, we can do this progressively. Fortunately this is not such a big
deal some of the diagrams are not so difficult to reconstitute. We can
also take this as an opportunity to update the diagrams and make them
more consistent in the way they look.

>
> I know there was an issue reported with a diagram recently and I ended up
> editing a few pixels by hand!

Let me know next time you have to do this. This will be a perfect excuse
to re-create SVG sources.

Thanks,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

