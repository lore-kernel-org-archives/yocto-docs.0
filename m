Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D41EBD6ACDC
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 09:44:53 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38173.1766051090428206004
 for <docs@lists.yoctoproject.org>;
 Thu, 18 Dec 2025 01:44:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=lxQRvng+;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4976D4E41C80;
	Thu, 18 Dec 2025 09:44:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 20F72606B6;
	Thu, 18 Dec 2025 09:44:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 70DF6102F0AF5;
	Thu, 18 Dec 2025 10:44:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766051083; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=82aWuTvz5MDE9molbHNQ+rEtk6pM8F4T4tMtRlLYxus=;
	b=lxQRvng+64GScuKZR8weurdhfgYcOtIREt3elZE8iPfxUtH4Vm+4k6zA3i0LOeFb6YmXj9
	MtskVsRF/kZ5OVTPWnEaGTS6av6NYGVVM4ez7qu2B5eugS4Vo2yoBjRwz9kZRkliwYpIMZ
	VGbRSEHHpqb/zltYLdyihF87SaTWq8jy0gW4m2DCuPZCPT5A1ysOg360ynQ85jmfE1w00/
	26UxXICvcJFVmxUpVAV4BfOBWsjTkVDym9pFjGJpMQBwXfMjTeK0k/yHHYXmYrsROTlXLe
	k4+PNSVA/pQ/BrB/C7wUaQoycmNo+upNwCr1IbGfZQsM9RuzfYpPPRNHmMIcIw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 18 Dec 2025 10:44:34 +0100
Subject: [PATCH] Add the sphinx-copybutton extension
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-sphinx-copybutton-v1-1-752b7c4ff8f9@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAHNQ2kC/yXMQQ5AMBCF4avIrDXRIhJXEQutwVi0TaeEiLsr3
 u5bvP8CxkDI0GYXBNyJydkEmWdglsHOKGhMBlWoWirZCPYL2UMY50+9xeisqApUskzT1QDp5wN
 OdHzNrv/Nm17RxDcE9/0AIGRRYHUAAAA=
X-Change-ID: 20251217-sphinx-copybutton-40e213333b4a
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2664;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=OO+QpJ2Db8esgd4wdXX17Bzci58GKfti8SGBgiLg95I=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpQ80K71YFO8OAECsWt4sLQ8X/zDGWLCixM4fiB
 y2BINz2BuyJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUPNCgAKCRDRgEFAKaOo
 NnuYD/9TjQBXETWdEObXyvTDNOjFH/kH8Anr63TKCJNacBQ4pv/AgQepdfwi7Zs34tFNowpLA3L
 Fp/cUhbmETh4r0iOg5S0WGHKXvnLaBNIlKmXbiAtSMOLO3KbmhxyK4VioVPNGPVp8w5R1+RSGPH
 7ieDg77QFxW9A6JzUQVZu3HJ0WO3o+sIVUCRQLsdgE73I9GSI0MDujJqTc1xLfvMSGubwVlPQhN
 9yNgOisbfA0XkgfWFHv7IHgSmCdr6vWVKxEDEPDMBIBIKsQakBJ+DZM/rUM25R+JvDFZQihBndR
 lVfasonqmsUfTPcgCdHrbG1FSro5cF68MUpV7zPfX6AgtOBznVb6ycML9tqstWVlNHqg89E8/y8
 knfgKcfAEkM9dSIqRVHtUIyJ1OgXzcCK60RqUtU6494uID9fBXiweNW/92fkI/fWg5950a9ryEh
 SsKnzfCh9dkVshV+6PH/sLA69aiHZLBW+18AMDjKjNWODx4krV9I2LL9FCIaqDsAW4vb0D83o6n
 /u8JX1v4CtlBzw5i1L1GLQQh5ytEwUJnthGLUUmdLpUY+GT8+xv/K3fKmTu/y4GM80bUZXDv4wg
 S2K9uPIM1el3xSFKcSEgUfnvs8HtK+ktPyw5W5nD8cktwQre4XfVo8rkPPcY+9yyUVP7ELrElOB
 6FAAfPK3nVZbMxA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 18 Dec 2025 09:44:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8302

This extension adds a copy button to code-blocks.

It was added to the buildtools tarballs for documentation with
commit ebf14a6dc1a5 ("python3-sphinx-copybutton: add recipe") in
OE-Core, so the the Autobuilder can use it.

Add it as a requirement in the docs, including in Ubuntu requirements.
According to https://pkgs.org/download/python3-sphinx-copybutton this
packages is provided under "python3-sphinx-copybutton" on all the
versions of Ubuntu we support.

Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/Pipfile                                    | 1 +
 documentation/conf.py                                    | 1 +
 documentation/tools/host_packages_scripts/pip3_docs.sh   | 2 +-
 documentation/tools/host_packages_scripts/ubuntu_docs.sh | 2 +-
 4 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/documentation/Pipfile b/documentation/Pipfile
index 7ee1d22905..1fa2df31e7 100644
--- a/documentation/Pipfile
+++ b/documentation/Pipfile
@@ -9,6 +9,7 @@ verify_ssl = true
 sphinx = "*"
 sphinx-rtd-theme = "*"
 pyyaml = "*"
+sphinx-copybutton = "*"
 
 [requires]
 python_version = "3"
diff --git a/documentation/conf.py b/documentation/conf.py
index c07b6c4199..860962e0dc 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -66,6 +66,7 @@ extensions = [
     'sphinx.ext.autosectionlabel',
     'sphinx.ext.extlinks',
     'sphinx.ext.intersphinx',
+    'sphinx_copybutton',
     'yocto-vars'
 ]
 autosectionlabel_prefix_document = True
diff --git a/documentation/tools/host_packages_scripts/pip3_docs.sh b/documentation/tools/host_packages_scripts/pip3_docs.sh
index fd6ad98053..907ecec55c 100644
--- a/documentation/tools/host_packages_scripts/pip3_docs.sh
+++ b/documentation/tools/host_packages_scripts/pip3_docs.sh
@@ -1 +1 @@
-sudo pip3 install sphinx sphinx_rtd_theme pyyaml
+sudo pip3 install sphinx sphinx_rtd_theme pyyaml sphinx-copybutton
diff --git a/documentation/tools/host_packages_scripts/ubuntu_docs.sh b/documentation/tools/host_packages_scripts/ubuntu_docs.sh
index 67bb810946..c322b61e42 100644
--- a/documentation/tools/host_packages_scripts/ubuntu_docs.sh
+++ b/documentation/tools/host_packages_scripts/ubuntu_docs.sh
@@ -1 +1 @@
-sudo apt install git librsvg2-bin locales make python3-saneyaml python3-sphinx-rtd-theme sphinx
+sudo apt install git librsvg2-bin locales make python3-saneyaml python3-sphinx-rtd-theme python3-sphinx-copybutton sphinx

---
base-commit: d84d916d4fc505e8386693306b6a90b0064c0518
change-id: 20251217-sphinx-copybutton-40e213333b4a


