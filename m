Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EB1BC5AC67
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 13:40:08 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.54614.1786455602059276742
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Aug 2026 06:40:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=UABh8llI;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 64EB14E411B6
	for <docs@lists.yoctoproject.org>; Tue, 11 Aug 2026 13:40:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 343126033C
	for <docs@lists.yoctoproject.org>; Tue, 11 Aug 2026 13:40:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A46C211C48C40;
	Tue, 11 Aug 2026 15:39:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786455595; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Fg8VDGywVO4tgdXSLV8zyVc40vOfN7fK/Mb1zqdiaA4=;
	b=UABh8llIkqXyoYLJfU0Bobslc8MTzY7383gmxdJqni3QJwmA0ZvvIeJuGV7CMtFTshLyz4
	iJPwIqwpy01ue+svJN2gJOId94mphl6usJG+yfBz+UMEwXOG0VVyk1rOWk0dPqJ6xNU3wP
	iOXAkxtZo+65L4OqFrOUfAH5ZOxbHO6TC4AT7g1d+doyRoO7mSKlk+KIADiiiSnnSgI8qA
	JSOdzk4oF9ZBak3GaWYJq13DQ1XUSx20B04Eb3JBnZ1IBI+5gEYQF8Gfk9Xz25agkI51dE
	m846RcGNXAZoZu/8OKBijiIWEbRrgMIRVo2h4zGRr7A9UbJJursVCOXhJr0W8w==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 11 Aug 2026 15:39:46 +0200
Subject: [PATCH v2 1/2] brief-yoctoprojectqs/index.rst: use pip to install
 bitbake-setup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-bitbake-setup-pip-v2-1-3e8ffed354f2@bootlin.com>
References: <20260811-bitbake-setup-pip-v2-0-3e8ffed354f2@bootlin.com>
In-Reply-To: <20260811-bitbake-setup-pip-v2-0-3e8ffed354f2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2975;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=mG48NKdZ5tMr+uxd09JafxiKA6eHjtYzwAnpqpzncmg=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqeyYmO2Q7KXbUWkb3ovFIVFotuLMbX7VXBkWKs
 85O7bK0JMqJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCansmJgAKCRDRgEFAKaOo
 Nk65D/9h2WwGEcrZpes/USRV4k7eOpmBjYtX4AwuvOyPDjYrgL4rh80tKJlHOZFX9UTBEHlZa1T
 ot7lqtyJ98ga8R4rT+Aa84p05+KErJwX/7QyA0sBx9Hkqe+ncFj76qNte/xD8UobFLCwWanmuju
 1EstO2M8AMVtW+R/I8T736orjmX2X7lTb1IjeL7VkHPFsVQJeJzbO37W+/o/jPw94g81Jzv4hbB
 eUZAz1iiUdEygtic0wqm7mOCehnHTVjqd/L6EQwdHrZqE+n1L9j33uMvxLD/Rzfss6LKwOFDGAx
 TzIvLEHWSLRStwmJjDlPymIqSbC/zVtlKpoARPHWm4xRd2nJqSTjoKr1bhLanCyX0fA2caVSsuq
 5Lr6ZTJ89CmFdkQb9wOt3oQKZRkkgxIdKvflBWtMJ7TAxK1U/lnHyfxcxTur/D0kuuFBwu5CwU6
 E0mSfyAiPXQ4l3zw32mhGtHUk3ixmbjOR9vjuKI9KtfLfuu9V9aycZ92hmJ6z7R1bRhqqBwlSyS
 sC/zjqHBc4RMKvY2TOhn0mguEZ/k1WuItr/tGSmlDePwA8GOPWpkG+81m1k6lz4Vq3z6tMbLecc
 wS1i0ze6iD+ll6fiif1szJWJDvZRBiqe6+RFK/HDzKUviHRSDsD6wE3tyeJERHknHakMHh5lcc2
 G4Eo7r+W7Vku7ow==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Aug 2026 13:40:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10266

bitbake-setup is now available on Pypi[1], so let's use it instead of
a clone of bitbake to use the CLI tool. Refresh commands in consequence.
Keep git clone instructions in a note as an alternative way of setting
things up.

[1]: https://pypi.org/project/bitbake-setup/

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/brief-yoctoprojectqs/index.rst | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 2ffa3a6d8..a8837bc96 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -84,23 +84,35 @@ Build Host Packages
    see the :ref:`ref-manual/system-requirements:required packages for the build host`
    section in the Yocto Project Reference Manual.
 
-Use Git to clone bitbake-setup
-==============================
+Install and use bitbake-setup
+=============================
 
 Once you complete the setup instructions for your machine, you need to
 get a copy of the ``bitbake-setup`` tool to set up the :term:`Poky` reference
-distribution on your build host. Use the following commands to clone
-the bitbake repository.
+distribution on your :term:`build host`. Use the following commands to install
+the tool in a Python `virtual environment <https://docs.python.org/3/library/venv.html>`__:
 
 .. code-block:: console
 
-   $ git clone https://git.openembedded.org/bitbake
+   $ python3 -m venv --clear ./bitbake-setup-venv
+   $ . ./bitbake-setup-venv/bin/activate
+   $ pip install bitbake-setup
+
+.. note::
+
+   The ``bitbake-setup`` tool is developed and maintained in :term:`BitBake`
+   repository, and so can be used directly from there:
+
+   .. code-block:: console
+
+      $ git clone https://git.openembedded.org/bitbake ./bitbake
+      $ ./bitbake/bin/bitbake-setup ...
 
 Setup a build environment with the following command:
 
 .. code-block:: console
 
-   $ ./bitbake/bin/bitbake-setup init
+   $ bitbake-setup init
 
 By default, this will set up a top directory in the current directory.
 
@@ -109,7 +121,7 @@ If you prefer to set up your builds in a different top directory, for example
 
 .. code-block:: console
 
-   $ ./bitbake/bin/bitbake-setup settings set --global default top-dir-prefix $HOME
+   $ bitbake-setup settings set --global default top-dir-prefix $HOME
 
 .. note::
 
@@ -183,7 +195,7 @@ differ from the examples below.
 
    .. code-block:: console
 
-      $ ./bitbake/bin/bitbake-setup init --non-interactive poky-master poky distro/poky machine/qemux86-64
+      $ bitbake-setup init --non-interactive poky-master poky distro/poky machine/qemux86-64
 
 The ``init`` command creates a new :term:`bitbake:Setup` in the
 :term:`bitbake:top directory`. The default name is derived from the selected

-- 
2.55.0


