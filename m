Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web09.8953.1581947684692432864
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Feb 2020 05:54:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:45516 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
	(Exim 4.92)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1j3grD-004JJH-Ez
	for docs@lists.yoctoproject.org; Mon, 17 Feb 2020 08:54:43 -0500
Date: Mon, 17 Feb 2020 08:54:41 -0500 (EST)
From: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] dev-manual: mention RM_WORK_EXCLUDE with inheriting rm_work
In-Reply-To: <20200217135306.6w2lowkif7grh2ox@qschulz>
Message-ID: <alpine.LFD.2.21.2002170854290.2325805@localhost.localdomain>
References: <alpine.LFD.2.21.2002170811030.2323392@localhost.localdomain> <20200217135306.6w2lowkif7grh2ox@qschulz>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
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

On Mon, 17 Feb 2020, Quentin Schulz wrote:

> Hi Robert,
>
> On Mon, Feb 17, 2020 at 08:12:35AM -0500, rpjday@crashcourse.ca wrote:
> >
> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> >
> > ---
> >
> > diff --git a/documentation/dev-manual/dev-manual-common-tasks.xml b/documentation/dev-manual/dev-manual-common-tasks.xml
> > index 1e6addde4..721b6c719 100644
> > --- a/documentation/dev-manual/dev-manual-common-tasks.xml
> > +++ b/documentation/dev-manual/dev-manual-common-tasks.xml
> > @@ -8986,6 +8986,12 @@
> >              </literallayout>
> >              Adding this statement deletes the work directory used for building
> >              a recipe once the recipe is built.
> > +            If "rm_work" is currently selected, you can override that cleaning
> > +            on a per-recipe basis (typically for debugging purposes) by adding a
> > +            line of this form to your <filename>local.conf</filename> file:
> > +            <literallayout class='monospaced'>
> > +     RM_WORK_EXCLUDE += "busybox"
> > +            </literallayout>
> >              For more information on "rm_work", see the
> >              <ulink url='&YOCTO_DOCS_REF_URL;#ref-classes-rm-work'><filename>rm_work</filename></ulink>
> >              class in the Yocto Project Reference Manual.
> >
>
> RM_WORK_EXCLUDE is explained in the link provided just below your
> change. I'd think it's not needed to duplicate the information,
> especially because we link to it?

  fair enough.

rday
