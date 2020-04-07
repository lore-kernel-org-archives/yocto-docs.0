Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web12.5849.1586252144371414446
 for <docs@lists.yoctoproject.org>;
 Tue, 07 Apr 2020 02:35:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:49488 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jLkdy-00HZXi-D9
	for docs@lists.yoctoproject.org; Tue, 07 Apr 2020 05:35:43 -0400
Date: Tue, 7 Apr 2020 05:35:40 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] dev-manual: reverse "=" and "+=" for IMAGE_FEATURES
In-Reply-To: <947bafddeda147cab3b2c55921fb9eeb@XBOX03.axis.com>
Message-ID: <alpine.LFD.2.21.2004070511280.3895@localhost.localdomain>
References: <alpine.LFD.2.21.2004061631560.10956@localhost.localdomain> <947bafddeda147cab3b2c55921fb9eeb@XBOX03.axis.com>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-0.2
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel7.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel7.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel7.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII

On Tue, 7 Apr 2020, Peter Kjellerstedt wrote:

> You probably want += in both cases. Also, adding to IMAGE_FEATURES is
> more appropriately done in an image recipe, while adding to
> EXTRA_IMAGE_FEATURES is typically done in the local.conf, so:
>
>             <para>
>                 To create the read-only root filesystem, simply add the
>                 "read-only-rootfs" feature to your image.
>                 Either add the following statement to your image recipe:
>                 <literallayout class='monospaced'>
>      IMAGE_FEATURES += "read-only-rootfs"
>                 </literallayout>
>                 or add the following statement to the
>                 <filename>local.conf</filename> file found in the
>                 <ulink url='&YOCTO_DOCS_REF_URL;#build-directory'>Build Directory</ulink>:
>                 <literallayout class='monospaced'>
>      EXTRA_IMAGE_FEATURES += "read-only-rootfs"
>                 </literallayout>
>             </para>
>
> //Peter

  i would disagree with your second position just from a stylistic
point of view, as there are variables in OE where the base form (VAR)
is normally set in a recipe file, while there is the additional form
EXTRA_VAR that is specifically meant to be just *set* in your
local.conf, knowing that the underlying logic will do the right thing
with it and you don't need to worry about "+=" versus "_append", which
is exactly what EXTRA_IMAGE_FEATURES is for.

  yes, using += with EXTRA_IMAGE_FEATURES will work just fine, but it
sort of defeats the purpose of having invented it in the first place.
i would, however, incorporate your additional explanation to make all
of this more obvious. v2 coming shortly ...

> > -----Original Message-----
> > From: docs@lists.yoctoproject.org <docs@lists.yoctoproject.org> On Behalf
> > Of rpjday@crashcourse.ca
> > Sent: den 6 april 2020 22:33
> > To: YP docs mailing list <docs@lists.yoctoproject.org>
> > Subject: [docs] [PATCH] dev-manual: reverse "=" and "+=" for
> > IMAGE_FEATURES
> >
> > Pretty sure these assignments are in the reverse order.
> >
> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> >
> > ---
> >
> > diff --git a/documentation/dev-manual/dev-manual-common-tasks.xml
> > b/documentation/dev-manual/dev-manual-common-tasks.xml
> > index 2b8868b62..b9d527486 100644
> > --- a/documentation/dev-manual/dev-manual-common-tasks.xml
> > +++ b/documentation/dev-manual/dev-manual-common-tasks.xml
> > @@ -11202,11 +11202,11 @@
> >                  <ulink url='&YOCTO_DOCS_REF_URL;#build-directory'>Build
> > Directory</ulink>
> >                  causes the build system to create a read-only root
> > filesystem:
> >                  <literallayout class='monospaced'>
> > -     IMAGE_FEATURES = "read-only-rootfs"
> > +     IMAGE_FEATURES += "read-only-rootfs"
> >                  </literallayout>
> >                  or
> >                  <literallayout class='monospaced'>
> > -     EXTRA_IMAGE_FEATURES += "read-only-rootfs"
> > +     EXTRA_IMAGE_FEATURES = "read-only-rootfs"
> >                  </literallayout>
> >              </para>
> >
> >
> > --
> >
> > ========================================================================
> > Robert P. J. Day                                 Ottawa, Ontario, CANADA
> >                          http://crashcourse.ca
> >
> > Twitter:                                       http://twitter.com/rpjday
> > LinkedIn:                               http://ca.linkedin.com/in/rpjday
> > ========================================================================
>

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
