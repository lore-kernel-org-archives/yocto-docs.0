Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 771BAC43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 08:44:05 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87967.1782722638526819310
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 01:43:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=RREcX0og;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Hg6tYv4ztr1bq5y40TipFASI6c6+3h/Dvb492eYdUTM=; b=RREcX0ogQeyPrf4SboneCmFoEG
	tzCEFdH/UvNrTdg/oS04iLigCoHKA0cw5WeV3Q0im4GQlMt/K4LBKrQX2tda0jASMPe4zIL74KtxJ
	M9f9bHedfIbdVIZvZkc24G/VcuF/UQEi0h6P9k2ZXseqkKEWO9EyI4n32D/Cvehm6oCOgsDJSsLHJ
	sF3ToG6rL38+qMDTCdybYvJC2JBAZIQUwZpltBY/CREiK8qdT5LKp2IJ+uFrV1qvg2APzLRYax9sk
	I9JKAKBE59RKFnQyQdKUI+0XXgA18RvmAv58D7sODG5eVTyranWVaFY5Nv9CW2nq0v+sJNn2Zmp5e
	H1RC/m0A==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:51216 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1we7au-0000000AXu6-0NOy;
	Mon, 29 Jun 2026 04:43:56 -0400
Date: Mon, 29 Jun 2026 04:43:45 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: antonin.godard@bootlin.com
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] ref manual explanation of do_configure() seems
 incomplete
In-Reply-To: <DJLDDW33JA8O.DDQ8KU4L1MYL@bootlin.com>
Message-ID: <389cc11d-b3fc-7bb1-10ac-a8e2d84b3c48@crashcourse.ca>
References: <f752867d-01b5-b9f1-3530-34cf8c4ce16c@crashcourse.ca> <DJLDDW33JA8O.DDQ8KU4L1MYL@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-137966460-1782722625=:1730316"
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
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:44:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9964

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-137966460-1782722625=:1730316
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 29 Jun 2026, Antonin Godard via lists.yoctoproject.org wrote:

> Hi,
>
> On Fri Jun 26, 2026 at 6:16 PM CEST, Robert P. J. Day wrote:
> >
> >   (currently poring over ref manual "tasks" section, will ask about
> > whatever seems confusing.)
> >
> > here:
> >
> > https://docs.yoctoproject.org/ref-manual/tasks.html#do-configure
> >
> > one reads:
> >
> > "The default behavior of this task is to run oe_runmake clean if a
> > makefile (Makefile, makefile, or GNUmakefile) is found and CLEANBROKEN
> > is not set to “1”. If no such file is found or the CLEANBROKEN
> > variable is set to “1”, the do_configure task does nothing."
> >
> >   if you check the task definition:
> >
> > https://git.openembedded.org/openembedded-core/tree/meta/classes-global/base.bbclass#n379
> >
> > it seems that even if that test fails, there might still be some
> > subsequent processing, so stating that it will do "nothing" seems
> > potentially misleading.
>
> What would you suggest instead of "does nothing"? It seems
> irrelevant to go in details about the next steps taken in the task.

  i don't know but, based on the task definition, it certainly appears
that *something* might happen. or just leave it the way it is.

rday
--8323329-137966460-1782722625=:1730316--

