Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0787CCC6B1C
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 17:56:08 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4015.1791914163850139521
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Oct 2026 10:56:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=mWtaeV9C;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C862D1A1217
	for <docs@lists.yoctoproject.org>; Tue, 13 Oct 2026 17:56:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8E1D960362
	for <docs@lists.yoctoproject.org>; Tue, 13 Oct 2026 17:56:01 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
	id DC5A911D718CA; Tue, 13 Oct 2026 19:50:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791914161; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/9SQ2I6PEyNxODOishmO/Z4z+pz21GK3WgsMPswIdjE=;
	b=mWtaeV9C3EUVS4JlCf4j5J/dxyUWrXlPhPI35/YBmbbHaxZ6YB++fkUKUUDdcrmZcXSBW0
	cyhwqagC4viVd9X4iWHlXlHo8byRBhgK1zw4MIUDyoBCsCOa+U2tEfsQ0lBKvmrTLf9KIP
	ffWuu35GhhiPftmlYhiTI66DCzoVyo4UAh1UYnIGp8hCI/r6m2Ol1U9Z3dKf+mepdh5Zus
	cL2yllnjpK/8scWfX3pF93pYwh4k+FoOPXJQeJRw4CdSJE74F5iBq5av4bjtDxypPgINMd
	QCOLGge0ld9xpYBkVEVWkrv6ny5y4BVrAlPXD6Tghlwc9TGLiZyX9cRE+aiS8Q==
Authentication-Results: mail.galae.net;
	none
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Oct 2026 15:58:12 +0200
Message-Id: <DM2WVEXYKYCD.258COUKZK6O6C@bootlin.com>
Subject: Re: [docs] [PATCH] ref-manual/variables.rst: document versioned
 RPROVIDES
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <wafgo01@gmail.com>, <docs@lists.yoctoproject.org>
References: <20261005072345.1383304-1-wafgo01@gmail.com>
In-Reply-To: <20261005072345.1383304-1-wafgo01@gmail.com>
X-TUID: gE44SPdI20NM
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: DC5A911D718CA
X-Spamd-Result: default: False [-4.10 / 30.00];
	BAYES_HAM(-5.50)[99.99%];
	DATE_IN_PAST(1.00)[27];
	MV_CASE(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_ZERO(0.00)[0];
	FREEMAIL_TO(0.00)[gmail.com,lists.yoctoproject.org];
	BCC(0.00)[];
	ARC_NA(0.00)[];
	MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	URIBL_BLOCKED(0.00)[yoctoproject.org:url,yoctoproject.org:email,bootlin.com:mid,bootlin.com:email,localhost:rdns,localhost:helo];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_SIGNED(0.00)[bootlin.com:s=dkim]
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Oct 2026 17:56:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10669

Hi,

On Mon Oct 5, 2026 at 9:23 AM CEST, Wadim M=C3=BCller via lists.yoctoprojec=
t.org wrote:
> RPROVIDES accepts the same "name (operator version)" syntax as
> RDEPENDS: package_rpm parses it with bb.utils.explode_dep_versions2()
> and writes "Provides: name =3D version" into the spec file. This lets a
> package provide an interface level that other packages depend on with
> ">=3D", which an alias carrying the version in its name, such as the
> existing "widget-abi-2" example, cannot express.
>
> package_ipk and package_deb build their Provides field from
> dict.fromkeys(explode_dep_versions2(RPROVIDES), []) and so drop the
> version, which the documentation should say next to the syntax.
>
> Signed-off-by: Wadim Mueller <wafgo01@gmail.com>
> ---
>  documentation/ref-manual/variables.rst | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index 1c0864d87..b16a6272c 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -8735,6 +8735,24 @@ system and gives an overview of their function and=
 contents.
> =20
>           RPROVIDES:${PN} =3D "widget-abi-2"
> =20
> +      An alias can also carry a version, using the same syntax as
> +      :term:`RDEPENDS` with the ``=3D`` operator::
> +
> +         RPROVIDES:${PN} =3D "widget-abi (=3D 2)"
> +
> +      Other packages can then depend on a range of versions of the alias=
,

This I understand,

> +      which an alias with the version in its name cannot express::

But this I'm not sure. Are you saying that you cannot write:

  RPROVIDES:${PN} =3D "widget-abi (>=3D 2)"

?

If that's what you wanted to say, maybe I would explain in a separate parag=
raph,
after the RDEPENDS snippet below, with an example. Also, what happens if yo=
u
write the example above? Does the build fail?

> +
> +         RDEPENDS:${PN} =3D "widget-abi (>=3D 2)"
> +
> +      .. note::
> +
> +         Only the :ref:`ref-classes-package_rpm` class writes the versio=
n
> +         into the package metadata. The :ref:`ref-classes-package_ipk` a=
nd
> +         :ref:`ref-classes-package_deb` classes drop it and provide the =
bare
> +         alias, so a versioned dependency on the alias cannot be relied =
upon
> +         with those package formats.
> +
>     :term:`RRECOMMENDS`
>        A list of packages that extends the usability of a package being
>        built. The package being built does not depend on this list of

Thanks,
Antonin
text:
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Oct 2026 15:58:12 +0200
Message-Id: <DM2WVEXYKYCD.258COUKZK6O6C@bootlin.com>
Subject: Re: [docs] [PATCH] ref-manual/variables.rst: document versioned
 RPROVIDES
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <wafgo01@gmail.com>, <docs@lists.yoctoproject.org>
References: <20261005072345.1383304-1-wafgo01@gmail.com>
In-Reply-To: <20261005072345.1383304-1-wafgo01@gmail.com>
X-TUID: RiwbBQw8U+XC

Hi,

On Mon Oct 5, 2026 at 9:23 AM CEST, Wadim M=C3=BCller via lists.yoctoprojec=
t.org wrote:
> RPROVIDES accepts the same "name (operator version)" syntax as
> RDEPENDS: package_rpm parses it with bb.utils.explode_dep_versions2()
> and writes "Provides: name =3D version" into the spec file. This lets a
> package provide an interface level that other packages depend on with
> ">=3D", which an alias carrying the version in its name, such as the
> existing "widget-abi-2" example, cannot express.
>
> package_ipk and package_deb build their Provides field from
> dict.fromkeys(explode_dep_versions2(RPROVIDES), []) and so drop the
> version, which the documentation should say next to the syntax.
>
> Signed-off-by: Wadim Mueller <wafgo01@gmail.com>
> ---
>  documentation/ref-manual/variables.rst | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index 1c0864d87..b16a6272c 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -8735,6 +8735,24 @@ system and gives an overview of their function and=
 contents.
> =20
>           RPROVIDES:${PN} =3D "widget-abi-2"
> =20
> +      An alias can also carry a version, using the same syntax as
> +      :term:`RDEPENDS` with the ``=3D`` operator::
> +
> +         RPROVIDES:${PN} =3D "widget-abi (=3D 2)"
> +
> +      Other packages can then depend on a range of versions of the alias=
,

This I understand,

> +      which an alias with the version in its name cannot express::

But this I'm not sure. Are you saying that you cannot write:

  RPROVIDES:${PN} =3D "widget-abi (>=3D 2)"

?

If that's what you wanted to say, maybe I would explain in a separate parag=
raph,
after the RDEPENDS snippet below, with an example. Also, what happens if yo=
u
write the example above? Does the build fail?

> +
> +         RDEPENDS:${PN} =3D "widget-abi (>=3D 2)"
> +
> +      .. note::
> +
> +         Only the :ref:`ref-classes-package_rpm` class writes the versio=
n
> +         into the package metadata. The :ref:`ref-classes-package_ipk` a=
nd
> +         :ref:`ref-classes-package_deb` classes drop it and provide the =
bare
> +         alias, so a versioned dependency on the alias cannot be relied =
upon
> +         with those package formats.
> +
>     :term:`RRECOMMENDS`
>        A list of packages that extends the usability of a package being
>        built. The package being built does not depend on this list of

Thanks,
Antonin

