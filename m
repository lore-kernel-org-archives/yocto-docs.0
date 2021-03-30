Received: from bsmtp2.bon.at (bsmtp2.bon.at [213.33.87.16])
 by mx.groups.io with SMTP id smtpd.web12.135.1617118445468902021
 for <docs@lists.yoctoproject.org>;
 Tue, 30 Mar 2021 08:34:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.16, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 4F8tlZ0LGCz5tlH;
	Tue, 30 Mar 2021 17:34:01 +0200 (CEST)
Date: Tue, 30 Mar 2021 17:34:00 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 0/1] YP overview manual: style improvements
Message-ID: <20210330153400.tem5ztfbjaptmkl6@qschulz>
References: <167127D8F46CF10E.18414@lists.yoctoproject.org>
 <75714db2-fbb9-eded-0b60-a08fbe346063@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <75714db2-fbb9-eded-0b60-a08fbe346063@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Michael,

On Tue, Mar 30, 2021 at 05:27:41PM +0200, Michael Opdenacker wrote:
> Hello,
> 
> On 3/30/21 5:19 PM, Michael Opdenacker wrote:
> > Thanks in advance for your reviews!
> 
> 
> Sorry, I missed again! When I sent the e-mail to myself, both the cover
> letter and patch were on the same thread.
> 
> But, when I sent to the list, I lost that. Here's the command I used (I
> referred to "man git-send-email"):
> 
> git send-email --compose --thread --no-chain-reply --to docs@lists.yoctoproject.org 0001-YP-overview-manual-style-improvements.patch
> 

git format-patch --cover-letter <commit-hash>

(refer to man git-format-patch for the logic behind the <commit-hash>
 parameter)

Edit the cover letter manually.

git send-email --to docs@lists.yoctoproject.org *.patch

From memory, so it might be slightly different in reality.

Cheers,
Quentin
