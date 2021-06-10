Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.7073.1623312977686753044
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Jun 2021 01:16:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id A859860014;
	Thu, 10 Jun 2021 08:16:15 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] documentation: Makefile: turn warnings into errors by default
To: Quentin Schulz <foss@0leil.net>,
 Nicolas Dechesne <nicolas.dechesne@linaro.org>
References: <20210527183150.79497-1-foss@0leil.net>
 <08b82e87-ec3f-e713-8e0e-cf739b75efdd@bootlin.com>
 <CAP71Wjw6VH_wrEC+b3ps8CBPhQM=TDRiPtYS3=XyP4Rq1j57uA@mail.gmail.com>
 <e7954a7e45ba15362ddff609ee0cc0d4@0leil.net>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <86fdd28e-0ec7-5188-e475-48b40f34e7c4@bootlin.com>
Date: Thu, 10 Jun 2021 10:16:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <e7954a7e45ba15362ddff609ee0cc0d4@0leil.net>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Quentin,

On 5/29/21 5:04 PM, Quentin Schulz wrote:
> FWIW, this happens only for the 2+ builds, the first one works just fine.
>
> IIRC, I was using Sphinx 3.4.1 or 3.4.3, for sure not 4.x.
>
> Since we're not really supporting epub right now, does it make sense
> to fix it in this patch (or just before this patch) rather than in
> Michael's patch series (when it'll come).
>
> No objection to me doing it right now, not sure it makes the most
> sense that's it :)

Thanks for your advise. I eventually merged both patches in
"master-next", both your change and my fix. This is more convenient for
me, this way I can move on!
Cheers,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

