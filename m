Received: from bsmtp1.bon.at (bsmtp1.bon.at [213.33.87.15])
 by mx.groups.io with SMTP id smtpd.web10.11303.1610038796599042713
 for <docs@lists.yoctoproject.org>;
 Thu, 07 Jan 2021 08:59:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.15, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp1.bon.at (Postfix) with ESMTPSA id 4DBXXT1QTDz5tlL;
	Thu,  7 Jan 2021 17:59:53 +0100 (CET)
Date: Thu, 7 Jan 2021 17:59:51 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>,
	Robert Berger <robert.berger@reliableembeddedsystems.com>
Subject: Re: [docs] broken links
Message-ID: <20210107165951.aqx4maful2uhopzx@qschulz>
References: <CAP71Wjw3T0XKPxVH59J_fGpBmB+qJ6GyKowOPqa8CGOZ2e8OmQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP71Wjw3T0XKPxVH59J_fGpBmB+qJ6GyKowOPqa8CGOZ2e8OmQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nicolas,

On Thu, Jan 07, 2021 at 05:52:49PM +0100, Nicolas Dechesne wrote:
> hey!
> 
> Robert opened a bug for a broken link in the doc, see
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=14168
> 
> This is a valid bug, a regression in
> e1bcfe4d8 dev-manual: remove unused labels
> 
> Unfortunately, it opens a can of worms... since it looks like the built in
> linkcheck did not detect the broken links, and this is not the only broken
> link.
> 
> I ran an online link checker on
> https://docs.yoctoproject.org/dev-manual/common-tasks.html, and it reported
> the following errors with anchors.. they look like they are regression with
> the commit above..
> 

[...]

It'd be nice to fix the linkcheck indeed.

I have on my todolist to remove all anchor links to use refs instead but it's
not fun work to do and it's time consuming. I can now probably "automate"
all of this with some python regexp and manually fix the ones returned
by your online link checker :) (and use the online link checker to
validate the changes).

I'd then add in the README/CONTRIBUTING that we do not allow such links
and we have to be careful to enforce this when receiving patches.

All this in the event that we can't find what's wrong with our
linkcheck.

Cheers,
Quentin
