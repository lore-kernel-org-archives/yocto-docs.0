Received: from bsmtp3.bon.at (bsmtp3.bon.at [213.33.87.17])
 by mx.groups.io with SMTP id smtpd.web11.9468.1623252577306956200
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Jun 2021 08:29:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.17, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp3.bon.at (Postfix) with ESMTPSA id 4G0WHf2fCsz5tlD;
	Wed,  9 Jun 2021 17:29:34 +0200 (CEST)
Date: Wed, 9 Jun 2021 17:29:33 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2] test-manual: add initial reproducible builds documentation
Message-ID: <20210609152933.x6lo7vscjarmmq4j@qschulz>
References: <16868CB8BF8EEF84.10003@lists.yoctoproject.org>
 <20210608095853.48522-1-michael.opdenacker@bootlin.com>
 <20210609091143.vvykg2irov6wcbdu@qschulz>
 <bd3a88e611ed0de758eafd6928e2ee077b4861d5.camel@linuxfoundation.org>
 <28479020-8064-dd56-d73f-c8482e9f2b46@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <28479020-8064-dd56-d73f-c8482e9f2b46@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 09, 2021 at 04:18:20PM +0200, Michael Opdenacker wrote:
> Quentin, Richard,
> 
> Thank you for your reviews and answers...
> 
> On 6/9/21 11:23 AM, Richard Purdie wrote:
> > On Wed, 2021-06-09 at 11:11 +0200, Quentin Schulz wrote:
> >> Hi Michael, Richard,
> >>
> >> On Tue, Jun 08, 2021 at 11:58:53AM +0200, Michael Opdenacker wrote:
> >>> From: Richard Purdie <richard.purdie@linuxfoundation.org>
[...]
> >>
> >> Also, I think we use dashes more than asterisks for lists?
> 
> Oops, the result seems to be the same, but yes, that's our standard.
> Fixed. Do you know why dashes where chosen over lists?
> 

Probably the migration tool? But no, no idea. One more rule to put in
the theoretical CONTRIBUTING file :p

Cheers,
Quentin
