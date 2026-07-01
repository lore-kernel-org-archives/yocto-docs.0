Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62ABEC43458
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 15:44:16 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48337.1782920645993642493
 for <docs@lists.yoctoproject.org>;
 Wed, 01 Jul 2026 08:44:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=jWknfAHc;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6A56DC504E2
	for <docs@lists.yoctoproject.org>; Wed,  1 Jul 2026 15:44:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6749060288;
	Wed,  1 Jul 2026 15:44:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3AA93104C8351;
	Wed,  1 Jul 2026 17:44:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782920643; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cmlyQMIsh+ePrHcGuqAi7mRKAXFm39A/NSmmbxcK4uE=;
	b=jWknfAHc1OhC3BcsOAIU94ompffTKMvbT8FqwjxaLmn0gXUXOG2N3HwiRBAapRcBCTDo2i
	v4+AcMu0zJ/HCF/iz+lt2FCI6cjCdegDgY6F2//hbOHW9ZQrhuvWCnHE65JOYMEaA/4rDG
	omGigbPYvMTWMgr6/3wR2sZHJeRPy9moJMyjOUviHACxFw+7wVfVZejVNBAfyirWCpOZsW
	BuoYxlXKqhqP1P+jWWGDhOMdhmK4UfSFLL4q1FsOmWhd8acZS8E0BNEixHVztZJRxXJmmW
	2MpBcRMbstR4BRu5vEUfWLOHdDSPaUIX/6N2BhfRwLqQM0fcsEf7uq3T+aVIHQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Jul 2026 17:44:01 +0200
Message-Id: <DJNCMBDLM2PH.3SR2L79QRQHYV@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] is kernel task "do_kernel_menuconfig" different from
 "do_menuconfig"?
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <c832e729-0920-c0a7-f047-22a2f3bc9558@crashcourse.ca>
In-Reply-To: <c832e729-0920-c0a7-f047-22a2f3bc9558@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 01 Jul 2026 15:44:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9992

Hi,

On Wed Jul 1, 2026 at 3:06 PM CEST, Robert P. J. Day wrote:
>
> here:
>
> https://docs.yoctoproject.org/ref-manual/tasks.html#do-kernel-menuconfig
>
> i don't see a "kernel_menuconfig" task defined anywhere in the OE-core
> layer, but i see just below that a reference to "do_menuconfig", which
> does exist.
>
>   are these meant to be the same thing? should the former task be
> deleted from the list, and reference to it be adjusted to the latter?
>
>   or what is going on here?

Yes, I don't find it either in OE-Core nor in the history, so not sure why =
this
was added in the first place.

If you want you can send a patch to remove it and also rework the
`do_menuconfig` section to make it non-kernel-specific, since you can also =
run
this task for U-boot, and other recipes that inherit the cml1 class.

Thanks,
Antonin

