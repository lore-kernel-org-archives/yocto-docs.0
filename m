Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 923B8CAC592
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 14:32:20 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.53492.1758551534332302808
 for <docs@lists.yoctoproject.org>;
 Mon, 22 Sep 2025 07:32:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=tZhQkfaG;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A2F444E40D2B
	for <docs@lists.yoctoproject.org>; Mon, 22 Sep 2025 14:32:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 727A360634;
	Mon, 22 Sep 2025 14:32:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E49DA102F16C2;
	Mon, 22 Sep 2025 16:32:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758551531; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1DkZNoMGw0r3QpExSVoFScl9DDUwugDmA2KntMD2Tc8=;
	b=tZhQkfaGXlbFjm0sRK0JoqmstLRpLOMYMzfzh9kalbOkx3LZtdAza2EtahryP2fBSqZ2EA
	ciOpCSl7LxB8XHoPd7fk5GI2t2AqUNDqZ3REBr5RsFn2UWAylUC1rRtY72qf6yK/StdKme
	kGMHxz6nk+VG4GxjGJC37U7TCiPtj9fYGQO5+xZUv+guQLjnq1AO4AD34vgcs5ednCqBi1
	IVHrn1exu0DqNWGktQGjo0uRJwRMhWU0v9KToTuSsGBwRaFH50SajDnLPL03MqPJfuSfua
	H6+eYvx8Yt/ATDJjtVfYjfPvbueEDR2W31qw9QtlXpJHREGtNXwVQBNpYLpTzQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Sep 2025 16:32:09 +0200
Message-Id: <DCZEHNS2J0WG.2PV5B9HWKUBSV@bootlin.com>
Subject: Re: [docs][PATCH 1/2] ref-manual/classes.rst: add details about
 actions done by base.bbclass
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <bhstalel@gmail.com>, <docs@lists.yoctoproject.org>
References: <20250921164306.53501-1-bhstalel@gmail.com>
 <20250921164306.53501-2-bhstalel@gmail.com>
In-Reply-To: <20250921164306.53501-2-bhstalel@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 22 Sep 2025 14:32:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7574

On Sun Sep 21, 2025 at 6:43 PM CEST, BELHADJ SALEM Talel via lists.yoctopro=
ject.org wrote:
> Signed-off-by: Talel BELHAJ SALEM <bhstalel@gmail.com>
> ---
>  documentation/ref-manual/classes.rst | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-man=
ual/classes.rst
> index 662121ed9..791c6b2ef 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -183,6 +183,14 @@ The class also contains some commonly used functions=
 such as
>  :term:`EXTRA_OEMAKE` variable as well as the
>  arguments passed directly to ``oe_runmake``.
> =20
> +The following actions, among others, are handled by this class:

I would perhaps phrase this differently, how about:

"""
For example, the following items are handled by this class:
"""

So intent is more about giving some examples about what the class is doing.

> +
> +- Define default dependencies and add them to :term:`DEPENDS` if :term:`=
INHIBIT_DEFAULT_DEPS`
> +  is not defined

What dependencies? I'm afraid adding this sentence may add confusion instea=
d of
adding precision.

> +- Handle :term:`PACKAGECONFIG` variable

This is vague too. I would extend this sentence to briefly give some contex=
t.

> +- Handle the provided license via :term:`LICENSE` and :term:`LIC_FILES_C=
HKSUM` variables

s/license/license(s)

This is again a bit vague, I'm not sure what's the added value. How about:

"""
Handle the provided license(s) specified in the :term:`LICENSE` variable, a=
nd
verify its checksum specified in the :term:`LIC_FILES_CHKSUM` variable.
"""

> +- Prepare the native recipe that correspond to the scheme set in :term:`=
SRC_URI`

This is too vague, I'm not sure what you wanted to convey here.

> +
>  .. _ref-classes-bash-completion:
> =20
>  ``bash-completion``

I would finish by saying:

"""
See the source code of the :ref:`ref-classes-base` class to get a complete
overview of what the class handles.
"""

So that way we insist on the fact that we were just giving examples.

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


