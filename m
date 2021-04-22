Received: from bsmtp3.bon.at (bsmtp3.bon.at [213.33.87.17])
 by mx.groups.io with SMTP id smtpd.web12.174.1619109000411298202
 for <docs@lists.yoctoproject.org>;
 Thu, 22 Apr 2021 09:30:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.17, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp3.bon.at (Postfix) with ESMTPSA id 4FR2vS0cvmz5tlB;
	Thu, 22 Apr 2021 18:29:55 +0200 (CEST)
Date: Thu, 22 Apr 2021 18:29:54 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Trevor Gamblin <trevor.gamblin@windriver.com>,
	docs@lists.yoctoproject.org
Subject: Re: [docs][PATCH] ref-manual/variables.rst: Add incompatibility warning for SERIAL_CONSOLES_CHECK
Message-ID: <20210422162954.aihz7eevpltsjf7j@qschulz>
References: <20210422154853.2102019-1-trevor.gamblin@windriver.com>
 <f487889b-45a9-78a8-7587-35fdd3cc7bfc@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <f487889b-45a9-78a8-7587-35fdd3cc7bfc@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 22, 2021 at 06:16:16PM +0200, Michael Opdenacker wrote:
> Hi Trevor,
> 
> Thanks for your patch!
> 
> On 4/22/21 5:48 PM, Trevor Gamblin wrote:
> > See https://bugzilla.yoctoproject.org/show_bug.cgi?id=13921
> 
> I actually replaced this by
> 
> See [YOCTO #13921]
> 
> >  documentation/ref-manual/variables.rst | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> > index 74ac12bf9..7a87d219d 100644
> > --- a/documentation/ref-manual/variables.rst
> > +++ b/documentation/ref-manual/variables.rst
> > @@ -6929,7 +6929,11 @@ system and gives an overview of their function and contents.
> >           SERIAL_CONSOLES_CHECK = "slcp_line0:ttyS0"
> >  
> >        This variable is currently only supported with SysVinit (i.e. not
> > -      with systemd).
> > +      with systemd). Note that SERIAL_CONSOLES_CHECK also requires
> > +      /etc/inittab to be writable when used with SysVinit. This makes it
> > +      incompatible with customizations such as the following: ::
> 
> 
> Actually, we now recommend to just use "::" at the end of the line.
> That's equivalent and we've made a tree-wide change for this change.
> 
> I took care of updating this too. Looking good to me otherwise.
> 
> Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> I will merge this in "master-next" tomorrow if nobody objects.
> 

s/SERIAL_CONSOLES_CHECK/:term:`SERIAL_CONSOLES_CHECK`/
s/\/etc\/inittab/``\/etc\/inittab``/

Pondering if we should double tick quote SysVinit and systemd but since
these were not changed in the commit, does not matter for this to be
merged :)

Cheers,
Quentin
