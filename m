Return-Path: <gavrosc@yahoo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7952BC369CB
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 19:24:47 +0000 (UTC)
Subject: Re: [PATCH] ref-manual/variables.rst: document the INITRAMFS_MAXSIZE variable
To: docs@lists.yoctoproject.org
From: "Christos Gavros" <gavrosc@yahoo.com>
X-Originating-Location: =?UTF-8?B?TWFsbW8sIFNrw6VuZSBDb3VudHksIFNF?= (78.82.187.133)
X-Originating-Platform: Linux Chrome 135
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 23 Apr 2025 12:24:44 -0700
References: <5436.1743603561759061812@lists.yoctoproject.org>
In-Reply-To: <5436.1743603561759061812@lists.yoctoproject.org>
Message-ID: <28281.1745436284133202831@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="OxNvWiio4nvowLGrwZEN"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 23 Apr 2025 19:24:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6779

--OxNvWiio4nvowLGrwZEN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

hi Antonin and Quentin

i had a further look on that.

When initramfs is included in build (INITRAMFS_IMAGE =3D "core-image-minima=
l-initramfs" in local.conf)
then the 'IMAGE_ROOTFS' is pointing to build/tmp/work/qemux86_64-poky-linux=
/core-image-minimal-initramfs/1.0/rootfs.
This directory is approximately 115000kb.
If INITRAMFS_MAXSIZE =3D "1100000" then the error is generated.
If INITRAMFS_MAXSIZE =3D "1600000" then the build is ok.
So i think that the INITRAMFS_MAXSIZE refers to the size of the directory a=
nd not the final image type.

The condition " if image_fstypes =3D=3D initramfs_fstypes !=3D '' =C2=A0and=
 initramfs_maxsize: ", exists
because in the recipe "core-image-minimal-initramfs" there is the assignmen=
t IMAGE_FSTYPES =3D "${INITRAMFS_FSTYPES}".
So the INITRAMFS_MAXSIZE is evaluated only when one of the initramfs recipe=
s is included.

Shall i submit a v2 ?

Br
Christos

--OxNvWiio4nvowLGrwZEN
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div>hi Antonin and Quentin</div>
<div>&nbsp;</div>
<div>i had a further look on that.</div>
<div><br />When initramfs is included in build (INITRAMFS_IMAGE =3D "core-i=
mage-minimal-initramfs" in local.conf)<br />then the 'IMAGE_ROOTFS' is poin=
ting to build/tmp/work/qemux86_64-poky-linux/core-image-minimal-initramfs/1=
.0/rootfs.<br />This directory is approximately 115000kb.<br />If INITRAMFS=
_MAXSIZE =3D "1100000" then the error is generated.<br />If INITRAMFS_MAXSI=
ZE =3D "1600000" then the build is ok.<br />So i think that the INITRAMFS_M=
AXSIZE refers to the size of the directory and not the final image type.</d=
iv>
<div>&nbsp;</div>
<div>The condition " if image_fstypes =3D=3D initramfs_fstypes !=3D '' &nbs=
p;and initramfs_maxsize: ", exists<br />because in the recipe "core-image-m=
inimal-initramfs" there is the assignment IMAGE_FSTYPES =3D "${INITRAMFS_FS=
TYPES}".<br />So the INITRAMFS_MAXSIZE is evaluated only when one of the in=
itramfs recipes is included.</div>
<div>&nbsp;</div>
<div>Shall i submit a v2 ?</div>
<div>&nbsp;</div>
<div>Br<br />Christos</div>
</div>

--OxNvWiio4nvowLGrwZEN--

