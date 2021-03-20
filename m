Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.2337.1616238992737180382
 for <docs@lists.yoctoproject.org>;
 Sat, 20 Mar 2021 04:16:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.197, mailfrom: foss@0leil.net)
X-Originating-IP: 80.110.100.75
Received: from [127.0.0.1] (80-110-100-75.cgn.dynamic.surfer.at [80.110.100.75])
	(Authenticated sender: foss@0leil.net)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 0BEB91C0005;
	Sat, 20 Mar 2021 11:16:29 +0000 (UTC)
Date: Sat, 20 Mar 2021 11:16:26 +0000
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org,
 Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: Re: [docs] [PATCH 1/1] Update documentation URL
In-Reply-To: <20210319181321.45758-2-michael.opdenacker@bootlin.com>
References: <20210319181321.45758-1-michael.opdenacker@bootlin.com> <20210319181321.45758-2-michael.opdenacker@bootlin.com>
Message-ID: <099D8738-5946-4A6B-8A31-C575E7B77F4E@0leil.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On March 19, 2021 6:13:22 PM UTC, Michael Opdenacker <michael=2Eopdenacker=
@bootlin=2Ecom> wrote:
>Signed-off-by: Michael Opdenacker <michael=2Eopdenacker@bootlin=2Ecom>
>---
> README                                       | 2 +-
> documentation/brief-yoctoprojectqs/index=2Erst | 2 +-
> 2 files changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/README b/README
>index bab81057f=2E=2Eb3836baba 100644
>--- a/README
>+++ b/README
>@@ -5,7 +5,7 @@ This repository contains documentation materials for a va=
riety of the Yocto
> Project components=2E In particular see the README under documentation/=
=2E
>=20
> An online version of the documentation can be found at:
>-    http://yoctoproject=2Eorg/documentation
>+    https://docs=2Eyoctoproject=2Eorg
>=20
> Where to Send Patches
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>diff --git a/documentation/brief-yoctoprojectqs/index=2Erst b/documentati=
on/brief-yoctoprojectqs/index=2Erst
>index 63083cb13=2E=2E11d8766ab 100644
>--- a/documentation/brief-yoctoprojectqs/index=2Erst
>+++ b/documentation/brief-yoctoprojectqs/index=2Erst
>@@ -189,7 +189,7 @@ an entire Linux distribution, including the toolchain=
, from source=2E
>=20
>       The Yocto Project has extensive documentation about OE including a=
 reference
>       manual which can be found at:
>-          http://yoctoproject=2Eorg/documentation
>+          https://docs=2Eyoctoproject=2Eorg
>=20

Please use :yocto_docs: extlink here=2E IIRC, :yocto_docs:`/` should do ju=
st fine=2E

You can find the list of our extlinks in documentation/conf=2Epy=2E They c=
an be used in rST files (so your change in README is fine)=2E

>       For more information about OpenEmbedded see their website:
>           http://www=2Eopenembedded=2Eorg

And a free patch here with :oe_home:`/` :)

Thanks for the patch!
Quentin
