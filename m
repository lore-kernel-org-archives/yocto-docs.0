Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A15B2CFA466
	for <webhook@archiver.kernel.org>; Mon, 24 Nov 2025 14:55:18 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18451.1763996109472883436
 for <docs@lists.yoctoproject.org>;
 Mon, 24 Nov 2025 06:55:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=yap6fMZW;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D51FBC139AF;
	Mon, 24 Nov 2025 14:54:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 759B2606FC;
	Mon, 24 Nov 2025 14:55:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8237D1037143A;
	Mon, 24 Nov 2025 15:55:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763996106; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AuY4cWxBA0VmPKDE29CxVKwXCzfOAMqAgYjMvN9xb2s=;
	b=yap6fMZW6oNND32ZaMzhsZzFIHwdZuq4wu+Pz0m1yYBLAcAirwywMaET3XwfJYIZktiJV5
	XPMI4C9w9HV7GSNkrnwDO9n3y0ruuVLqs3NuGBcNJTPDVkXjvZpOrTqKiJl1VpZdD532xE
	bf5N3D/0eSAgfUyVJd58qkGFht6e0HR8fjI3mrrcQApqlaK5ayJ0KTbH/TygU/nsHKDqea
	hkLj2jZCQzTdWyIxzoyo5STyxEsSHI2z51BcB/hxVKh0f4od20NHRLZb/nkLOy3bYLMd+e
	/6gVTcRfTPQSohp+2qoBrGG5IhdPdKCiIsJq/gQXBnwXz1jsoafPTxnMSmquwg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Nov 2025 15:55:04 +0100
Message-Id: <DEH0FJ96MF58.TDE0QZF0AM5A@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v2] brief-yoctoprojectqs: shorten and clarify
 required host packages
References: <77d4de56-c700-9ae8-f03f-ede89df13e62@crashcourse.ca>
In-Reply-To: <77d4de56-c700-9ae8-f03f-ede89df13e62@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 24 Nov 2025 14:55:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8106

Hi,

On Wed Nov 19, 2025 at 5:55 PM CET, Robert P. J. Day wrote:
[...]
> -Build Host Packages
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -You must install essential host packages on your build host. The
> -following command installs the host packages based on an Ubuntu
> -distribution:
> -
> -.. literalinclude:: ../tools/host_packages_scripts/ubuntu_essential.sh
> -   :language: shell
> -
> -.. note::
> +Supported Linux Distributions and Required Host Packages
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>
> -   For host package requirements on all supported Linux distributions,
> -   see the :ref:`ref-manual/system-requirements:required packages for th=
e build host`
> -   section in the Yocto Project Reference Manual.
> +For host package requirements on all supported Linux distributions,
> +see the :ref:`ref-manual/system-requirements:required packages for the b=
uild host`
> +section in the Yocto Project Reference Manual.

I think this defeats the purpose of this guide being the "Quick Start Guide=
". I
_think_ most people run Ubuntu when they run Linux, and I believe this is t=
he
reason why this was written like so in this section.

So for the majority of people reading this section will be enough, and that=
's
the point. Also, the previous section "Compatible Linux Distribution" does
mention that not all version are supported. So I think this section is fine=
 as
it is.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


