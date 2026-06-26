Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BDD8CD4F26
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 08:08:58 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30836.1782461334658259295
 for <docs@lists.yoctoproject.org>;
 Fri, 26 Jun 2026 01:08:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=N327o8GP;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=AL/37zk248iNmzCSh47Rp8QGLuUPlEDfBJ8c7JJTZFE=; b=N327o8GPLyH39p9V/3ns5GB1f0
	pspGHTn8RaA/gGAkN3stCTbi3xUi3UkaGavB1194bDO6Sk8NzQiCwmNdJeM62FX8e3caxv+8rJLwI
	FGTLnHCmIXWhgnMwgW6cyP4rcaGmo2trN3Oe6J716rkysiEHVEuRgxyqLJF9rEVFloRzUnggYIzdX
	mYioRie2ZWKDshBy6lO9VQeFi8CHaQt30S3dPkkE+jpTITk3n67uq00XMecIul+2PYih/1HQd3s1y
	EUTzCFppBUmsTHD50scqK3WK4STmn7xjZZdzTunSaSvOzyWS4mf0Htn4rDCdY8mm9HuLHrlv57B2X
	sg1eUSrw==;
Received: from bras-base-otwaon0916w-grc-51-67-71-147-190.dsl.bell.ca ([67.71.147.190]:44616 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wd1cI-00000002YDk-3feS;
	Fri, 26 Jun 2026 04:08:53 -0400
Date: Fri, 26 Jun 2026 04:08:36 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: antonin.godard@bootlin.com
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: add more explanation for ptest-related
 tasks
In-Reply-To: <DJITHTKC9E7R.GL4SZH0CH92V@bootlin.com>
Message-ID: <33965c87-f365-475d-4505-a35a1265f09e@crashcourse.ca>
References: <f164c2a2-623b-a0b9-f0a9-de488e3c90b8@crashcourse.ca> <DJITHTKC9E7R.GL4SZH0CH92V@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 26 Jun 2026 08:08:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9903

On Fri, 26 Jun 2026, Antonin Godard via lists.yoctoproject.org wrote:

> Hi,
>
> On Thu Jun 25, 2026 at 5:42 PM CEST, Robert P. J. Day wrote:
> [...]
> >  ``do_install_ptest_base``
> >  -------------------------
> >
> > -Copies the runtime test suite files from the compilation directory to a
> > -holding area.
> > +As defined in the :ref:`ref-classes-ptest` class, this task contains generic
> > +installation code that will be invoked for all ptest-enabled recipes to
> > +install the associated ptest package::
> > +
> > +   do_install_ptest_base() {
> > +      if [ -f ${UNPACKDIR}/run-ptest ]; then
> > +         install -D ${UNPACKDIR}/run-ptest ${D}${PTEST_PATH}/run-ptest
> > +      fi
> > +
> > +      grep -q install-ptest: Makefile 2>/dev/null && oe_runmake DESTDIR=${D}${PTEST_PATH} install-ptest
> > +
> > +      do_install_ptest
> > +
> > +      ... snip ...
> > +
> > +   }
>
> I am reluctant to include copy-pasted code-snippets from OE-Core,
> they change over time and add maintenance burden. Can you remove it?

  i was thinking the same thing even as i pasted that code in there,
so i will simplify it to show only that do_install_ptest_base() calls
do_install_ptest(), which is not likely to change and is the whole
point of that explanation.

rday

