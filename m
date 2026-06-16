Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6929CCD98E1
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 13:01:28 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.153539.1781614886526487739
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Jun 2026 06:01:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=L0l+AA9K;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0122AC2BB30;
	Tue, 16 Jun 2026 13:01:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6FCDE601A9;
	Tue, 16 Jun 2026 13:01:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6E66C106C9D32;
	Tue, 16 Jun 2026 15:01:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781614880; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hOKAgQjlPlJKAjMiXgashhCruo+NeHJNnF2XO3wbwpM=;
	b=L0l+AA9K6DVl0WVNE466KGfMSt5FcOK2uqQCgOrXndwEwTswqeARkPpx8MSq8vc0mRimqc
	Qd0FHukjyt1HOwP5Bgp1lagrPT6Im7ETQpp/yUdew0+WLB85nkHabjFM3QWcrxFIzcZTpz
	vbDPhGkAjSRVgUFZG2+KO8AWbugMO43on8sPmTVrfRQgE8cxaTqqcNtccwdZSjOpE73u6q
	ckpdI1naBfFfblrM2e+bi4ZohbmtLmZM7lu/Et6P5dsFRMpwE4oWfhVDpUbUhQMyHTDMcZ
	yqZ2AsoYTgsVuJwIP0Nst1fP9CYvMiorDzNzDVtlK+a/RJ6cl0b1ZwM0BKM9hA==
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jun 2026 15:01:18 +0200
Message-Id: <DJAHRK7GQF9I.1QPF3J2TR961R@bootlin.com>
Subject: Re: [docs] [PATCH] dev-manual: clarify use of "PACKAGE_ARCH" in a
 packagegroup
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
References: <967c7da4-403e-0417-78ac-e416c44af1ef@crashcourse.ca>
In-Reply-To: <967c7da4-403e-0417-78ac-e416c44af1ef@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 Jun 2026 13:01:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9733

Hi,

On Wed Jun 10, 2026 at 9:53 PM CEST, Robert P. J. Day wrote:
>
> Warn the developer that if they want to set "PACKAGE_ARCH" in a
> packagegroup file, that setting must precede the "inherit
> packagegroup" line in the packagegroup recipe file.
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
> diff --git a/documentation/dev-manual/building.rst b/documentation/dev-ma=
nual/building.rst
> index 9983c7939..d4f1544bb 100644
> --- a/documentation/dev-manual/building.rst
> +++ b/documentation/dev-manual/building.rst
> @@ -615,6 +615,18 @@ your tunings to best consider build times and packag=
e feed maintenance.
>
>        PACKAGE_ARCH =3D "${TUNE_PKGARCH}"
>
> +   .. note::
> +
> +      If you're defining a packagegroup and you want to set::
> +
> +         PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +
> +      for the packagegroup, you need to do that *before* the
> +      ``inherit packagegroup`` line in the recipe file.
> +      Setting it afterward can break BitBake parsing, result in
> +      an "allarch" architecture mismatch error, or allow
> +      architecture-independent defaults to override your intent.
> +
>  -  *Choose a Generic Tuning File if Possible:* Some tunes are more
>     generic and can run on multiple targets (e.g. an ``armv5`` set of
>     packages could run on ``armv6`` and ``armv7`` processors in most

I think this note should be in the packagegroup class documentation, rather=
 than
here.

Antonin

