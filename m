Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web08.7706.1631776451585036162
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Sep 2021 00:14:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.199, mailfrom: foss@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 626C5FF80E;
	Thu, 16 Sep 2021 07:14:09 +0000 (UTC)
Date: Thu, 16 Sep 2021 09:14:08 +0200
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org,
 Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: Re: [docs] [PATCH v3 1/5] ref-manual: document UPSTREAM_CHECK_COMMITS and UPSTREAM_VERSION_UNKNOWN
In-Reply-To: <20210915175842.2998541-2-michael.opdenacker@bootlin.com>
References: <16A4FF8E231E8D2E.4682@lists.yoctoproject.org> <20210915175842.2998541-1-michael.opdenacker@bootlin.com> <20210915175842.2998541-2-michael.opdenacker@bootlin.com>
Message-ID: <6D0567BB-0803-4839-83B4-99A9F82C1539@0leil.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On September 15, 2021 7:58:38 PM GMT+02:00, Michael Opdenacker <michael=2E=
opdenacker@bootlin=2Ecom> wrote:
>Signed-off-by: Michael Opdenacker <michael=2Eopdenacker@bootlin=2Ecom>
>---
> documentation/ref-manual/variables=2Erst | 24 ++++++++++++++++++++++++
> 1 file changed, 24 insertions(+)
>
>diff --git a/documentation/ref-manual/variables=2Erst b/documentation/ref=
-manual/variables=2Erst
>index 5caada6260=2E=2Ed06ef5a632 100644
>--- a/documentation/ref-manual/variables=2Erst
>+++ b/documentation/ref-manual/variables=2Erst
>@@ -8483,6 +8483,18 @@ system and gives an overview of their function and=
 contents=2E
>       install initscripts package them in the main package for the recip=
e,
>       you rarely need to set this variable in individual recipes=2E
>=20
>+   :term:`UPSTREAM_CHECK_COMMITS`
>+      You can perform a per-recipe check for what the latest upstream
>+      source code version is by calling ``devtool latest-version recipe`=
`=2E If
>+      the recipe source code is provided from Git repositories, but
>+      releases are not identified by Git tags, set :term:`UPSTREAM_CHECK=
_COMMITS`
>+      to ``1`` in the recipe, and the OpenEmbedded build system
>+      will compare the latest commit with the one currently specified
>+      by the recipe (:term:`SRCREV`)=2E
>+      ::
>+
>+         UPSTREAM_CHECK_COMMITS =3D "1"
>+
>    :term:`UPSTREAM_CHECK_GITTAGREGEX`
>       You can perform a per-recipe check for what the latest upstream
>       source code version is by calling ``bitbake -c checkpkg`` recipe=
=2E If
>@@ -8518,6 +8530,18 @@ system and gives an overview of their function and=
 contents=2E
>=20
>          UPSTREAM_CHECK_URI =3D "recipe_url"
>=20
>+   :term:`UPSTREAM_VERSION_UNKNOWN`
>+      You can perform a per-recipe check for what the latest upstream
>+      source code version is by calling ``devtool latest-version recipe`=
`=2E
>+      If no combination of the :term:`UPSTREAM_CHECK_URI`, :term:`UPSTRE=
AM_CHECK_REGEX`,
>+      `UPSTREAM_CHECK_GITTAGREGEX` and :term:`UPSTREAM_CHECK_COMMITS` va=
riables in
>+      the recipe allows to determine such an latest upstream version,

"allows to determine what the latest upstream version is,"
?

>+      you can set :term:`UPSTREAM_VERSION_UNKNOWN`` to ``1`` in the reci=
pe

Spurious tick quote after the term reference=2E

Looks good otherwise, thanks!
Quentin

>+      to acknowledge that the check cannot be performed=2E
>+      ::
>+
>+         UPSTREAM_VERSION_UNKNOWN =3D "1"
>+
>    :term:`USE_DEVFS`
>       Determines if ``devtmpfs`` is used for ``/dev`` population=2E The
>       default value used for :term:`USE_DEVFS` is "1" when no value is
