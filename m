Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90200C4167D
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 14:52:48 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.33254.1698936765149126276
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Nov 2023 07:52:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Mee2H3kC;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7/kCBnL+QfYdmLD7d+npccHuPghslu4RJRi+A8BCCHI=; b=Mee2H3kCo1UtbiVANxoHbsDpAa
	8/HEctU0XRAXklrXdNrZCRUGUMu7WOvEh/uBerfO60sdKPugukmu3i+WM1mivYjwW0EE9/lCBOxr8
	5VU/EuLE7IxR3rXcxw8FNAScU3j07auqFt9iEERcwL+gPScLdisk0S3RL+j4e/h7D7PYKS1kTEl/M
	HfMC4OaWN/mh/QdE11hJWwrm47HfUK9yCS1rFuz9vs/Dqx6om8/n12GXUIAXwwFrME54WS59POD2g
	zE1tvvJ4Yhzu/ST4nV/CeFEuh7ZpkWfg1Vn7ZODcztL+HJztHcM15NoPuDqWLZEmgOKzmEbo0S2ad
	ryzrfJIQ==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:33362 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1qyZ3j-00GWw0-2t;
	Thu, 02 Nov 2023 10:52:43 -0400
Date: Thu, 2 Nov 2023 10:52:30 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: =?ISO-8859-15?Q?Ulrich_=D6lmann?= <u.oelmann@pengutronix.de>
cc: michael.opdenacker@bootlin.com, Bruce Ashfield <bruce.ashfield@gmail.com>, 
    "Michael Opdenacker via lists.yoctoproject.org" <michael.opdenacker=bootlin.com@lists.yoctoproject.org>, 
    docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual: document KERNEL_LOCALVERSION
In-Reply-To: <6rjzr0tr2h.fsf@pengutronix.de>
Message-ID: <44d9c528-fceb-928-421f-e8b26cb1f3@crashcourse.ca>
References: <20231027092935.1601588-1-michael.opdenacker@bootlin.com> <6rjzr0tr2h.fsf@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-482027481-1698936758=:147133"
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 Nov 2023 14:52:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4573

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-482027481-1698936758=:147133
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Thu, 2 Nov 2023, Ulrich Ölmann wrote:

> Hi Michael,
>
> just a small typo, otherwise a good description.
>
> On Fri, Oct 27 2023 at 11:29 +0200, "Michael Opdenacker via lists.yoctoproject.org" <michael.opdenacker=bootlin.com@lists.yoctoproject.org> wrote:
> > From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> >
> > Introduced by
> > https://git.yoctoproject.org/poky/commit/?id=66ed174ccdf7a89cb998f503cc6b631e2d1adcc0
> >
> > Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> > CC: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >  documentation/ref-manual/variables.rst | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> > index 03234d3f78..771eb91af6 100644
> > --- a/documentation/ref-manual/variables.rst
> > +++ b/documentation/ref-manual/variables.rst
> > @@ -2485,6 +2485,16 @@ system and gives an overview of their function and contents.
> >        external tools. See the :ref:`ref-classes-kernel-yocto` class in
> >        ``meta/classes-recipe`` to see how the variable is used.
> >
> > +   :term:`KERNEL_LOCALVERSION`
> > +      This variable allows to appends a string to the version
>
> s/appends/append/

  i don't like that variation either ... why not just "allows
appending". or, better yet, "supports appending"?

rday
--8323328-482027481-1698936758=:147133--

