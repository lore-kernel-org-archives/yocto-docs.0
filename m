Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19077.1794315267834868428
 for <docs@lists.yoctoproject.org>;
 Tue, 10 Nov 2026 04:54:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=IPR8xLod;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C8AD1C69156;
	Tue, 10 Nov 2026 12:54:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7A8BF60012;
	Tue, 10 Nov 2026 12:54:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0A337103293D1;
	Tue, 10 Nov 2026 13:54:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794315265; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8IlcGtyaqOV0L8mvDRi/+EQ8vGppvmV7E6rPlJFOjj4=;
	b=IPR8xLod5xKGJrbDAgwZM4rczkhutXsmZO8dZDNdUw7T8ssUXTmD9WC5qpVpgAOtPVfIbE
	vKsur3PPA6G6QcGNCOMNratltc/MVwFafcFl4y78yjsiCYcfYD0uxuoCicIWUnBRrZR/dU
	j1g5All5Ze50wRDcFWPrzK23he1kU/mTvnoY5V2Yb6QJjNuczxLNh1aJN/cL8hQlcjgzpT
	ZO7bq1F7vu3B6SfwB0FVG9M4mV8xTPDcaiLubA83n6S67HOsOfwr3SVvwc+OxyfdoweSBZ
	oDDAT36e3+ae3HLjegHKoGdFLV+30GKVvGJawt4EvRiz64kFAQ2sPvBLUd1O8Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Nov 2026 13:54:23 +0100
Message-Id: <DMRJOCCCGZT1.1FM0B0CTP4902@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] i don't see my Oct 1 patch to add Wic as a term
References: <84f94b21-5909-704a-b3c6-52b474ff3ff7@crashcourse.ca>
In-Reply-To: <84f94b21-5909-704a-b3c6-52b474ff3ff7@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Tue, 10 Nov 2026 12:54:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10786

On Tue Nov 10, 2026 at 11:44 AM CET, Robert P. J. Day wrote:
>
>   several weeks ago, i submitted a patch to add the "Wic" term to the
> ref manual list of terms, and it was signed off:
>
>   commit 05c97b48227f0e50d008d078b224aa537c06aada
>   Author: Robert P. J. Day <rpjday@crashcourse.ca>
>   Date:   Thu Oct 1 06:51:58 2026 -0400
>
>     ref-manual: add a terms entry for Wic
>
>     Add a short entry for Wic to the reference manual in order to later
>     refer to it from other places in the docs.
>
>     Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>     Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>
> but i just checked and don't see it in the official docs (should be
> right after "Upstream")
>
> https://docs.yoctoproject.org/ref-manual/terms.html#term-Upstream
>
>   i can see that commit in the master branch. am i missing something?

This patch was not backported to Blacksail as I didn't think there was a st=
rong
need for a backport here.

You can see the term on the dev version here:
https://docs.yoctoproject.org/dev/ref-manual/terms.html#term-Wic

This will display on the default page when Garburn releases.

Antonin
