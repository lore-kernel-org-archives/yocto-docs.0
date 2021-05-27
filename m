Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web08.5751.1622116722809074926
 for <docs@lists.yoctoproject.org>;
 Thu, 27 May 2021 04:58:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:60076 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lmEet-001u9G-Ur; Thu, 27 May 2021 07:58:40 -0400
Date: Thu, 27 May 2021 07:58:36 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: add WIC_CREATE_EXTRA_ARGS to var glossary
In-Reply-To: <20210527104715.ne4qucqip34dq44a@qschulz>
Message-ID: <efe2907f-3a21-756d-7517-43355caba62e@crashcourse.ca>
References: <bd62f84-9dbf-19e0-38af-2a36925cd71e@crashcourse.ca> <20210527104715.ne4qucqip34dq44a@qschulz>
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII

On Thu, 27 May 2021, Quentin Schulz wrote:

> On Fri, May 21, 2021 at 04:52:47PM -0400, Robert P. J. Day wrote:
> >
> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> >
> > ---
> >
> > diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> > index 0b61f77cb..1863fb21d 100644
> > --- a/documentation/ref-manual/variables.rst
> > +++ b/documentation/ref-manual/variables.rst
> > @@ -8600,6 +8600,21 @@ system and gives an overview of their function and contents.
> >        can control with this variable, see the
> >        ":ref:`insane.bbclass <ref-classes-insane>`" section.
> >
> > +   :term:`WIC_CREATE_EXTRA_ARGS`
> > +      Extra arguments to be added when running ``wic create``. Possibilities
>
> Which is run when "wic" is in "IMAGE_FSTYPES" isn't it? I guess not
> everyone explicitly calls `wic create` in their own image recipe?
>
> Would it make sense to add this notion to the doc here?

  yes, it would. coming ...

rday
