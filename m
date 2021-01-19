Received: from bsmtp3.bon.at (bsmtp3.bon.at [213.33.87.17])
 by mx.groups.io with SMTP id smtpd.web10.12666.1611070298352920682
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Jan 2021 07:31:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.17, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp3.bon.at (Postfix) with ESMTPSA id 4DKt0t2B4wz5tlR;
	Tue, 19 Jan 2021 16:31:26 +0100 (CET)
Date: Tue, 19 Jan 2021 16:31:24 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: docs <docs@lists.yoctoproject.org>
Subject: Re: [docs] PROVIDES inconsistency
Message-ID: <20210119153124.vayhbc6om4dj6uj6@qschulz>
References: <de6c282b93e701bbd5d8b8bd1da6125c1cb6d38c.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <de6c282b93e701bbd5d8b8bd1da6125c1cb6d38c.camel@linuxfoundation.org>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Richard,

On Tue, Jan 19, 2021 at 03:27:11PM +0000, Richard Purdie wrote:
> Hi,
> 
> On irc it was pointed out we have an inconsistency in the documentation of PROVIDES:
> 
> https://docs.yoctoproject.org/ref-manual/ref-variables.html#term-PROVIDES
> 
> https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-ref-variables.html#term-PROVIDES
> 
> One says don't use +=, the other uses it as an example.
> 
> We should probably decide on which and clarify the manual.
> 
> In many ways I prefer encouraging users to use "+=" rather than setting
> plain "=".
> 

+= all the way.

Even if your recipe sets PROVIDES = "test123test", bitbake (Yocto?) will
add ${PN} to it (otherwise recipes without PROVIDES would just flat out
fail to be found by the DEPENDS mechanism).

It's less confusing if you have PROVIDES +=, showing that there's
actually already a value set for it.

Cheers,
Quentin
