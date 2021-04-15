Received: from bsmtp.bon.at (bsmtp.bon.at [213.33.87.14])
 by mx.groups.io with SMTP id smtpd.web08.4765.1618480759786706485
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 02:59:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.14, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTPSA id 4FLZYv5HGsz5tlH;
	Thu, 15 Apr 2021 11:59:15 +0200 (CEST)
Date: Thu, 15 Apr 2021 11:59:14 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Paul Eggleton <bluelightning@bluelightning.org>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 12/13] ref-manual: add migration section for 3.3 release
Message-ID: <20210415095914.eqpunspm2rnpnc4v@qschulz>
References: <cover.1618358456.git.paul.eggleton@linux.microsoft.com>
 <d8b43077bf92ad403028cbf37b61c4a6349f9370.1618358456.git.paul.eggleton@linux.microsoft.com>
 <20210414082603.gmkxjpyxwnhwzzor@qschulz>
 <1712714.3VsfAaAtOV@linc>
MIME-Version: 1.0
In-Reply-To: <1712714.3VsfAaAtOV@linc>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paul,

On Thu, Apr 15, 2021 at 09:52:31PM +1200, Paul Eggleton wrote:
> Hi Quentin
> 
> Thanks for the review!
> 
> On Wednesday, 14 April 2021 20:26:03 NZST Quentin Schulz wrote:
> > On Tue, Apr 13, 2021 at 05:19:53PM -0700, Paul Eggleton wrote:
> > > +BitBake changes
> > > +---------------
> > > +
> > > +- BitBake is now configured to use a default ``umask`` of ``022`` for all
> > > tasks +  (specified via a new ``BB_DEFAULT_UMASK`` variable). If needed,
> > > ``umask`` can
> > s/``BB_DEFAULT_UMASK``/:term:`BB_DEFAULT_UMASK`/
> > 
> > IIRC, this works fine even for bitbake terms (might need some tweaking
> > if it does not work but I know we use :term: for some bitbake variables
> > from bitbake's docs).
> 
> Wow, that does work but I didn't imagine that it would. Any idea how it 
> resolves those references given that doc is not in this tree?
>  

How internally it works? No idea :)

But the few lines here are what makes it work:
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/tree/documentation/conf.py#n90

Nicolas and/or other peoples involved in the migration might be able to
tell you more, I'm not :/

"it works for me" is enough to me right now :p

[...]

> > > +  (particularly if you create your own custom distro configuration).
> > > +- The :ref:`ccache <ref-classes-ccache>` class now uses ``ccache`` from
> > > the +  build host rather than building ``ccache-native`` (due to circular
> > > +  dependencies in ccache 4.0 that are impractical to resolve otherwise),
> > > so +  if you enable it you will now need to have ``ccache`` installed on
> > > your +  host system.
> > 
> > Will a warning be shown if ccache is not installed on the host or does
> > it silently fail to use ccache?
> 
> Good question, but on further digging I found the corresponding code change 
> actually got reverted and I had missed that in my earlier sweep. Just as well 
> you asked about it :)
> 

:)

Cheers,
Quentin
