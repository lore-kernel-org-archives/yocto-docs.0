Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D58DCCFA09
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 16:33:44 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1764.1762187618730649129
 for <docs@lists.yoctoproject.org>;
 Mon, 03 Nov 2025 08:33:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=cOQraep5;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 71D9D1A1860
	for <docs@lists.yoctoproject.org>; Mon,  3 Nov 2025 16:33:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 476B660628
	for <docs@lists.yoctoproject.org>; Mon,  3 Nov 2025 16:33:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DF98610B50169
	for <docs@lists.yoctoproject.org>; Mon,  3 Nov 2025 17:33:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762187617; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kGpj9YbIu1JYl0xvHnkrfSczCaeMOrearn4lKS63t6s=;
	b=cOQraep5BfLVH7F6+ACVDnm/WLyueub1ZjG3hzR+4tgcwKUHDl9tRDw6qmPA65+bjm0iZ5
	ebKwnTjZTLRqNNA+yN3LCNlSkhwUJCGvdRR99wqsHyMoCmKZaAI95+Wne81LHR3TcyBJ2V
	RhxpBrDRSy8mAEg4tdPnHeaB3IeksoRYYJfQD63i6po5CB/OOXHtdECbIzweFG1QuVE8Iq
	cQAEhp+NhZWnvEQVwXEw4t7f5Qut1LsFM9Z6Bv6aWJAVpdcSMrHsJc+XrL1fkU/hqRJxGS
	aYUwbo6EVwhVOzU7q+GQ2dNpJvzjlKkY54vUj1iPe6HaooNk3eKkE9k9Kx6UWA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 03 Nov 2025 17:33:06 +0100
Subject: [PATCH v2 2/6] ref-manual/structure.rst: document the site.conf
 file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20251103-bitbake-setup-v2-2-89fbb14cfbbd@bootlin.com>
References: <20251103-bitbake-setup-v2-0-89fbb14cfbbd@bootlin.com>
In-Reply-To: <20251103-bitbake-setup-v2-0-89fbb14cfbbd@bootlin.com>
To: docs@lists.yoctoproject.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2177;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=RlLGG7QqyIDv673TmVZfXqhu2AUmWa9mOWK+wBaLUYE=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpCNlefw8sWtYVQPQg8M8/4nwt0cxCqOa4dlsYy
 N84zppVX0GJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaQjZXgAKCRDRgEFAKaOo
 NuBBD/9efcbQDKN4OFXDMUVi31kHY1TNoc+jp6dVlqpwFZgTR+45F3VOtizNy4jabkE0ATnpabE
 2sYAyqjdGWE1JcsMUGgwmdjs6ki3iOX5QskhNiDxFdhUdbxZMoqqKU2/C2+Hzgld+FytxjK/T+h
 ZP0aKfLguOnp9ZZftHuT10NzQ+670UJRDoQUqtP/cYtVgzD+ZRbWL+oUeo4GTvBKuQ7LcOEwnEE
 iAYw9x0PtT657nYD78GdxBhbUljeKSanV5D6KIf7m77diOhVZY1WJVBq668Nih+6Gnzi3kiMlZh
 rPNzqDr0zilyTZM4wEqGJUQgP13ZKVTyvf/O3+sj78UYN/1HiiLRVHXM78wtz1xapvCy3/4VLqf
 w+3TPEyO9AAzs5RtUZP+q0aNb/s+m9oLBUwmhA0fUEEC2xhyFkYcdTEAtEvnJRKXxvDkHEpMbaj
 hNOJ+MEupGC8ZAaIMSfYotLBywbIfAVV7gA9HM6U++sgy/F/fd41RHHh8P6QofNGVy2FzqyYabT
 74cD16HaPVaKFDj26PK1jU487u0W7oii0BVhWlY2YTSt6FPXnng/OskTtXUWC5+/0dZSysefwXW
 6DLqemuyuuHAgTmB0LCFCNbobxo8uMbKi+ldigeX+vvk1n6c8ktkBcF3kmg4a02lSSwz5jgA2/m
 TBfsAPYZQej7NPw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 03 Nov 2025 16:33:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7977

This was not documented and its usage is going to increase massively
once users start using bitbake-setup. Add a description for this file as
well as an example on how bitbake-setup shares it for multiple builds,
to insist on the "site-wide" usage of this file.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Note: a link to bitbake-setup documentation comes in the next patch.
---
 documentation/ref-manual/structure.rst | 29 ++++++++++++++++++++++++++++=
+
 1 file changed, 29 insertions(+)

diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-m=
anual/structure.rst
index a2f2fd450..f0205f0e5 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -343,6 +343,35 @@ Once the build process gets the sample file, it uses=
 ``sed`` to substitute final
    version of the ``bblayers.conf.sample`` file in the ``meta-poky/conf/=
templates/default``
    directory.
=20
+.. _structure-build-conf-site.conf:
+
+``build/conf/site.conf``
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+This configuration file contains the site specific configurations for yo=
ur build
+environment.
+
+You could for example edit this file to limit the number of threads used=
 by
+:term:`BitBake` (:term:`BB_NUMBER_THREADS`) or set the location from whi=
ch you
+want to access downloaded files (:term:`DL_DIR`).
+
+This file can be shared for multiple build directories. For example,
+``bitbake-setup`` makes the :ref:`structure-build-conf-site.conf` file a
+symbolic link to a common ``site.conf`` file::
+
+   =E2=94=9C=E2=94=80=E2=94=80 poky-master-poky-distro_poky-machine_qemu=
x86-64/
+   =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 build/
+   =E2=94=82=C2=A0=C2=A0  =C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 conf/
+   =E2=94=82=C2=A0=C2=A0  =C2=A0=C2=A0  =C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=
=94=80 site.conf -> ../../../site.conf
+   =E2=94=9C=E2=94=80=E2=94=80 poky-master-poky-with-sstate-distro_poky-=
machine_qemux86-64/
+   =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 build/
+   =E2=94=82=C2=A0=C2=A0  =C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 conf/
+   =E2=94=82=C2=A0=C2=A0  =C2=A0=C2=A0  =C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=
=94=80 site.conf -> ../../../site.conf
+   =E2=94=94=E2=94=80=E2=94=80 site.conf
+
+This way, site-specific settings can be shared for multiple build
+configurations.
+
 .. _structure-build-conf-bblock.conf:
=20
 ``build/conf/bblock.conf``

--=20
2.51.0


