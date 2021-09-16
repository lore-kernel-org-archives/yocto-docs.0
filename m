Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web10.7833.1631777523600633063
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Sep 2021 00:32:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.178.230, mailfrom: foss@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 35CB0240009;
	Thu, 16 Sep 2021 07:31:59 +0000 (UTC)
Date: Thu, 16 Sep 2021 09:31:58 +0200
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org,
 Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: Re: [docs] [PATCH v3 3/5] ref-manual: improve "devtool check-upgrade-status" details
In-Reply-To: <20210915175842.2998541-4-michael.opdenacker@bootlin.com>
References: <16A4FF8E231E8D2E.4682@lists.yoctoproject.org> <20210915175842.2998541-1-michael.opdenacker@bootlin.com> <20210915175842.2998541-4-michael.opdenacker@bootlin.com>
Message-ID: <3EAD4F8F-CC3D-4DC2-A92F-EDEF58BBC535@0leil.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On September 15, 2021 7:58:40 PM GMT+02:00, Michael Opdenacker <michael=2E=
opdenacker@bootlin=2Ecom> wrote:
>- Mention "devtool latest-version recipe" to process a single version
>- Explain that the mechanism is controlled by the UPSTREAM_CHECK*
>  variables, which are not referred to anywhere else in the manuals,
>  except in the variable index=2E
>
>Signed-off-by: Michael Opdenacker <michael=2Eopdenacker@bootlin=2Ecom>
>---
> =2E=2E=2E/ref-manual/devtool-reference=2Erst          | 29 +++++++++++++=
------
> documentation/ref-manual/variables=2Erst        |  4 +--
> 2 files changed, 22 insertions(+), 11 deletions(-)
>
>diff --git a/documentation/ref-manual/devtool-reference=2Erst b/documenta=
tion/ref-manual/devtool-reference=2Erst
>index 5fd51569a3=2E=2E2cf9fd43a3 100644
>--- a/documentation/ref-manual/devtool-reference=2Erst
>+++ b/documentation/ref-manual/devtool-reference=2Erst
>@@ -328,12 +328,19 @@ Checking on the Upgrade Status of a Recipe
> Upstream recipes change over time=2E Consequently, you might find that y=
ou
> need to determine if you can upgrade a recipe to a newer version=2E
>=20
>-To check on the upgrade status of a recipe, use the
>-``devtool check-upgrade-status`` command=2E The command displays a table
>-of your current recipe versions, the latest upstream versions, the email
>-address of the recipe's maintainer, and any additional information such
>-as commit hash strings and reasons you might not be able to upgrade a
>-particular recipe=2E
>+To check on the upgrade status of a recipe, you can use the
>+``devtool latest-version recipe`` command, which quickly shows the curre=
nt
>+version and the latest version available upstream=2E To get such informa=
tion
>+for all available recipes, use the ``devtool check-upgrade-status`` comm=
and=2E
>+The command displays a table of your current recipe versions, the latest
>+upstream versions, the email address of the recipe's maintainer, and any
>+additional information such as commit hash strings and reasons you might
>+not be able to upgrade a particular recipe=2E
>+

I am always lost with singular/plural for one thing that applies to each a=
nd every one of a number of items=2E I am not sure "recipe versions" is cor=
rect here=2E I was thinking "recipes version" would match better (one versi=
on per recipe and there are many recipes) but cannot decide =F0=9F=99=83

"""
Each recipe will have its current version and latest upstream version, as =
well as the email of the maintainer and any additional information such as =
the commit hash or reason for not being able to upgrade it, displayed in a =
table=2E
"""

is what I could come up with=2E Hopefully it's a bit clearer to not only m=
e :)


>+This upgrade checking mechanism relies on the optional :term:`UPSTREAM_C=
HECK_URI`,
>+:term:`UPSTREAM_CHECK_REGEX`, :term:`UPSTREAM_CHECK_GITTAGREGEX`,
>+:term:`UPSTREAM_CHECK_COMMITS` and :term:`UPSTREAM_VERSION_UNKNOWN`
>+variables which are defined in package recipes=2E
>=20
> =2E=2E note::
>=20
>@@ -342,9 +349,10 @@ particular recipe=2E
>       file=2E
>=20
>    -  If the recipe is using the :ref:`bitbake:bitbake-user-manual/bitba=
ke-user-manual-fetching:git fetcher (\`\`git://\`\`)`
>-      rather than a
>-      tarball, the commit hash points to the commit that matches the
>-      recipe's latest version tag=2E
>+      rather than a tarball, the commit hash points to the commit that m=
atches
>+      the recipe's latest version tag, or in the absence of suitable tag=
s,
>+      to the latest commit (when :term:`UPSTREAM_CHECK_COMMITS` set to `=
`1``
>+      in the recipe)=2E
>=20
> As with all ``devtool`` commands, you can get help on the individual
> command::
>@@ -393,6 +401,9 @@ satisfied=2E
>    NOTE: busybox 1=2E29=2E2 1=2E30=2E0 Andrej Valek <andrej=2Evalek@siem=
ens=2Ecom>
>    NOTE: dbus-test 1=2E12=2E10 1=2E12=2E12 Chen Qi <Qi=2EChen@windriver=
=2Ecom>
>=20
>+Last but not least, you may set :term:`UPSTREAM_VERSION_UNKNOWN` to ``1`=
`
>+in a recipe when no way is found to determine its latest upstream versio=
n=2E
>+

"""
when there's currently no way to determine=2E=2E=2E
"""
?
> =2E=2E _devtool-upgrading-a-recipe:
>=20
> Upgrading a Recipe
>diff --git a/documentation/ref-manual/variables=2Erst b/documentation/ref=
-manual/variables=2Erst
>index 2342846dc7=2E=2E7545e708c6 100644
>--- a/documentation/ref-manual/variables=2Erst
>+++ b/documentation/ref-manual/variables=2Erst
>@@ -8534,9 +8534,9 @@ system and gives an overview of their function and =
contents=2E
>       You can perform a per-recipe check for what the latest upstream
>       source code version is by calling ``devtool latest-version recipe`=
`=2E
>       If no combination of the :term:`UPSTREAM_CHECK_URI`, :term:`UPSTRE=
AM_CHECK_REGEX`,
>-      `UPSTREAM_CHECK_GITTAGREGEX` and :term:`UPSTREAM_CHECK_COMMITS` va=
riables in
>+      :term:`UPSTREAM_CHECK_GITTAGREGEX` and :term:`UPSTREAM_CHECK_COMMI=
TS` variables in
>       the recipe allows to determine such an latest upstream version,
>-      you can set :term:`UPSTREAM_VERSION_UNKNOWN`` to ``1`` in the reci=
pe
>+      you can set :term:`UPSTREAM_VERSION_UNKNOWN` to ``1`` in the recip=
e

This one typo fix should be in the commit that introduces it :)

Cheers,
Quentin

>       to acknowledge that the check cannot be performed=2E
>       ::
>=20
