Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0F72D13C2D
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 14:57:27 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21309.1769439437762187894
 for <docs@lists.yoctoproject.org>;
 Mon, 26 Jan 2026 06:57:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=oUeoImyE;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9D52B4E422A8;
	Mon, 26 Jan 2026 14:57:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7406960717;
	Mon, 26 Jan 2026 14:57:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 41064119A863F;
	Mon, 26 Jan 2026 15:57:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769439435; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wy6G6tuchwbi0dAOty6CawGxdC3k7ufUX+yUeqJL7Fc=;
	b=oUeoImyEebIbOJKmq4lcyS75wvLSDvyyhHqXCuykYUcRmBB309j6kMYzirZmWXz7N1BEp/
	5AEzf7PMWM7U/boE7FtMm4rau+hQLRP6Jf3Lcxk7XZdDJ6VGVQ21hDjt9cFz5Ph7c9tTqQ
	IA1Ko/o3LMntrzpm++pm+EHQuS6C+bC28t4zJCjR81L4IgMqUqQA5kUnkY5xaP3A8ok+zN
	czEV+C114xm7LnpmWwuBsTReCWZAlhceo+FeNmNmYVmbTwRnzFUK4U1XmVers7U+tdECid
	cjLJTQUMl3Fsblcrau/wfw+nK1tCBgQNpPGe4l1Ooel6pKf0uL9+K2rYnkrK7w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 15:57:13 +0100
Message-Id: <DFYLXI28FQVB.2K36J5CKAU4ML@bootlin.com>
Subject: Re: [docs] [PATCH 22/53]
 overview-manual/development-environment.rst: remove obsolete poky repo
 references
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-22-658a5f4dbde2@bootlin.com>
 <064b4d3d-0695-4ffe-8ae0-cd53ab2d281d@cherry.de>
In-Reply-To: <064b4d3d-0695-4ffe-8ae0-cd53ab2d281d@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 26 Jan 2026 14:57:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8649

Hi,

On Tue Jan 13, 2026 at 2:49 PM CET, Quentin Schulz wrote:
[...]
>> +      :term:`BitBake` repositories. For example, if you have checked ou=
t the "&DISTRO_NAME_NO_CAP;"
>
> Do not use this branch as it will never exist as it points to the name=20
> of the not-yet-released version. You want to use=20
> DISTRO_NAME_NO_CAP_MINUS_ONE likely (or DISTRO_NAME_NO_CAP_LTS).

No? This is true for the dev version of the docs, but once the docs are
released, this equals to the current version of the docs you are reading.

[...]
>>   It is important to understand that Git tracks content change and not
>>   files. Git uses "branches" to organize different development efforts.
>> -For example, the ``poky`` repository has several branches that include
>> +For example, the :yocto_git:`yocto-docs </yocto-docs>` repository has s=
everal branches that include
>>   the current "&DISTRO_NAME_NO_CAP;" branch, the "master" branch, and ma=
ny
>
> DISTRO_NAME_NO_CAP is wrong here, it's the not-yet-released version. We=
=20
> shouldn't be using that (or set_versions.py doesn't work right now). Or=
=20
> is it just wrong for the "master" branch of the docs maybe? Still,=20
> people will likely reach the official docs through the master branch?=20
> Should we show a warning on the docs for the master branch stating this=
=20
> applies only to unreleased software?

No, docs.yoctoproject.org shows the latest released version of the docs, wh=
ich
is the tip of the whinlatter branch right now. The master version of the do=
cs is
docs.yoctoproject.org/dev, and the master-next version of the docs is
docs.yoctoproject.org/next.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


