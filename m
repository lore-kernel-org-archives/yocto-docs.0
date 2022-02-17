Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 244B6C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 09:50:26 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.5488.1645091424701465444
 for <docs@lists.yoctoproject.org>;
 Thu, 17 Feb 2022 01:50:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=MZJKzLhe;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1645091425;
  x=1676627425;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=OeKUTKtMVByMPmB9ukMrdupbmZJwMUEiXj8lDoUQ2rE=;
  b=MZJKzLhe4EmRTw4rSdHg/v7I9cpZ9A/wBIF1GXA6xUh+oW6yjxFN+z+A
   tHmryTge1axGqRsUb5TYGbuWpEvVhAjf80ryxDeF0gdTp+NsuIxVTabFI
   cLrPp34LVee8KQFERKGdXWctgYJzQrxz7qxmkHxz6xe1mrlyRiuMr0les
   FuQupIQDoVUvXNKsCzoBN1C77t3heF4ahHDlnwJwbobqZtooMwQH0+Lua
   A19SQKdXl4BGdxxAyYmgep8LQnJfLeKchOmBOll9FYgbw3HpwUrI6ytsr
   26GTmBJCUud6SEGJeYfWH50YCYfDfiQ0Nv74jgVVP1EW7kDxCcRZb+QOt
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: RE: [docs] [PATCH 1/2] manuals: Remove unnecessary \n from
 SSTATE_MIRRORS examples
Thread-Topic: [docs] [PATCH 1/2] manuals: Remove unnecessary \n from
 SSTATE_MIRRORS examples
Thread-Index: AQHYFLeVM9VSRjTN+kyVjdwbMLYseqyXneZA
Date: Thu, 17 Feb 2022 09:49:57 +0000
Message-ID: <a12fcb16fb6046f5a0791d0f8b906ce6@axis.com>
References: <16CE9CA9EE8EA8EA.2700@lists.yoctoproject.org>
In-Reply-To: <16CE9CA9EE8EA8EA.2700@lists.yoctoproject.org>
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
 <docs@lists.yoctoproject.org>; Thu, 17 Feb 2022 09:50:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2470

*ping*

//Peter

> -----Original Message-----
> From: docs@lists.yoctoproject.org <docs@lists.yoctoproject.org> On Behalf
> Of Peter Kjellerstedt
> Sent: den 29 januari 2022 03:26
> To: docs@lists.yoctoproject.org
> Subject: [docs] [PATCH 1/2] manuals: Remove unnecessary \n from
> SSTATE_MIRRORS examples
>=20
> Since commit 044fb04d in bitbake (fetch2: Allow whitespace only mirror
> entries) there is no need to separate the entries in SSTATE_MIRRORS
> with "\n".
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  documentation/overview-manual/concepts.rst | 2 +-
>  documentation/ref-manual/variables.rst     | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/documentation/overview-manual/concepts.rst
> b/documentation/overview-manual/concepts.rst
> index 5698d93759..a6bd32a987 100644
> --- a/documentation/overview-manual/concepts.rst
> +++ b/documentation/overview-manual/concepts.rst
> @@ -1904,7 +1904,7 @@ Behind the scenes, the shared state code works by
> looking in
>  shared state files. Here is an example::
>=20
>     SSTATE_MIRRORS ?=3D "\
> -       file://.*
> http://someserver.tld/share/sstate/PATH;downloadfilename=3DPATH \n \
> +       file://.*
> http://someserver.tld/share/sstate/PATH;downloadfilename=3DPATH \
>         file://.* file:///some/local/dir/sstate/PATH"
>=20
>  .. note::
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-
> manual/variables.rst
> index b0621168ae..456d9ce098 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -7198,7 +7198,7 @@ system and gives an overview of their function and
> contents.
>        following maps the local search path ``universal-4.9`` to the
>        server-provided path server_url_sstate_path::
>=20
> -         SSTATE_MIRRORS ?=3D "file://universal-4.9/(.*)
> http://server_url_sstate_path/universal-4.8/\1 \n"
> +         SSTATE_MIRRORS ?=3D "file://universal-4.9/(.*)
> http://server_url_sstate_path/universal-4.8/\1"
>=20
>        If a mirror uses the same structure as
>        :term:`SSTATE_DIR`, you need to add "PATH" at the
> @@ -7207,7 +7207,7 @@ system and gives an overview of their function and
> contents.
>        ::
>=20
>           SSTATE_MIRRORS ?=3D "\
> -             file://.*
> http://someserver.tld/share/sstate/PATH;downloadfilename=3DPATH \n \
> +             file://.*
> http://someserver.tld/share/sstate/PATH;downloadfilename=3DPATH \
>               file://.* file:///some-local-dir/sstate/PATH"
>=20
>     :term:`SSTATE_SCAN_FILES`

