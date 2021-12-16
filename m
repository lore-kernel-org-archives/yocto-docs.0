Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EF4BC433FE
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 17:37:30 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web08.13689.1639676249011499161
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Dec 2021 09:37:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.178.230,
 mailfrom: foss@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 7BFE4240008;
	Thu, 16 Dec 2021 17:37:25 +0000 (UTC)
Date: Thu, 16 Dec 2021 18:37:23 +0100
From: Quentin Schulz <foss@0leil.net>
To: docs@lists.yoctoproject.org, Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: Re: [docs] [PATCH 1/2] ref-manual: add overlayfs-etc class
In-Reply-To: <20211215171138.127272-1-uvv.mail@gmail.com>
References: <20211215171138.127272-1-uvv.mail@gmail.com>
Message-ID: <C97BA46D-92DD-4A26-871C-D0991A67E1E8@0leil.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Dec 2021 17:37:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2294

Hi Vyacheslav,

On December 15, 2021 6:11:37 PM GMT+01:00, Vyacheslav Yurkov <uvv=2Email@g=
mail=2Ecom> wrote:
>Signed-off-by: Vyacheslav Yurkov <uvv=2Email@gmail=2Ecom>
>---
> documentation/ref-manual/classes=2Erst | 41 ++++++++++++++++++++++++++++
> 1 file changed, 41 insertions(+)
>
>diff --git a/documentation/ref-manual/classes=2Erst b/documentation/ref-m=
anual/classes=2Erst
>index 2c191f407=2E=2Ea5b01c2cf 100644
>--- a/documentation/ref-manual/classes=2Erst
>+++ b/documentation/ref-manual/classes=2Erst
>@@ -1769,6 +1769,47 @@ to the unit the following::
> =2E=2E note::
>=20
>    The class does not support the ``/etc`` directory itself, because ``s=
ystemd`` depends on it=2E
>+   In order to get ``/etc`` in overlayfs see :ref:`overlayfs-etc <ref-cl=
asses-overlayfs-etc>`=20
>+

Missing dot at the end of the sentence=2E

>+=2E=2E _ref-classes-overlayfs-etc:
>+
>+``overlayfs-etc=2Ebbclass``
>+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>+
>+In order to have ``/etc`` directory in overlayfs a special handling at e=
arly=20
>+boot stage is required=2E  The idea is to supply a custom init script th=
at mounts
>+``/etc`` before launching actual init program, because the latter alread=
y
>+requires ``/etc`` to be mounted
>+

Missing dot at the end of the sentence=2E

>+=2E=2E note::
>+
>+   This class must not be inherited directly=2E Use corresponding IMAGE_=
FEATURE
>+

Missing dot at the end of the sentence=2E

>+Your machine configuration should define at least device, mount point, a=
nd file system type
>+you are going to use for ``overlayfs``::
>+
>+  OVERLAYFS_ETC_MOUNT_POINT =3D "/data"
>+  OVERLAYFS_ETC_DEVICE =3D "/dev/mmcblk0p2"
>+  OVERLAYFS_ETC_FSTYPE ?=3D "ext4"
>+
>+To control more mount options you should consider setting mount options
>+(``defaults`` is used by default)::
>+
>+  OVERLAYFS_ETC_MOUNT_OPTIONS =3D "wsync"
>+
>+The class provides two options for ``/sbin/init`` generation:
>+
>+* Default option is to rename original ``/sbin/init`` to ``/sbin/init=2E=
orig`` and
>+  place generated init under original name, i=2Ee=2E ``/sbin/init``=2E I=
t has an advantage
>+  that you won't need to change any kernel parameters in order to make i=
t work,
>+  but it poses a restriction that package-management can't be used, beca=
ause updating
>+  init manager would remove generated script

What is the default value? This needs to be explicit otherwise it cannot b=
e "undone" in a bbappends for example=2E

Thanks for the patch,
Cheers,
Quentin

>+* If you are would like to keep original init as is, you can set::
>+
>+   OVERLAYFS_ETC_USE_ORIG_INIT_NAME =3D "0"
>+
>+  Then generated init will be named ``/sbin/preinit`` and you would need=
 to extend your
>+  kernel parameters manually in your bootloader configuration=2E
>=20
> =2E=2E _ref-classes-own-mirrors:
>=20

