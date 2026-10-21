Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7402.1792574265793871703
 for <docs@lists.yoctoproject.org>;
 Wed, 21 Oct 2026 02:17:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=UDakSlvn;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 892CB1A12AD;
	Wed, 21 Oct 2026 09:17:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5CAC4606E3;
	Wed, 21 Oct 2026 09:17:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F060810328934;
	Wed, 21 Oct 2026 11:17:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792574262; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9jWwCH5iS7tvK8pH3e6temFQ3KgbVVgzPFfwBU5mFHo=;
	b=UDakSlvn8N66geaRNLOm7jgniYtvE4EkX2x67fUQQAaQcxM9hAQu3l7TpPWJK6OEeG2o1a
	fKH/b8d1y+X/c9WL2KvJnVfk1Q0sEwH00R/Cz/DH1Z7oJ3HnzzqXphmEBZoOYTD6VtCz0/
	BdaW/p4XKErlkMC/4PGd78mpHQBnndCSTHvWVsaCDOXQJceml1KCHmDiwdq+BqqJlOyQGY
	wp9OcHFH70PxzpeC5k9/qgFl0bSZYeM2Q2oBenlhjJ1c3CxuKkl37EnoRtqHQkLRDSExD6
	T8FRaMfaqjWxFhxI02JQ0EV3d11/6GJI4HeJez5Qj7pKMzrdL1vuwRYTAYCPag==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 11:17:41 +0200
Message-Id: <DMAEJJ4MILKV.1ITOE2Q4THIEY@bootlin.com>
Subject: Re: [docs] [PATCH] ref-manual/variables.rst: document the QB_FSINFO
 variable
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <andrej.kozemcak@siemens.com>, <docs@lists.yoctoproject.org>
References: <20261020103632.1125052-1-andrej.kozemcak@siemens.com>
In-Reply-To: <20261020103632.1125052-1-andrej.kozemcak@siemens.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Wed, 21 Oct 2026 09:17:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10706

Hi,

On Tue Oct 20, 2026 at 12:36 PM CEST, Andrej Kozemcak via lists.yoctoprojec=
t.org wrote:
> Added by commit b6c78bddf3 ("runqemu: support rootfs-dbg flag
> in QB_FSINFO") in OE-Core.
> Add documentation for the QB_FSINFO variable, which provides
> additional filesystem metadata to runqemu as a space-separated
> list of fstype:flag entries, covering WIC kernel-in-fs options
> and tar rootfs-dbg handling.
>
> Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
> ---
> Request from this email:=20
> https://lists.openembedded.org/g/openembedded-core/message/248037?p=3D%2C=
%2C%2C20%2C0%2C0%2C0%3A%3Acreated%2C%2CQB_FSINFO%2C20%2C2%2C0%2C121544914
>
>  documentation/ref-manual/variables.rst | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index 5339721f4..025219d54 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -8205,6 +8205,20 @@ system and gives an overview of their function and=
 contents.
>        filesystem image extension found in :term:`DEPLOY_DIR_IMAGE`. For =
example:
>        ``ext4.zst``.
> =20
> +   :term:`QB_FSINFO`
> +
> +      The :term:`QB_FSINFO` variable provides additional filesystem meta=
data to
> +      ``runqemu`` as a space-separated list of ``fstype:flag`` entries. =
For
> +      example::
> +
> +         QB_FSINFO =3D "wic:no-kernel-in-fs tar:rootfs-dbg"
> +
> +      For WIC images, use ``wic:no-kernel-in-fs`` or ``wic:kernel-in-fs`=
` to
> +      specify whether the kernel is included in the filesystem. For tar-=
based
> +      filesystem types, ``tar:rootfs-dbg`` makes ``runqemu`` use the deb=
ug
> +      root filesystem image when extracting a tarball for NFS by appendi=
ng
> +      ``-dbg`` to :term:`IMAGE_LINK_NAME`.

I think this would be better presented as lists, and start with:

"""
The currently supported ``fstype`` and ``flag`` entries are:

-  ``wic``:

   -  ``no-kernel-in-fs``: ...

   -  ``kernel-in-fs``: ...

-  ``tar``:

   -  ``rootfs-dbg``: ...
"""

So it's simpler to add new ones later.

Thanks,
Antonin
