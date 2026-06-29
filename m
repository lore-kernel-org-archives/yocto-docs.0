Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65F06C43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 08:42:45 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33444.1782722560896092669
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 01:42:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=q4xWUq3N;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jwQ7rqa/AC9fjBxe7EsdRY41DonGCfg4rwtR62Zw1so=; b=q4xWUq3NJEYuogLpwYnq7j/TcR
	vSRAdjm+WVrYfIehZzna3dMK4/c+rhKM3KTtOVCOqlw9eghJNoi5M9BBwA6T42OpPUXq+Ywe8VcsL
	8wFwZ0H+woAXk6qnpMZkGiOxGWpcGC7aynwAwyqfBfhNTFV1O8XjYGiQAixLQEIh7vcDp3v5/cjQR
	SdvZr/ulh05BrtWvXxTjMqy7nuoNzq4Rd4FjIOo9Rs2f31XpIl59qgnfgiFPbFzNe6hpvINvJBlW8
	phWWaiahhWh/ji6lkTn69deX8PU4a0OrHftLDFvbyWj6vnjLnNHUO5SGkrZVqF3ZHCom4zdJs70Sl
	B8fSRg2Q==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:33524 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1we7Ze-0000000AXZn-2DM7;
	Mon, 29 Jun 2026 04:42:39 -0400
Date: Mon, 29 Jun 2026 04:42:15 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: antonin.godard@bootlin.com
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: add intro content to Ref Manual
 "Tasks" section
In-Reply-To: <DJLDC44CFJYL.1C6ACT3B4ATW6@bootlin.com>
Message-ID: <592e8b31-4742-2935-5d4d-e5173b5efe14@crashcourse.ca>
References: <be80b3e5-3887-e388-cf4d-8c947775c10f@crashcourse.ca> <DJLDC44CFJYL.1C6ACT3B4ATW6@bootlin.com>
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
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:42:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9963

On Mon, 29 Jun 2026, Antonin Godard via lists.yoctoproject.org wrote:

> Hi,
>
> On Fri Jun 26, 2026 at 11:11 AM CEST, Robert P. J. Day wrote:
> >
> > As in done in the "Classes" section, add a couple paragraphs to
> > explain how the developer can examine the tasks for a recipe.
> >
> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> >
> > ---
> >
> > diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
> > index e6301e708..7c8bd0a82 100644
> > --- a/documentation/ref-manual/tasks.rst
> > +++ b/documentation/ref-manual/tasks.rst
> > @@ -9,6 +9,35 @@ tasks to complete configuring, compiling, and packaging software. This
> >  chapter provides a reference of the tasks defined in the OpenEmbedded
> >  build system.
> >
> > +To see the tasks defined (in alphabetical order) for a given recipe,
> > +you can run:
> > +
> > +.. code-block:: console
> > +
> > +   $ bitbake -c listtasks recipename
> > +   do_build                              Default task for a recipe - depends on all other normal tasks required to 'build' a recipe
> > +   do_checkuri                           Validates the SRC_URI value
> > +   do_clean                              Removes all output files for a target
> > +   do_cleanall                           Removes all output files, shared state cache, and downloaded source files for a target
> > +   do_cleansstate                        Removes all output files and shared state cache for a target
> > +   do_compile                            Compiles the source in the compilation directory
> > +   .. etc etc ...
>
> Nitpick, but I think "..." is enough.

  ok, i'll do that next time. or would you prefer that tweak?

rday

