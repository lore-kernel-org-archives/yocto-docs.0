Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA333C5CFCF
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 09:56:06 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50817.1786442165288684153
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Aug 2026 02:56:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=S/oqvROK;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8E8484E411B4
	for <docs@lists.yoctoproject.org>; Tue, 11 Aug 2026 09:56:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 63DE36033C
	for <docs@lists.yoctoproject.org>; Tue, 11 Aug 2026 09:56:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D2AA111C4BE09;
	Tue, 11 Aug 2026 11:55:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786442159; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AUxr0CREvhIARQikEO2mCept1LLA7hhH64g6frV6Lfc=;
	b=S/oqvROKW8j2FtBepK9UhcJoYl/cDlAOQ/tgz0GVb1PbHYwdnTbNUe8f3YNeMGlIxUAXt0
	wZkUwlMdoGee7ZYi0yOB/UbFBels0J3ESYa2IJE+/RY3CvhqcL5Ln4GcoG4MImv9xVEMVU
	J3Z5Z6GdhKRrCJOdfD/HAD8LWm06P0+8Z1MBX3wVhX71zfefNNIZ4WAisTAjKx3kvzxubz
	IiToQctx8kiz5Bqad2zhmX1DEy648zgJYj05j94TWORu4QHoM/DPIJpyqi/e1qfF8Iche9
	BX2ulh4FxaHr5h8U3JwGtzyn+vRq+7yvP8lafdQ/z2eMPFbXktNq8ToXXhjCPw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 11 Aug 2026 11:55:43 +0200
Subject: [PATCH 1/2] brief-yoctoprojectqs/index.rst: use pip to install
 bitbake-setup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-bitbake-setup-pip-v1-1-0c8b350017e4@bootlin.com>
References: <20260811-bitbake-setup-pip-v1-0-0c8b350017e4@bootlin.com>
In-Reply-To: <20260811-bitbake-setup-pip-v1-0-0c8b350017e4@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2939;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=0IVNd9fvxq5pIhYAGdPJfGQ9Qqs6YhwPDHoVq1syT3E=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqevGpnWRwZlThTC+FrS/VA7R8VQo0YPITiGcF8
 BeKcD7vUJqJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCanrxqQAKCRDRgEFAKaOo
 NjHhD/0WceXtEFfQ3WVeRZBHuMKIqxCbzq+s9StDtbDQ6l0VoCBpn4a2vDuiH3XD5flrZ92dON7
 JeRlf9lYjIJlI3TRm7+0oa8XFrYKWDTifAAjfIKKypMgkQUInMlJew18iA58iRnaM0umMeaG1UR
 1yugV7K4AT3A5UGnyZi4niITTxcZdyLF1ziK4sfHaTYSTk08WBHoMhZKusJ4pXA0OSddeFJ6nca
 EacNY0gEGR9hSoXumsi/JGM2bdkKIBHD+pahhiV5uuDDa0eo5GklTVlqTPy8UhHGz6KJs8Av6Ig
 wtzmsSBX/cGOJNNZ6WbI2PkFMDJWFyQlvEA3cOMxk/rMs2I4+xuF1Zq4hwap1TbpA2EExv46Gt6
 AuExI/Ndqk2JLWNx8Aew3Y8OtKjvcQAUMz+7VeYFMzXNHmIDqMQTpGuaXqELYARhIZYmm7vgPkM
 T6oVw8gbvBPYntVf9HaZ7gW2m3IiTAq2dO8qRsmJgTc32poBuo8x7IbqqynGzn1ZlSvrpSa2xvF
 4f9cHYso83ywp41KxZKr4EKQ3eWE7jBfw7/1eseXZdjIXblNekG/2/19gF0+TcElB0mQVp26Ek2
 +3eb2tBhODh3sNfx1MWyD5+j8/2PIGTlMay1r3qWDI+Qis11r1TM1aRfdoW2kvQa6YNlvNvfoC3
 7LgKt7D+XCqtzFg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Aug 2026 09:56:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10258

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
index 2ffa3a6d8..5ecc11791 100644
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
+   The ``bitbake-setup`` tool can also be used from the :term:`BitBake`
+   repository directly:
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


