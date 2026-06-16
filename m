Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 596C4CD98E4
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 16:23:56 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1757.1781627029974419423
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Jun 2026 09:23:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=RfWDlNf5;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JaFo4rmfNk2n0lYee2Gamrt8ZO7XaOUXmC2/8BsmARE=; b=RfWDlNf56a3lM+3wdbO953XbLA
	viOqHvwdbmkKXacOzQoSFX6V1C7v558SjKeH+lqoqqHVUw433mEh96Qx17Xkwan0g/4XdNjU/zxEp
	oYoJdIMrM11lPaW4i6z8AYyqKWeHgGr6scdZUbs2kgFTkT685jmy/1N92NKwYcCQP3rGj/+fImwKl
	D3eweXX2vrttM9h+EDeYKpi6Hf+yzr3ZhXiDG5yZIHQP0Jvkd8AevWRl8cdH1mZhtUoZG/bFDEGEZ
	RDxEzGgGQgMx44FC3OISE80hIrsZPceVyH3rDhz+gEoyEHa0IGqyGAph8ZzIUycIiTUpm76ztlwYO
	8AaVZ5ow==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:45940 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wZWZn-00000007NJl-0MMO;
	Tue, 16 Jun 2026 12:23:47 -0400
Date: Tue, 16 Jun 2026 12:23:37 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: antonin.godard@bootlin.com
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: add note explaining OE will identify
 missing packages
In-Reply-To: <DJAKERB4BM4W.2GT2TON6I862L@bootlin.com>
Message-ID: <70c8cee8-bf2c-9f36-89be-6d71ac9b4baa@crashcourse.ca>
References: <0abc41e2-cf58-a97f-a3fb-711493c5686f@crashcourse.ca> <DJAKERB4BM4W.2GT2TON6I862L@bootlin.com>
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
 <docs@lists.yoctoproject.org>; Tue, 16 Jun 2026 16:23:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9758

On Tue, 16 Jun 2026, Antonin Godard via lists.yoctoproject.org wrote:

> Hi,
>
> On Tue Jun 16, 2026 at 1:15 PM CEST, Robert P. J. Day wrote:
> >
> > Add a note explaining that, if any required host tools are not
> > installed on the build host, doing a build will let the developer know
> > what they still need to install.
> >
> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> >
> > ---
> >
> > diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
> > index 5171ca6ba..829b88293 100644
> > --- a/documentation/ref-manual/system-requirements.rst
> > +++ b/documentation/ref-manual/system-requirements.rst
> > @@ -160,6 +160,17 @@ large when covering all build scenarios using the Yocto Project. This
> >  section describes required packages according to Linux distribution and
> >  function.
> >
> > +.. note::
> > +
> > +   If you don't have all of the required build packages as described below,
> > +   trying to build will almost certainly generate an error message similar to::
> > +
> > +      ERROR: The following required tools (as specified by HOSTTOOLS) appear
> > +      to be unavailable in PATH, please install them in order to proceed:
> > +        gawk
> > +
> > +   to let you know what's missing.
> > +
>
> The section is called System *Requirements*. So I think this is already implied
> by the title. And I don't think anyone would skip over some of those with a
> section title like this one.

  point taken, toss it.

rday

