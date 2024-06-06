Return-Path: <jasper@fancydomain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBD99C27C54
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 13:51:02 +0000 (UTC)
Received: from mx.walter.deinstapel.de (mx.walter.deinstapel.de [62.176.232.99])
 by mx.groups.io with SMTP id smtpd.web11.14987.1717681853937668777
 for <docs@lists.yoctoproject.org>;
 Thu, 06 Jun 2024 06:50:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@fancydomain.eu header.s=mail header.b=lNAQR11W;
 spf=pass (domain: fancydomain.eu, ip: 62.176.232.99, mailfrom: jasper@fancydomain.eu)
From: jasper@fancydomain.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fancydomain.eu;
	s=mail; t=1717681850;
	bh=Wa/TNgidxMiYydyl0vtgm2ga3B4BpiEzbWfpiHohwmg=;
	h=From:To:Cc:Subject;
	b=lNAQR11WQ0vVeTJVcEe0pQULixqwhL9CgDzchjyqRumjQ0TFcyhsz+PFKkvlWGvf0
	 4tFpH/uSasfq2cczlz1XTFRRIhWbEF5z8u36WxbEqbPnn1JBdmrQ5ywVtQdfINzF58
	 wLADz61vSQh+sXfPfPtqdhqzbfns7Rsrg/jy3gkGTWBiHPEG6nKyw1Gf3675NCHIGw
	 udoGTCCE7r/k5SHKfDCf0ud0VCPJOSmOcWTqhKI7tD0991C7As77Qmhufx+IBXiAo6
	 rnvbka5zAIbnT4uIj7g6jGRAXHGxmumM/AZdaImfAon8hejhLLlRIcMaJXkDlitzYC
	 hC4xGYYFB63iQ==
To: docs@lists.yoctoproject.org
Cc: aoife.power@iris-sensing.com,
	Jasper Orschulko <jasper@fancydomain.eu>
Subject: [PATCH] dev-manual: Add info on build env initialization
Date: Thu,  6 Jun 2024 15:50:38 +0200
Message-ID: <20240606135043.61974-1-jasper@fancydomain.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 06 Jun 2024 13:51:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5275

From: Jasper Orschulko <jasper@fancydomain.eu>

Going through the docs we a new trainee, we noticed that the build
initialization is only mentioned in the quick build
(https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html) but not
in the in-depth getting started documentation.

While this is repeatedly mentioned later on, e.g. in the "building" secti=
on,
you might easily end up somewhere where this has not been mentioned yet.

E.g. in our case this was:

https://docs.yoctoproject.org/dev-manual/layers.html# (which comes right
after the "setup" chapter)
->
https://docs.yoctoproject.org/dev-manual/layers.html#creating-a-general-l=
ayer-using-the-bitbake-layers-script
(which is linked right at the top)

To avoid any confusion I think it best to mention this required step
directly in the "start" document.

Signed-off-by: Jasper Orschulko <jasper@fancydomain.eu>
---
 documentation/dev-manual/start.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manua=
l/start.rst
index 386e5f5d2..cfc1be65e 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -853,3 +853,14 @@ similar to checking out by branch name except you us=
e tag names.
    ``checkout`` command are a snapshot of the "&DISTRO_NAME_NO_CAP;"
    development branch at the point where Yocto Project &DISTRO; was
    released.
+
+Initializing the Build Environment
+----------------------------------
+
+Before you can use Yocto you need to setup the build environment.
+From within the poky directory, source the oe-init-build-env environment
+setup script to define Yocto Project=E2=80=99s build environment on your=
 build host::
+   =20
+    $ source oe-init-build-env=20
+
+Note, that this step will have to be repeated every time you open a new =
shell.
--=20
2.45.2


