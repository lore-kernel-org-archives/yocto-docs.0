Received: from bsmtp1.bon.at (bsmtp1.bon.at [213.33.87.15])
 by mx.groups.io with SMTP id smtpd.web08.227.1617118602163904874
 for <docs@lists.yoctoproject.org>;
 Tue, 30 Mar 2021 08:36:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.15, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp1.bon.at (Postfix) with ESMTPSA id 4F8tpb2bv1z5tlH;
	Tue, 30 Mar 2021 17:36:39 +0200 (CEST)
Date: Tue, 30 Mar 2021 17:36:38 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 0/1] YP overview manual: style improvements
Message-ID: <20210330153638.xgbtnl7zenp36wb5@qschulz>
References: <167127D8F46CF10E.18414@lists.yoctoproject.org>
 <75714db2-fbb9-eded-0b60-a08fbe346063@bootlin.com>
 <167128A8C71457FE.21770@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <167128A8C71457FE.21770@lists.yoctoproject.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 30, 2021 at 05:34:00PM +0200, Quentin Schulz wrote:
> Hi Michael,
> 
> On Tue, Mar 30, 2021 at 05:27:41PM +0200, Michael Opdenacker wrote:
> > Hello,
> > 
> > On 3/30/21 5:19 PM, Michael Opdenacker wrote:
> > > Thanks in advance for your reviews!
> > 
> > 
> > Sorry, I missed again! When I sent the e-mail to myself, both the cover
> > letter and patch were on the same thread.
> > 

They seem to be on the same mail thread in my mail client, not sure if
anyone else than you has the issue?

It is possible your mail client is confused because git send-email will
add yourself to the recipients (since you're the author and added your
SoB), so you might receive the mail twice, once from the mailing list,
once "from" git send-email (your own mail server reading the recipients
basically).

Quentin
