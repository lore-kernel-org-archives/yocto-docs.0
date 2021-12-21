Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3B0EC433F5
	for <webhook@archiver.kernel.org>; Tue, 21 Dec 2021 23:58:07 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.13189.1640131086144976376
 for <docs@lists.yoctoproject.org>;
 Tue, 21 Dec 2021 15:58:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=f3RX+IlV;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1640131086;
  x=1671667086;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=gzEBhm9lxqQTR36RbIkapZ742DH2k75xiD2J8a6Egl8=;
  b=f3RX+IlVEgjVXMSEOqgCiFYzfgWLwAq6K52ALSopDDOnvQKI9v87OpkA
   vOTTo9LKRACtVhJ3tZ0aydkTcZ9T+g0V71Mty0t6FiHUOKKMhkq7IPJrB
   CoRsukdj8nZzNLUCwD3xppCu7DNIQlJtFJOlVdF3Bm0nTdEAtf5lIjwzY
   StSTpRHz0Z+V5qxIau9gkfKaTZOsqqEGmBv6e5VXDi9WFJ2ve0vGTmCZi
   XcLdeH+iMiPyqgslzZMavPo0VqG0WcuQuL7QIHRgaXcfZiDo6XmLpEmRg
   7n+BfwW3cDTkry5hMWKlD1YRFYz+TPzAtO7V0bVS9/lLUOVCnRx56ak43
   Q==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	"docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: RE: [docs] [PATCH] migration-guides: prepare for release 3.5
Thread-Topic: [docs] [PATCH] migration-guides: prepare for release 3.5
Thread-Index: AQHX808COkXV8nMIzUGptZhoGcqh3aw9pIdw
Date: Tue, 21 Dec 2021 23:58:03 +0000
Message-ID: <ed5fd1af7a794962af93ca5913990c63@axis.com>
References: <20211217140415.49840-1-michael.opdenacker@bootlin.com>
In-Reply-To: <20211217140415.49840-1-michael.opdenacker@bootlin.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 21 Dec 2021 23:58:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2320

> -----Original Message-----
> From: docs@lists.yoctoproject.org <docs@lists.yoctoproject.org> On Behalf=
 Of Michael Opdenacker
> Sent: den 17 december 2021 15:04
> To: docs@lists.yoctoproject.org
> Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
> Subject: [docs] [PATCH] migration-guides: prepare for release 3.5
>=20
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/migration-guides/index.rst      |  1 +
>  .../migration-guides/migration-3.5.rst        | 37 +++++++++++++++++++
>  2 files changed, 38 insertions(+)
>  create mode 100644 documentation/migration-guides/migration-3.5.rst
>=20
> diff --git a/documentation/migration-guides/index.rst b/documentation/mig=
ration-guides/index.rst
> index 287b553195..6472cc2848 100644
> --- a/documentation/migration-guides/index.rst
> +++ b/documentation/migration-guides/index.rst
> @@ -12,6 +12,7 @@ to move to one release of the Yocto Project from the pr=
evious one.
>  .. toctree::
>=20
>     migration-general
> +   migration-3.5
>     migration-3.4
>     migration-3.3
>     migration-3.2
> diff --git a/documentation/migration-guides/migration-3.5.rst b/documenta=
tion/migration-guides/migration-3.5.rst
> new file mode 100644
> index 0000000000..c63c9dff05
> --- /dev/null
> +++ b/documentation/migration-guides/migration-3.5.rst
> @@ -0,0 +1,37 @@
> +Release 3.5 (kirkstone)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This section provides migration information for moving to the Yocto
> +Project 3.5 Release (codename "kirkstone") from the prior release.
> +
> +Recipe changes
> +--------------
> +
> +- Because of the uncertainty in future default branch names in git repos=
itories,
> +  it is now required to add a branch name to all URLs described
> +  by ``git://`` and ``gitsm://`` :term:`SRC_URI` entries. For example::
> +
> +     SRC_URI =3D "git://git.denx.de/u-boot.git;branch=3Dmaster"
> +
> +  A :oe_git:`convert-srcuri </openembedded-core/tree/scripts/contrib/con=
vert-srcuri.py>`
> +  script to convert your recipes is available in :term:`OpenEmbedded-Cor=
e (OE-Core)`
> +  and in :term:`Poky`.
> +
> +- Because of `GitHub dropping support for the git:
> +  protocol <https://github.blog/2021-09-01-improving-git-protocol-securi=
ty-github/>`,
> +  recipes now need to use ``;protocol=3Dhttps`` at the end of GitHub
> +  URLs. The same script as above can be used to convert the recipes.
> +
> +- The :term:`TOPDIR` variable and the current working directory are no l=
onger modified
> +  when parsing recipes. Any code depending on that behaviour will no lon=
ger worked as

Change "worked" to "work".

> +  expected (we don't know of any).
> +
> +- BitBake no longer supports ``append``, ``prepend`` and ``remove`` oper=
ators
> +  combined with the ``+=3D``, ``=3D+``, ``.=3D``, ``=3D.`` and ``?=3D`` =
operators.
> +  Such operations should be made using ``=3D`` alone. This means that
> +  a leading space may need to be explicitly added.
> +
> +- :ref:`allarch <ref-classes-allarch>` packagegroups can no longer depen=
d on packages
> +  which use ``PKG:xxx`` renaming such as :ref:`debian.bbclass <ref-class=
es-debian>`.
> +  Doing this will produce an error.
> +
> --
> 2.25.1

//Peter


