Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DD51CDB47F
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 08:01:26 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6579.1782374479829128429
 for <docs@lists.yoctoproject.org>;
 Thu, 25 Jun 2026 01:01:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=o7oYdrL4;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A5A4C4E408BC
	for <docs@lists.yoctoproject.org>; Thu, 25 Jun 2026 08:01:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6F22A5FF03;
	Thu, 25 Jun 2026 08:01:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 42E60106C8442;
	Thu, 25 Jun 2026 10:01:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782374477; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CBCy1P5R3RiWBppFWKq2T6qBA3w+F4CsgccGcSa3aS8=;
	b=o7oYdrL4goJVCS3xOJZ+nf4EYOLa1RLPaDSHpnIZksqwFviKjKwmbTJZ4yasfbBZ+zQv++
	cfEjyJpjzXHgYpyGv+OBSVoKfACUzfNZ6PwV0PMC4s5eDgY2Kw1YVdIe0a7qpQGsko3CdC
	6PwWm8k0ot2GVyUG2of4Bknr222iwz8UfSXc7AyIOMf3VMOOvfOPTm6nkQqvctDpgwPOjr
	Za0v1OroUnHDtXEOaS7zmm6Ns+qFaaKrmsWnAUtnYoJ5D16LIl2O/mK/WgSEcK43+i2nI5
	ifGzAdO0OM0aqta6BQp2+7gdjtKlnoddPD9bUwMk6GWr1IYla2uslJsfnFFOyA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 25 Jun 2026 10:01:15 +0200
Message-Id: <DJHZ0Q6RNWE3.4CJ8FWBSSANU@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: organize all recipes-* directories
 under subdirectory
References: <543708dc-e1aa-0798-653b-d8c073dbec50@crashcourse.ca>
In-Reply-To: <543708dc-e1aa-0798-653b-d8c073dbec50@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 25 Jun 2026 08:01:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9872

Hi,

On Mon Jun 22, 2026 at 10:29 PM CEST, Robert P. J. Day wrote:
>
> It's cumbersome to list all meta/recipes-* directories under the same
> level as other meta/ directories, so place them under a recipes-*
> higher-level directory.

I disagree. I don't see the added value of this, and following this logic y=
ou'd
have to do this for conf/ as well. I think it would just add too many level=
s of
headers.

Antonin

