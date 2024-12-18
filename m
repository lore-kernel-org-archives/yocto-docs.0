Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E861E77188
	for <webhook@archiver.kernel.org>; Wed, 18 Dec 2024 15:36:56 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.108282.1734536211477832579
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Dec 2024 07:36:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=C07l3WKz;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5F9901C0009;
	Wed, 18 Dec 2024 15:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734536209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RW3gR+4sd2ROxR0JB4CybQVPKnhvkbopbTlITsFVcwA=;
	b=C07l3WKznMeOFpZET+SRNfTaoWcGu0G/RvTsj6jcylyKpks3boUmr1eQmXcCFdqQ8sfBc4
	iwx7+pEUbM1ynIQ0BjmQe8267CYByR+hI/m1WM+UfJPSAb0Bzv5YGd5dR/OJGyIL/V8EH5
	RXhobrB9sZ65GED8Li0EIoUV4aXNjGEFcdJSBFkpPM81XXo9A4XtIGW/U00nv7Jl4AQhDi
	RnTpsDQiQC9jZzTiUKKQhi/KQYCihjtYcLQ0ezVhQvPvuu9cmUgVDC2czUvBf4P6nqmTf6
	qMnv581J84dgDDm+AspxTiR+dmPSSI8j3BWpOT4LVdxe4QnHdCSt3eVjunSBSw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Dec 2024 16:36:49 +0100
Message-Id: <D6EXRQ17SP9E.3OJ5BPEMIQXZM@bootlin.com>
Subject: Re: [docs] [PATCH v3 0/3] Improvements to "bmaptool" usage
 documentation
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <michael.opdenacker@rootcommit.com>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20241218144654.852310-1-michael.opdenacker@rootcommit.com>
In-Reply-To: <20241218144654.852310-1-michael.opdenacker@rootcommit.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 18 Dec 2024 15:36:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5982

Hi Michael,

On Wed Dec 18, 2024 at 3:46 PM CET, Michael Opdenacker via lists.yoctoproje=
ct.org wrote:
> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
>
> - Changes in V3:
>
>   - Use "chmod a+w" instead of "chmod o+w",
>     and put this right before calling "oe-run-native"
>     (thanks to Antonin Godard)
>
> - Changes in V2:
>
>   - Fix typo in "sudo" (thanks to Ulrich =C3=96lmann)
>
>   - Remove "bitbake bmaptool-native" as
>     "bitbake bmaptool-native -caddto_recipe_sysroot" is enough
>     (thanks to Antonin Godard)
>
> Michael Opdenacker (3):
>   dev-manual: fix styling of references to bmaptool
>   dev-manual/bmaptool.rst: correct command for bmaptool-native
>   dev-manual/bmaptool.rst: simplify and fix instructions
>
>  documentation/dev-manual/bmaptool.rst | 29 +++++++++++++--------------
>  documentation/dev-manual/wic.rst      |  4 ++--
>  2 files changed, 16 insertions(+), 17 deletions(-)

For the series:

Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>

Thank you!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


