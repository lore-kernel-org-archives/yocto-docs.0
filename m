Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08BCFCCF9F8
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 09:11:46 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10741.1762420300025697305
 for <docs@lists.yoctoproject.org>;
 Thu, 06 Nov 2025 01:11:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=e/sfw+DN;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A92D7C0FA88
	for <docs@lists.yoctoproject.org>; Thu,  6 Nov 2025 09:11:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A80C16068C
	for <docs@lists.yoctoproject.org>; Thu,  6 Nov 2025 09:11:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 29011102F2506
	for <docs@lists.yoctoproject.org>; Thu,  6 Nov 2025 10:11:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762420298; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kGpj9YbIu1JYl0xvHnkrfSczCaeMOrearn4lKS63t6s=;
	b=e/sfw+DNtC5vKSIGZ6OkrRXxbp6X4m4Z0zUrUIysj78Jy0R0HZm16kXV4T3+lUl4/PyJ8c
	lTGrSyCGZ42p5Yi1D6e3R63Bd57hjx/rEcwNL/ZhV2AcLprip8H4dr+8xO9Cjm4B/onYmn
	2UCb6MVt77EErW19u7EomNa2eJzjjKYQyqnWbsqnSMR+aJ50mSjKhLtP1urSqz1txtKLu1
	fIVkdZ5es+6ElIvpcg/gdt8QvbCurA0aLQ4CECIh/yPynx/p/ChlbALvaGtlJ5rqqRziG7
	UGCjMQzA5oSLawweOz1t/8YRgRtftXjHW+l9ID/X9+VehXIdHAP8lqsl4uhTnw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 06 Nov 2025 10:11:19 +0100
Subject: [PATCH v3 2/7] ref-manual/structure.rst: document the site.conf
 file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20251106-bitbake-setup-v3-2-97db90f85f84@bootlin.com>
References: <20251106-bitbake-setup-v3-0-97db90f85f84@bootlin.com>
In-Reply-To: <20251106-bitbake-setup-v3-0-97db90f85f84@bootlin.com>
To: docs@lists.yoctoproject.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2177;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=RlLGG7QqyIDv673TmVZfXqhu2AUmWa9mOWK+wBaLUYE=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpDGZGvQAxHKInQtSFg/IFMPzJAMGnIX6yi3Pz+
 deT4kWfhtGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaQxmRgAKCRDRgEFAKaOo
 Nr9ED/9QQnC9frEYcD0bJzA+gqMImaG52VjtCL6FacrNxBnWkpTX1AY/pvE+yUzsiLEAYu8p9bj
 5Ndwh7RJtKvBW56oEuK9EPETgHEzpwOWFIUkC8DiC5ZjIVyi+DaT/Jr4S6EKFD+ag4hHKlhKJtu
 qtlYewWQxPIZQu3vOaqzSHRdCydnj91DVEakWOoveTWtS+PvzyyWFxOLuu90a1cvd6VGxv1fglQ
 W6BMTcgGKuiUJxKdAKnP6AKrSnJGbwEa3UsVdG1ACK4lBd4gguNs3g1V2mb0bTHU8dnv6ggq5ME
 xpXU5sKBC85kNfH3CDW7NdbFuhQbSp+ZKuCcwt/cJVLS3t4N2LjCDnS7WeMSyw/jNLUMPhjSErL
 Sdo0BjY462Cx4GvRhjzMwBWIR7c6t2p0fLnk0qz61pauKd/c54q2kFfqyYD7IJPIs+iyScPsJCU
 nnjNI8X1gqNPStO3TPlf+NHwZWOLIHQsKq3qdsfYs513xEWydx/ysCdK45NyDr96lDgEDY6CkX6
 iTVuXss7gIihCEJdGigOI/KN9Suv/c4AJvbxd6Ikly7W0dYfe4q7EJ9lFWCxtLmu1vjtJ9y+1KD
 4w0X+A9Oec+r4tuY2C6mIjwZpujnmYX4/DpNnyJwsgRjgg5mexm0Ktwi0Qyzcvjna2tXBdy/YT8
 uLaOUJdzxkT5G4w==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 06 Nov 2025 09:11:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7999

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


