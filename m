Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FA45CCFA04
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 16:29:18 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.2130.1761841754144895367
 for <docs@lists.yoctoproject.org>;
 Thu, 30 Oct 2025 09:29:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=u/hG4CEN;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 10D8CC0DABD
	for <docs@lists.yoctoproject.org>; Thu, 30 Oct 2025 16:28:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8101F60331
	for <docs@lists.yoctoproject.org>; Thu, 30 Oct 2025 16:29:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1800E11808BEA;
	Thu, 30 Oct 2025 17:29:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761841752; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/0LppcdpQE91Iqf4YNL0gxidf3K2lUH/DSzqQetMDiM=;
	b=u/hG4CENOiVohtVBpIKNe8j3GZx45DChVBUXpnDxAd09E3gwfLd/nFHeXtJTFl4iEG96Xg
	KbQm7BBxIT2Hq7fse8+Lth9+Muy1mQyzawM759dWPseyGGt8+CStmUg9dXLq9pmZq2bFA0
	tl4BOcHlWHnwPVdkDBB+e2aTQW8tgrVghu8sNAgIZSnNfKhHulZYC1J9jG1VMZBHjSqLsp
	qyf9BVSajGI+OqZD3Y9GBTUjFN7gdQPjMF9sGGsldfyGc2tVvSUYe6ynJ+z8KJt6qt4DNo
	HlH8H1bod6dNeeJ2qugzRhNwx71PbsF66HMwVn9RqoKB4GrOxnIJFpVpWCjpvQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 30 Oct 2025 17:28:31 +0100
Subject: [PATCH 2/6] ref-manual/structure.rst: document the site.conf file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20251030-bitbake-setup-v1-2-f44a8a2b7c0b@bootlin.com>
References: <20251030-bitbake-setup-v1-0-f44a8a2b7c0b@bootlin.com>
In-Reply-To: <20251030-bitbake-setup-v1-0-f44a8a2b7c0b@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2177;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=tfL6lrqjNaiIuaVJE0qNOaQwDckVG5yaJ0Vwp65CXBo=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpA5JV4VhlS0aVAOZHpeaUi7yVc25/9iwchfhKL
 go9bZX5RuOJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaQOSVQAKCRDRgEFAKaOo
 Nm36EACw4plmVcZ2JXOvEczwV/9dESgc5YTce8BPnW7BOQ0CC0niHPWyDDxjpPfHTIXMzhIzxTX
 SD1+APFVWXHXqCHHGA6XIHPaBc6vS+X2o3ZljIyYWicsDLGzIfA8oOMKxGgTi28TSnhERO+wNuy
 32AAigxLHgRJo+9SOaYaf5tz4YVcd/uAWRYMhk+Tn5+kyrSeaoaRDlgZZVOzYbrL68WCSLEStnZ
 myyy4CSNxS7i1R0JOs13D2rgjxhbHNRDk+Jyu5d/gIKa91pmYd7HfzJ3srCt99PlmXvpvYnEW0V
 OVTy+XiBGhIVub+XEJOT4Jt5Id+RW6dGTQkTASq6e/hBz3PmuklHsto3ug6BD83xc/IiLnPsO8n
 +RHkOeTur4+yH9dnvmM+bhX2jI1e7HnK9xYHQau7SjzthP04aZ3VV3HDQ/ygHVeAhS/8jLkT3XE
 kzqs/xcesw57tganhxi8HdLsmhzzZBBp4tCex+YZQDKGXVB7OT1QQEUnZxLTnVJ5VtgDDuxiooF
 bnHtosX7gJ2PoAxW3lYsFERL8nfMtIJRkY5PQF0X5IXpTXCggwoSp1RxufIczIUZyJw0nFUqHNZ
 673w7kWCCFoe7miDfiFgioN/a4Z6Rs4mHcQagOHerarf+/NrDZf415OwV9KHVbDLGIVSKqh4d/V
 GmVBrQmcUtwNSvQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 30 Oct 2025 16:29:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7927

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
index f7d7a819d..d817ee426 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -339,6 +339,35 @@ Once the build process gets the sample file, it uses=
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


