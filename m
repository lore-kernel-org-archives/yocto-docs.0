Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9431EE77191
	for <webhook@archiver.kernel.org>; Thu, 26 Dec 2024 08:35:40 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.18858.1735202133763980679
 for <docs@lists.yoctoproject.org>;
 Thu, 26 Dec 2024 00:35:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iiu1qs+7;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A4A021BF203;
	Thu, 26 Dec 2024 08:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735202132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P7ht9yZ3jfmrH75AiDvHl1euGUkiXXR7L0lr4F/LDUw=;
	b=iiu1qs+7oTAPI1PfWAByxP07TzC51EqyGM9rih80VpQQIxCp70vjhvnjrJlo4SG0zg4Yga
	arWQn/ZX6FEVk+cdOAbjln/cmsDyCl0YSEVua3zxcGtOfpnG69nH/FtjOcDMfurNDXzur8
	O6KNC1ce91azu0+tmSq+1PuI88qPZKFLmAskYgPE9CrCrJKDO27livo9jZ8LClfYd2nbHd
	uf3hQjrOrzDrzKBJmQCYHUmoQsWXIwiD4PYpU5cZmnrCwwf9nEn59bBco0UbvqTCqljjfJ
	WGeiQuuykHKHWN30+GFjgX5ybK8VcBWbDNF550/nZm6UlFO3UTLuDGhmwEEvjQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Dec 2024 09:35:31 +0100
Message-Id: <D6LHTIGUQE41.2Q8LEC1YVJV0Y@bootlin.com>
Subject: Re: [docs] [PATCH 1/3] migration-guides: systemd.bbclass do not add
 Also services for 5.2
Cc: "Adrian Freihofer" <adrian.freihofer@siemens.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <adrian.freihofer@gmail.com>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20241224140251.24389-1-adrian.freihofer@siemens.com>
 <20241224140251.24389-2-adrian.freihofer@siemens.com>
In-Reply-To: <20241224140251.24389-2-adrian.freihofer@siemens.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 26 Dec 2024 08:35:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6034

Hi Adrian,

Thanks for the update on this! Here below are some suggestions.

On Tue Dec 24, 2024 at 3:02 PM CET, Adrian Freihofer via lists.yoctoproject=
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
> index cb70e19da..2ae8e73a7 100644
> --- a/documentation/migration-guides/migration-5.2.rst
> +++ b/documentation/migration-guides/migration-5.2.rst
> @@ -74,6 +74,25 @@ systemd changes
>     As a consequence, the ``systemd`` recipe no longer contains the ``usr=
merge``
>     :term:`PACKAGECONFIG` option as it is now implied by default.
> =20
> +-  ``systemd.bbclass``: If a systemd service file had referred to other =
service
> +   files by starting them as =E2=80=9CAlso=E2=80=9D, the other service f=
iles were automatically added

s/by starting them as/with/?
s/=E2=80=9CAlso=E2=80=9D/`Also <https://www.freedesktop.org/software/system=
d/man/latest/systemd.unit.html#Also=3D>`__/?

> +   to the ``FILES`` variable of the same package. Example:=20

s/``FILES``/:term:`FILES`/

Same for FILES and SYSTEMD_SERVICE below.

> +
> +   a.service contains:

Nitpick:

s/contains:/contains::/
and remove ".. code-block:: ini" below

> +
> +   .. code-block:: ini
> +
> +      [Install]
> +      Also=3Db.service
> +
> +   If a.service is packed in package A, b.service is automatically packe=
d

s/packed/packaged/

> +   into package A as well. This happens even if b.service is explicitly
> +   added to package B using FILES and SYSTEMD_SERVICE variables.
> +
> +   This prevents such services from being packaged into different packag=
es.
> +   Therefore, this automatic has been removed for service files (but not=
 for socket files).

"automatic behavior"?

> +   Now all service files must be explicitly added to ``FILES``.
> +
>  Recipe changes
>  ~~~~~~~~~~~~~~
> =20


Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

