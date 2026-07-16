Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C31DDC4450A
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 13:01:23 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12303.1784206879397013360
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Jul 2026 06:01:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=mH4Kt3yC;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4E0A1C2B9E7;
	Thu, 16 Jul 2026 13:01:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E224D60360;
	Thu, 16 Jul 2026 13:01:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AD22911BD3CF0;
	Thu, 16 Jul 2026 15:01:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784206876; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BiUzBx6AtTa0OB7iNz07l7KHBDzwG8aAAIisVWdCEmQ=;
	b=mH4Kt3yCBSJHaI308EjV8iLlycbszB272pu7xs8RVWVZbguXEjH+8954GXWjWqSMYefyg4
	5LIWh3EaLO3OE9+Oqt5gz0j9i2src6WDbHRXtqbRLe54FTjmlW3/g60mNeJ+p26uEFdJnM
	sBJ9L/Aihw2dKjvuSH/DaEhWXzCgqUwSCifMKxDg6cmBWQq5ZzgH/Zxvw8xr+Rsp4BGtSP
	G0G8tRjP0bJ6JhA04IShlGSSn/1rwqxN/hmS3fN2UvzQKkKdE2ZL+QmXRgt5RCfc2xv3KK
	t/5UGrfc24CqPP1vkI6viO22fqHkLf9FqIBgfS0y1bEKZN8PuqSCFUkUax/NnQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Jul 2026 15:01:14 +0200
Message-Id: <DK00JUVWMZL6.BUFWJ5L3GVR8@bootlin.com>
Subject: Re: [docs] should "DISTRO_FEATURES_OVERRIDES" be in the variables
 glossary?
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
References: <4ed778f3-596c-11aa-d1f7-de8ee6370b52@crashcourse.ca>
In-Reply-To: <4ed778f3-596c-11aa-d1f7-de8ee6370b52@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Jul 2026 13:01:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10090

Hi,

On Mon Jul 13, 2026 at 4:27 PM CEST, Robert P. J. Day wrote:
>
> https://git.openembedded.org/openembedded-core/tree/meta/classes/distroov=
errides.bbclass
>
> or is that too niche? i'd never even *seen* that variable before all
> this poking around i've been doing.

Not only DISTRO_FEATURES_OVERRIDES, but the class is also missing documenta=
tion
in ref-manual/classes.rst. Patches welcome!

Thanks,
Antonin

