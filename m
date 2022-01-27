Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73D22C433EF
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 20:23:37 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.3450.1643315015492061854
 for <docs@lists.yoctoproject.org>;
 Thu, 27 Jan 2022 12:23:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=iFwu5ttK;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1643315017;
  x=1674851017;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=bMiakWZvuBpDsf4D/XNX3NLNTmMNognhm1eIQBh9rFQ=;
  b=iFwu5ttKAZzmpcKhCxzLK2lNCk4LMg+G79Mc3Z2eN6mgfhm+8ArJI/PE
   ba8Y/hMsd1eKr5+PUk0WCYmEhRnqjhltlsHFvk1w2CRS6r1jLcaZTZUvg
   0Lq3zFiJkxF+4xRffi03QI8FnkTQff71EGr5DNmXyZNCBm7rl9Jf7IrKF
   sj5yyw2xBNQ7q8Zja9iETkrJrbo4i45XKf2OEWWp/OQqxsSDcL/5Rn2CL
   uCd3Nd2TT5HZkF1k8bR4jIi6WVZJwUVYDL0pukRVSkV8sXvcn1PBj1U72
   jNs3TM+hlMBXO3XVbsz1sfhYjRHD1EN7NLZp3OPNZNkKl5k5RAXfhwI9r
   g==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	"docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: RE: [docs] [PATCH] manuals: propose https for SSTATE_MIRRORS
Thread-Topic: [docs] [PATCH] manuals: propose https for SSTATE_MIRRORS
Thread-Index: AQHYErc7TrFiOW47yUW3oZKjay83Uqx3UMQw
Date: Thu, 27 Jan 2022 20:23:32 +0000
Message-ID: <eb0beb28b2ce4ee3a342f0e8c49ab98c@axis.com>
References: <20220126131825.1064950-1-michael.opdenacker@bootlin.com>
In-Reply-To: <20220126131825.1064950-1-michael.opdenacker@bootlin.com>
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
 <docs@lists.yoctoproject.org>; Thu, 27 Jan 2022 20:23:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2446

> -----Original Message-----
> From: docs@lists.yoctoproject.org <docs@lists.yoctoproject.org> On Behalf=
 Of Michael Opdenacker
> Sent: den 26 januari 2022 14:18
> To: docs@lists.yoctoproject.org
> Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
> Subject: [docs] [PATCH] manuals: propose https for SSTATE_MIRRORS
>=20
> Both http and https work, but https should raise fewer questions
> from users.
>=20
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/brief-yoctoprojectqs/index.rst      | 4 ++--
>  documentation/overview-manual/concepts.rst        | 2 +-
>  documentation/ref-manual/variables.rst            | 4 ++--
>  documentation/sdk-manual/appendix-customizing.rst | 2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation=
/brief-yoctoprojectqs/index.rst
> index eaacde2d9a..b01fb4d40b 100644
> --- a/documentation/brief-yoctoprojectqs/index.rst
> +++ b/documentation/brief-yoctoprojectqs/index.rst
> @@ -256,12 +256,12 @@ an entire Linux distribution, including the toolcha=
in, from source.
>           BB_SIGNATURE_HANDLER =3D "OEEquivHash"
>           BB_HASHSERVE =3D "auto"
>           BB_HASHSERVE_UPSTREAM =3D "typhoon.yocto.io:8687"
> -         SSTATE_MIRRORS ?=3D "file://.* http://sstate.yoctoproject.org/&=
YOCTO_DOC_VERSION;/PATH;downloadfilename=3DPATH"
> +         SSTATE_MIRRORS ?=3D "file://.* https://sstate.yoctoproject.org/=
&YOCTO_DOC_VERSION;/PATH;downloadfilename=3DPATH"
>=20
>        The above settings assumed the use of Yocto Project &YOCTO_DOC_VER=
SION;.
>        If you are using the development version instead, set :term:`SSTAT=
E_MIRRORS` as follows::
>=20
> -         SSTATE_MIRRORS ?=3D "file://.* http://sstate.yoctoproject.org/d=
ev/PATH;downloadfilename=3DPATH"
> +         SSTATE_MIRRORS ?=3D "file://.* https://sstate.yoctoproject.org/=
dev/PATH;downloadfilename=3DPATH"
>=20
>  #. **Start the Build:** Continue with the following command to build an =
OS
>     image for the target, which is ``core-image-sato`` in this example:
> diff --git a/documentation/overview-manual/concepts.rst b/documentation/o=
verview-manual/concepts.rst
> index 5698d93759..5cb5cb7127 100644
> --- a/documentation/overview-manual/concepts.rst
> +++ b/documentation/overview-manual/concepts.rst
> @@ -1904,7 +1904,7 @@ Behind the scenes, the shared state code works by l=
ooking in
>  shared state files. Here is an example::
>=20
>     SSTATE_MIRRORS ?=3D "\
> -       file://.* http://someserver.tld/share/sstate/PATH;downloadfilenam=
e=3DPATH \n \
> +       file://.* https://someserver.tld/share/sstate/PATH;downloadfilena=
me=3DPATH \n \

You might want to take this opportunity to remove the no longer=20
needed \n from all these examples.

>         file://.* file:///some/local/dir/sstate/PATH"
>=20
>  .. note::
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index adb104e202..d4f40b6929 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -7196,7 +7196,7 @@ system and gives an overview of their function and =
contents.
>        following maps the local search path ``universal-4.9`` to the
>        server-provided path server_url_sstate_path::
>=20
> -         SSTATE_MIRRORS ?=3D "file://universal-4.9/(.*) http://server_ur=
l_sstate_path/universal-4.8/\1 \n"
> +         SSTATE_MIRRORS ?=3D "file://universal-4.9/(.*) https://server_u=
rl_sstate_path/universal-4.8/\1 \n"

Here it is even inconsistent as this example has a \n at the=20
end of the value, which the other examples do not.

>=20
>        If a mirror uses the same structure as
>        :term:`SSTATE_DIR`, you need to add "PATH" at the
> @@ -7205,7 +7205,7 @@ system and gives an overview of their function and =
contents.
>        ::
>=20
>           SSTATE_MIRRORS ?=3D "\
> -             file://.* http://someserver.tld/share/sstate/PATH;downloadf=
ilename=3DPATH \n \
> +             file://.* https://someserver.tld/share/sstate/PATH;download=
filename=3DPATH \n \
>               file://.* file:///some-local-dir/sstate/PATH"
>=20
>     :term:`SSTATE_SCAN_FILES`
> diff --git a/documentation/sdk-manual/appendix-customizing.rst b/document=
ation/sdk-manual/appendix-customizing.rst
> index cac199bf7a..f8e56477f3 100644
> --- a/documentation/sdk-manual/appendix-customizing.rst
> +++ b/documentation/sdk-manual/appendix-customizing.rst
> @@ -264,7 +264,7 @@ source, you need to do a number of things:
>     to find the configuration. The variable you need to set is
>     :term:`SSTATE_MIRRORS`::
>=20
> -      SSTATE_MIRRORS =3D "file://.* http://example.com/some_path/sstate-=
cache/PATH"
> +      SSTATE_MIRRORS =3D "file://.* https://example.com/some_path/sstate=
-cache/PATH"
>=20
>     You can set the :term:`SSTATE_MIRRORS` variable in two different plac=
es:
>=20
> --
> 2.25.1

//Peter


