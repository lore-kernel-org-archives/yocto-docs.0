Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64A24C636CC
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 18:53:12 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.19037.1676573586259684152
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Feb 2023 10:53:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=ChaaIz6g;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1676573587;
  x=1708109587;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=tLbbaWzn3WK8JlXvlSPMZWCOik0F4Ss8ifOk7VEyqa4=;
  b=ChaaIz6gfj7zco49MN8K+WGJbzkCS/Msw3JzzRFlEtJ0pR2Py4MLClc0
   8h3MAc3GY4ECrxr+b1N0fhxMakVUoB73z9NUJk9CjUrG5aE19DfvdJKU3
   p9W/QviD2JzRG4pidknmXx/Jhgw+pYLN1CnxvqCGVV0gL9FywF6z1dNDP
   VDYIR0RJsAAn1/jmvdM8zplw79n2HWQ++GrjRRhgLQ3BRS+W6G8cUgPk2
   Lq+GKhERkIN5AHmcs4uE4e7nPk3uWtssan7snTcQNsb0wsE6HhTXIXypb
   gR04BAARbc7clUwbq5aE6kR/1YW0rGWByPvno1R0dqIeqmOGpt7CMTPbo
   w==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "michael.opdenacker@bootlin.com" <michael.opdenacker@bootlin.com>,
	"docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: RE: [docs] [PATCH] ref-manual: document meson class and EXTRA_OEMESON
 variable
Thread-Topic: [docs] [PATCH] ref-manual: document meson class and
 EXTRA_OEMESON variable
Thread-Index: AQHZQhAfcBaZcU4XPUax8dzOqq+nWK7R6akw
Date: Thu, 16 Feb 2023 18:52:59 +0000
Message-ID: <54ef2f3b5b1e433d8d79dfed86996338@axis.com>
References: <20230216140811.2383941-1-michael.opdenacker@bootlin.com>
In-Reply-To: <20230216140811.2383941-1-michael.opdenacker@bootlin.com>
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
 <docs@lists.yoctoproject.org>; Thu, 16 Feb 2023 18:53:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3695

> -----Original Message-----
> From: docs@lists.yoctoproject.org <docs@lists.yoctoproject.org> On Behalf=
 Of Michael Opdenacker via lists.yoctoproject.org
> Sent: den 16 februari 2023 15:08
> To: docs@lists.yoctoproject.org
> Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
> Subject: [docs] [PATCH] ref-manual: document meson class and EXTRA_OEMESO=
N variable
>=20
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>=20
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/ref-manual/classes.rst   | 10 ++++++++++
>  documentation/ref-manual/variables.rst | 11 +++++++++++
>  2 files changed, 21 insertions(+)
>=20
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-man=
ual/classes.rst
> index b5443c0d0a..b34c966788 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -1648,6 +1648,16 @@ messages for various BitBake severity levels (i.e.=
 ``bbplain``,
>  This class is enabled by default since it is inherited by the :ref:`ref-=
classes-base`
>  class.
>=20
> +.. _ref-classes-meson:
> +
> +``meson``
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The :ref:`ref-classes-meson` class allows to create recipes that build s=
oftware
> +using the `Meson <https://mesonbuild.com/>`__ build system. You can use
> +the :term:`EXTRA_OEMESON` variable to specify additional configuration o=
ptions
> +to be passed using the ``meson`` command line.
> +
>  .. _ref-classes-metadata_scm:
>=20
>  ``metadata_scm``
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index 62176f7ee8..877ea20b47 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -2528,6 +2528,17 @@ system and gives an overview of their function and=
 contents.
>        variable specifies additional configuration options you want to pa=
ss
>        to the ``scons`` command line.
>=20
> +   :term:`EXTRA_OEMESON`
> +      Additional `Meson <https://mesonbuild.com/>`__ options. See the
> +      :ref:`ref-classes-meson` class for additional information.
> +
> +      In addition to standard Meson options, such options correspond

Change "correspond" to "correspond to".

> +      `Meson build options <https://mesonbuild.com/Build-options.html>`_=
_
> +      defined in the ``meson_options.txt`` file in the sources to build.
> +      Here is an example::
> +
> +         EXTRA_OEMESON =3D "-Dpython=3Ddisabled -Dvalgrind=3Ddisabled"
> +

You might also want to add a definition of the MESON_BUILDTYPE variable,=20
which defaults to `debug` or `plain` depending on if DEBUG_BUILD is set=20
or not, but can be set by the recipe.=20

>     :term:`EXTRA_USERS_PARAMS`
>        When inheriting the :ref:`ref-classes-extrausers`
>        class, this variable provides image level user and group operation=
s.
> --
> 2.37.2

//Peter


