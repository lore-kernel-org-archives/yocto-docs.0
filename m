Received: from bsmtp1.bon.at (bsmtp1.bon.at [213.33.87.15])
 by mx.groups.io with SMTP id smtpd.web10.96.1618505734006232872
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 09:55:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.15, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp1.bon.at (Postfix) with ESMTPSA id 4FLlpC1w9Kz5tlD;
	Thu, 15 Apr 2021 18:55:31 +0200 (CEST)
Date: Thu, 15 Apr 2021 18:55:30 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] manuals: simplify colon usage
Message-ID: <20210415165530.udervizadnby6v6w@qschulz>
References: <167613DD803B4636.18329@lists.yoctoproject.org>
 <c0301119-4642-4f26-ce90-71679c433a40@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <c0301119-4642-4f26-ce90-71679c433a40@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 15, 2021 at 06:14:33PM +0200, Michael Opdenacker wrote:
> 
> On 4/15/21 6:09 PM, Michael Opdenacker wrote:
> > - This replaces instances of ": ::" by "::", which
> >   generates identical HTML output
> 

Could you explain how you did the changes? I'm pretty sure you are not
crazy enough to do all those changes by hand :)

Just add the command you used when you use automation for things in the
docs.

I'm not sure I'd actually ask for a v2 just for that, so... up to you :)

Cheers,
Quentin
