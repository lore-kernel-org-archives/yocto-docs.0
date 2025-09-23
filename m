Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D6ABCAC5AC
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 16:08:21 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.1638.1758643694607956428
 for <docs@lists.yoctoproject.org>;
 Tue, 23 Sep 2025 09:08:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=hSaJ4KAY;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 46FEA4E40C31;
	Tue, 23 Sep 2025 16:08:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 170DE60690;
	Tue, 23 Sep 2025 16:08:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 08E7B102F1960;
	Tue, 23 Sep 2025 18:08:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758643692; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CrOton8wfqLyBZWbvGSMkIDfQBjkA0/hkYP4OlkTG7E=;
	b=hSaJ4KAY2op11OXcGabTYs60E4X6s1xrhlz3ny+ShV2ux6DnduwPzGos4sxpA5Btddx7LM
	i0SG9UqH7Qvb1IK+9P4kB857xidIJxS8uDFgBihyEdpP+Llfmv9lA9rI/xWLEbe2hZKTJV
	cct+w1Yi7Zq7m7OPRAYUMOqg2VIWveg3bCxTJEaE7HxHY5wdAQezezK36yOFaGvv9uAXSQ
	i2KDYf+GYY/R3pIj+mJMi+7xRALSBqIR/cfkqVQb4qQWnQ+AkJm0oa54E7VblNboWNsaCZ
	CWaoi1GfkWE1lZ6oSgaLrB/HQsSX8gF4OeTJei/K0OTgju5I6EhobQ44dGtwpg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Sep 2025 18:08:11 +0200
Message-Id: <DD0B5QEZ3FU5.DF9AOF4099WM@bootlin.com>
Subject: Re: [docs] [PATCH 1/2] dev-manual/building.rst: add note about
 globally inheriting externalsrc class
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <bhstalel@gmail.com>
References: <20250921132033.31644-1-bhstalel@gmail.com>
 <20250921132033.31644-2-bhstalel@gmail.com>
 <DCZE7GR7DWSC.20I17FKZ0DHZK@bootlin.com>
 <CAOgG7m1VGahbYM5rGdYy3y2en1+u0ANjFRuRs66-QJJSMOTP2g@mail.gmail.com>
In-Reply-To: <CAOgG7m1VGahbYM5rGdYy3y2en1+u0ANjFRuRs66-QJJSMOTP2g@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 23 Sep 2025 16:08:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7584

On Mon Sep 22, 2025 at 8:08 PM CEST, BELHADJ SALEM Talel via lists.yoctopro=
ject.org wrote:
> I think that beginners may not catch the idea from the example, and they,
> accidentally, inherit globally without setting them to specific recipes.

Understood. Then I would rephrase the sentence in the next paragraph after =
your
note, instead of adding the note.

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


