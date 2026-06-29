Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDD84C43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 07:54:51 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87297.1782719686057748081
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 00:54:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=oRV0wk/U;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3B2264E40B40
	for <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 07:54:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0B1DB5FF96;
	Mon, 29 Jun 2026 07:54:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D20F3106F153A;
	Mon, 29 Jun 2026 09:54:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782719683; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ftzB7kZevMmh5BwoDhkyzxTWHg437EttNrtcnBzhbYI=;
	b=oRV0wk/Uk8wp+kl1vh9n0IUSkoYKw/F9kqzkify0DBdqW7upAwj6LsFbT0om3mdqs7MWWu
	iYMdPY6Zn543gEPAhw5ofoUMqBo6LRJfwZrOA1lbMxzkoUEerjg6ZV+I5/broS+OEQmUcB
	HBsIwd11C9viPBlCX1vTMNmfvOneohQLbnOAOhnwuFnQIKfRe2FS/xuVA6lWNneIq+XyBk
	rOJ90wrnX+loAwRjBDbrzxUUqnLbY+s/9eshTfbB4NHstV7BGrQ5E5eN7QDBFbb++Kfu5y
	GGSNzENKupuEsnoRDcJy4wmDBZpnnWcd1IwZ9dptTexnXd17uly9gVx/YgX3bg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Jun 2026 09:54:42 +0200
Message-Id: <DJLDDW33JA8O.DDQ8KU4L1MYL@bootlin.com>
Subject: Re: [docs] ref manual explanation of do_configure() seems
 incomplete
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
References: <f752867d-01b5-b9f1-3530-34cf8c4ce16c@crashcourse.ca>
In-Reply-To: <f752867d-01b5-b9f1-3530-34cf8c4ce16c@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 07:54:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9921

Hi,

On Fri Jun 26, 2026 at 6:16 PM CEST, Robert P. J. Day wrote:
>
>   (currently poring over ref manual "tasks" section, will ask about
> whatever seems confusing.)
>
> here:
>
> https://docs.yoctoproject.org/ref-manual/tasks.html#do-configure
>
> one reads:
>
> "The default behavior of this task is to run oe_runmake clean if a
> makefile (Makefile, makefile, or GNUmakefile) is found and CLEANBROKEN
> is not set to =E2=80=9C1=E2=80=9D. If no such file is found or the CLEANB=
ROKEN
> variable is set to =E2=80=9C1=E2=80=9D, the do_configure task does nothin=
g."
>
>   if you check the task definition:
>
> https://git.openembedded.org/openembedded-core/tree/meta/classes-global/b=
ase.bbclass#n379
>
> it seems that even if that test fails, there might still be some
> subsequent processing, so stating that it will do "nothing" seems
> potentially misleading.

What would you suggest instead of "does nothing"? It seems irrelevant to go=
 in
details about the next steps taken in the task.

Antonin

