Received: from linuxplesk15.openhost.net.nz (linuxplesk15.openhost.net.nz [119.47.118.83])
 by mx.groups.io with SMTP id smtpd.web09.4662.1618480356408091577
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 02:52:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 119.47.118.83, mailfrom: bluelightning@bluelightning.org)
Received: from linc.localnet (unknown [151.210.226.152])
	by linuxplesk15.openhost.net.nz (Postfix) with ESMTPSA id 0820CA2DD1;
	Thu, 15 Apr 2021 21:52:32 +1200 (NZST)
Authentication-Results: linuxplesk15.openhost.net.nz;
	spf=pass (sender IP is 151.210.226.152) smtp.mailfrom=bluelightning@bluelightning.org smtp.helo=linc.localnet
Received-SPF: pass (linuxplesk15.openhost.net.nz: connection is authenticated)
From: "Paul Eggleton" <bluelightning@bluelightning.org>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 12/13] ref-manual: add migration section for 3.3 release
Date: Thu, 15 Apr 2021 21:52:31 +1200
Message-ID: <1712714.3VsfAaAtOV@linc>
In-Reply-To: <20210414082603.gmkxjpyxwnhwzzor@qschulz>
References: <cover.1618358456.git.paul.eggleton@linux.microsoft.com>
	<d8b43077bf92ad403028cbf37b61c4a6349f9370.1618358456.git.paul.eggleton@linux.microsoft.com>
	<20210414082603.gmkxjpyxwnhwzzor@qschulz>
MIME-Version: 1.0
X-PPP-Message-ID: <20210415095232.3882469.64404@localhost6.localdomain6>
X-PPP-Vhost: softec.co.nz
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Quentin

Thanks for the review!

On Wednesday, 14 April 2021 20:26:03 NZST Quentin Schulz wrote:
> On Tue, Apr 13, 2021 at 05:19:53PM -0700, Paul Eggleton wrote:
> > +BitBake changes
> > +---------------
> > +
> > +- BitBake is now configured to use a default ``umask`` of ``022`` for all
> > tasks +  (specified via a new ``BB_DEFAULT_UMASK`` variable). If needed,
> > ``umask`` can
> s/``BB_DEFAULT_UMASK``/:term:`BB_DEFAULT_UMASK`/
> 
> IIRC, this works fine even for bitbake terms (might need some tweaking
> if it does not work but I know we use :term: for some bitbake variables
> from bitbake's docs).

Wow, that does work but I didn't imagine that it would. Any idea how it 
resolves those references given that doc is not in this tree?
 
> > +- ``iproute2``: split ip binary to its own package
> 
> s/ip/``ip``/

Well spotted! Fixed.
 
> > +- The default poky :term:`DISTRO_VERSION` value now uses the core
> > metadata's +  git hash (i.e. :term:`METADATA_REVISION`) rather than the
> > date (i.e. +  :term:`DATE`) to reduce one small source of
> > non-reproducibility. You can +  of course specify your own
> > ``DISTRO_VERSION`` value as desired
> 
> s/``DISTRO_VERSION``/:term:`DISTRO_VERSION`/

Fixed.
 
> > +  (particularly if you create your own custom distro configuration).
> > +- The :ref:`ccache <ref-classes-ccache>` class now uses ``ccache`` from
> > the +  build host rather than building ``ccache-native`` (due to circular
> > +  dependencies in ccache 4.0 that are impractical to resolve otherwise),
> > so +  if you enable it you will now need to have ``ccache`` installed on
> > your +  host system.
> 
> Will a warning be shown if ccache is not installed on the host or does
> it silently fail to use ccache?

Good question, but on further digging I found the corresponding code change 
actually got reverted and I had missed that in my earlier sweep. Just as well 
you asked about it :)

I've incorporated all of your other feedback and will send a new series 
imminently.

Cheers
Paul


