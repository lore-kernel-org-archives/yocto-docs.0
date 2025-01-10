Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9269FE77188
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 09:23:58 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.14782.1736501037243425144
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Jan 2025 01:23:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cQEQa10/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 24D5DC0003;
	Fri, 10 Jan 2025 09:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736501035;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gSOyEvTsvEwbWCD4UwhjWaQbzWdb55RQfnqQu62mVCM=;
	b=cQEQa10/buvKnYJjqWVR8uSkjI3MnwsIJgBZexx8NZkMxfTDlzV03MMosuZo+iyLho72aQ
	P2o8ePNHkxKiIA5dVaP/Fz1YGtuYK74gorivcA1aAhVuhuEdfth5ceGn+Loay4OtDq+74p
	/DXrqz7SNJH4KoM47i7hWRJX4RVuDL6vYjiUlh0W+LmtwCsKxXUj6OvQTkjgy4QHtiMWVN
	LV/az9Ju9AdT4qCkq3NPHPUUMGcx6HCuWPIg3TDe/g//Dr+gdvGkwh/JVBYriilzR4xnlz
	9rZT5O+XNFVj5hOk07t+Covl0VFnQIAvPVww8XnbdpVGtPHnpWFk1dtPukwbJw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Jan 2025 10:23:54 +0100
Message-Id: <D6YA8QGOQ1TP.1R2HAIO6P02OB@bootlin.com>
Cc: "Adrian Freihofer" <adrian.freihofer@siemens.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <adrian.freihofer@gmail.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v2 1/3] migration-guides: systemd.bbclass do not
 add Also services for 5.2
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20250109222015.12658-1-adrian.freihofer@siemens.com>
 <20250109222015.12658-2-adrian.freihofer@siemens.com>
In-Reply-To: <20250109222015.12658-2-adrian.freihofer@siemens.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Jan 2025 09:23:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6079

Hi Adrian,

On Thu Jan 9, 2025 at 11:17 PM CET, Adrian Freihofer via lists.yoctoproject=
.org wrote:
> Covers the chagnes introduced by commit
> https://git.yoctoproject.org/poky/commit/?id=3Defa5f65c2214239ed7aaf7bd89=
98683e755c5660
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  .../migration-guides/migration-5.2.rst        | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/documentation/migration-guides/migration-5.2.rst b/documenta=
tion/migration-guides/migration-5.2.rst
> index cb70e19da..b18ae30d9 100644
> --- a/documentation/migration-guides/migration-5.2.rst
> +++ b/documentation/migration-guides/migration-5.2.rst
> @@ -74,6 +74,25 @@ systemd changes
>     As a consequence, the ``systemd`` recipe no longer contains the ``usr=
merge``
>     :term:`PACKAGECONFIG` option as it is now implied by default.
> =20
> +-  ``systemd.bbclass``: If a systemd service file had referred to other =
service
> +   files by starting them as
> +   `Also <https://www.freedesktop.org/software/systemd/man/latest/system=
d.unit.html#Also=3D>`__,
> +   the other service files were automatically added to the :term:`FILES`=
 variable of
> +   the same package. Example:=20
> +
> +   a.service contains::
> +
> +      [Install]
> +      Also=3Db.service
> +
> +   If a.service is packaged in package A, b.service is automatically pac=
kaged
> +   into package A as well. This happens even if b.service is explicitly =
added
> +   to package B using FILES and :term:`SYSTEMD_SERVICE` variables.
> +   This prevents such services from being packaged into different packag=
es.
> +   Therefore, this automatic behavior has been removed for service files=
 (but
> +   not for socket files).
> +   Now all service files must be explicitly added to :term:`FILES`.
> +
>  Recipe changes
>  ~~~~~~~~~~~~~~
> =20

Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>

Thank you!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

