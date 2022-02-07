Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7216C433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 15:43:19 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.413.1644248597471428472
 for <docs@lists.yoctoproject.org>;
 Mon, 07 Feb 2022 07:43:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=HAYL0h+Y;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1644248597;
  x=1675784597;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=xTiYqJHVTg0pXp9iTtcombYK5NRWWTCxn0KKPwQ3LgA=;
  b=HAYL0h+Yb5D2V22ing8MkOXjGqD62wLcOYwOpHw89bwMLDCZn5koBuv1
   7LVEymZoe5xMEwuiFL/yCpzjsUhtPCZU/8/ABmWezWPDc+GGLe7zium8c
   w665p3gXGj4A/0c3h62RA1Uepo7TF7HApYZGupLK9KEiLH0j+p6ZqFrOP
   oVAkyOAAdq+8JaEYFsBN+XM+ziUtsirl/kXJobfdFQO0rSIRZp4Fy5Je4
   TlaXhsms5jxqbBhPZPadfltkfncIN+LPubAAhkAqeW3E3hrI//mxUR43D
   DQRNaxGf+t4mEC2hr57Rj0Wf4KXfN7HP2DgqdfNcMqQiFQu/ME4dPBMXX
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Saul Wold <Saul.Wold@windriver.com>, "docs@lists.yoctoproject.org"
	<docs@lists.yoctoproject.org>
Subject: RE: [docs] [PATCH v2] documentation: Update for skip_recipe rename
Thread-Topic: [docs] [PATCH v2] documentation: Update for skip_recipe rename
Thread-Index: AQHYGgUPjL/VjDWpNE+8CRBNNtfSJKyIPeJw
Date: Mon, 7 Feb 2022 15:43:14 +0000
Message-ID: <9dbeeadb51714b6b97e9f7972dd06307@axis.com>
References: <20220204202258.141312-1-saul.wold@windriver.com>
In-Reply-To: <20220204202258.141312-1-saul.wold@windriver.com>
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
 <docs@lists.yoctoproject.org>; Mon, 07 Feb 2022 15:43:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2464

> -----Original Message-----
> From: docs@lists.yoctoproject.org <docs@lists.yoctoproject.org> On Behalf=
 Of Saul Wold
> Sent: den 4 februari 2022 21:23
> To: docs@lists.yoctoproject.org
> Cc: Saul Wold <saul.wold@windriver.com>
> Subject: [docs] [PATCH v2] documentation: Update for skip_recipe rename
>=20
> This change better aligns the name of the variable with it's
> purpose. Since we removed the odler class, the associated

odler -> older

> documentation is also removed.
>=20
> Signed-off-by: Saul Wold <saul.wold@windriver.com>
> ---
>  .../migration-guides/migration-3.5.rst        |  8 +++++++
>  documentation/ref-manual/classes.rst          | 17 -------------
>  documentation/ref-manual/variables.rst        | 24 +++++++++----------
>  3 files changed, 20 insertions(+), 29 deletions(-)
>=20
> diff --git a/documentation/migration-guides/migration-3.5.rst b/documenta=
tion/migration-guides/migration-3.5.rst
> index 8c2a7d2c65..29ce6fe14b 100644
> --- a/documentation/migration-guides/migration-3.5.rst
> +++ b/documentation/migration-guides/migration-3.5.rst
> @@ -54,3 +54,11 @@ Recipe changes
>  - :ref:`allarch <ref-classes-allarch>` packagegroups can no longer depen=
d on packages
>    which use :term:`PKG` renaming such as :ref:`ref-classes-debian`.
>=20
> +bbclass changes
> +---------------
> +
> +- blacklist.bbclass is removed and the fucntionality moved to base.bbcla=
ss

fucntionality -> functionality

> +  with a more descriptive ``varflag`` named SKIP_RECIPE which will use t=
he
> +  SkipRecipe() function. The usage will remain the same:
> +
> +        SKIP_RECIPE[my-recipe] =3D "Reason for skipping recipe"
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-man=
ual/classes.rst
> index 949217bf42..8444fa4621 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -208,23 +208,6 @@ scripts to be disabled should be specified using the
>  :term:`BINCONFIG` variable within the recipe inheriting
>  the class.
>=20
> -.. _ref-classes-blacklist:
> -
> -``blacklist.bbclass``
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -The ``blacklist`` class prevents the OpenEmbedded build system from
> -building specific recipes. To use this class, inherit
> -the class globally and set :term:`PNBLACKLIST` for
> -each recipe you wish to ignore. Specify the :term:`PN`
> -value as a variable flag (varflag) and provide a reason, which is
> -reported, if the package is requested to be built as the value. For
> -example, if you want to ignore a recipe called "exoticware", you
> -add the following to your ``local.conf`` or distribution configuration::
> -
> -   INHERIT +=3D "blacklist"
> -   PNBLACKLIST[exoticware] =3D "Not supported by our organization."
> -
>  .. _ref-classes-buildhistory:
>=20
>  ``buildhistory.bbclass``
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index d4f40b6929..23f55b1d67 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -5683,18 +5683,6 @@ system and gives an overview of their function and=
 contents.
>        packages for the target and for Multilib, :term:`PN` would be ``ba=
sh``
>        and ``lib64-bash``, respectively.
>=20
> -   :term:`PNBLACKLIST`
> -      Lists recipes you do not want the OpenEmbedded build system to bui=
ld.
> -      This variable works in conjunction with the
> -      :ref:`blacklist <ref-classes-blacklist>` class, which is inherited
> -      globally.
> -
> -      To prevent a recipe from being built, use the :term:`PNBLACKLIST`
> -      variable in your ``local.conf`` file. Here is an example that
> -      prevents ``myrecipe`` from being built::
> -
> -         PNBLACKLIST[myrecipe] =3D "Not supported by our organization."
> -
>     :term:`POPULATE_SDK_POST_HOST_COMMAND`
>        Specifies a list of functions to call once the OpenEmbedded build
>        system has created the host part of the SDK. You can specify
> @@ -6929,6 +6917,18 @@ system and gives an overview of their function and=
 contents.
>=20
>           SKIP_FILEDEPS =3D "1"
>=20
> +   :term:`SKIP_RECIPE`
> +      Used to prevent the OpenEmbedded build system from building a give=
n
> +      recipe. Specify the :term:`PN` value as a variable flag (``varflag=
``)
> +      and provide a reason, which will be reported when attempting to
> +      build the recipe.
> +
> +      To prevent a recipe from being built, use the :term:`SKIP_RECIPE`
> +      variable in your ``local.conf`` file or distribution configuration=
.
> +      Here is an example which prevents ``myrecipe`` from being built::
> +
> +         SKIP_RECIPE[myrecipe] =3D "Not supported by our organization."
> +
>     :term:`SOC_FAMILY`
>        Groups together machines based upon the same family of SOC (System=
 On
>        Chip). You typically set this variable in a common ``.inc`` file t=
hat
> --
> 2.31.1

//Peter


