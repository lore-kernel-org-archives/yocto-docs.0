Return-Path: <abongwabonalais@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5F37C6370D
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:46 +0000 (UTC)
Subject: Re: [PATCH] Add more precise directory for local.conf,
 changing it from local.conf to conf/local.conf
To: docs@lists.yoctoproject.org
From: "Abongwa Amahnui Bonalais" <abongwabonalais@gmail.com>
X-Originating-Location: CM (154.72.153.150)
X-Originating-Platform: Android Phone Chrome 100
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 04 Apr 2022 05:02:55 -0700
References: <20220404115812.5145-1-abongwabonalais@gmail.com>
In-Reply-To: <20220404115812.5145-1-abongwabonalais@gmail.com>
Message-ID: <15988.1649073775154251625@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="mvwtLHRUJHCL8QHEsmkA"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 04 Apr 2022 18:46:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2751

--mvwtLHRUJHCL8QHEsmkA
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 4, 2022 at 12:58 PM, Abongwa Amahnui Bonalais wrote:

>=20
> Signed-off-by: Abongwa Bonalais Amahnui <abongwabonalais@gmail.com>
> ---
> documentation/brief-yoctoprojectqs/index.rst | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/documentation/brief-yoctoprojectqs/index.rst
> b/documentation/brief-yoctoprojectqs/index.rst
> index ad5d8a950..12cab1db7 100644
> --- a/documentation/brief-yoctoprojectqs/index.rst
> +++ b/documentation/brief-yoctoprojectqs/index.rst
> @@ -250,7 +250,7 @@ an entire Linux distribution, including the toolchain=
,
> from source.
> This is relevant only when your network and the server that you use
> can download these artifacts faster than you would be able to build them.
>=20
> - To use such mirrors, uncomment the below lines in your ``local.conf``
> + To use such mirrors, uncomment the below lines in your
> ``conf/local.conf``
> file in the :term:`Build Directory`::
>=20
> BB_SIGNATURE_HANDLER =3D "OEEquivHash"
> --
> 2.25.1

Hello Schulz, this is an updated patch following the instructions you gave

--mvwtLHRUJHCL8QHEsmkA
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 4, 2022 at 12:58 PM, Abongwa Amahnui Bonalais wrote:<br />
<blockquote>Signed-off-by: Abongwa Bonalais Amahnui &lt;abongwabonalais@gma=
il.com&gt;<br />---<br />documentation/brief-yoctoprojectqs/index.rst | 2 +=
-<br />1 file changed, 1 insertion(+), 1 deletion(-)<br /><br />diff --git =
a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctop=
rojectqs/index.rst<br />index ad5d8a950..12cab1db7 100644<br />--- a/docume=
ntation/brief-yoctoprojectqs/index.rst<br />+++ b/documentation/brief-yocto=
projectqs/index.rst<br />@@ -250,7 +250,7 @@ an entire Linux distribution, =
including the toolchain, from source.<br />This is relevant only when your =
network and the server that you use<br />can download these artifacts faste=
r than you would be able to build them.<br /><br />- To use such mirrors, u=
ncomment the below lines in your ``local.conf``<br />+ To use such mirrors,=
 uncomment the below lines in your ``conf/local.conf``<br />file in the :te=
rm:`Build Directory`::<br /><br />BB_SIGNATURE_HANDLER =3D "OEEquivHash"<br=
 />-- <br />2.25.1</blockquote>
<br />&nbsp;Hello Schulz, this is an updated patch following the instructio=
ns you gave

--mvwtLHRUJHCL8QHEsmkA--

