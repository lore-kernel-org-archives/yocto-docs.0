Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79D8ACA6CB8
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:20:07 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5828.1769501998925661170
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:19:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=OhVYgJDT;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6B4DCC211CD
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 735C7606F5
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AEE2A119A868D;
	Tue, 27 Jan 2026 09:19:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769501997; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=T9jmZ4xTrvaDONoh+2ttyhTAw9st8sDCNvIswmAHGnA=;
	b=OhVYgJDTVVeL2JZoiS+XEd7t7lxf8E0q6qjzOdWFKXAzz9MiXH4OymcA122RZJ7Khu7uOh
	ZVW+SKYEFvvxKEjjFGkxtmXBiF+RRSM7tFZ+GUkr9H868U10S8P2G3TkjNFHIjH0vLexoO
	qXsIS7PkPPJJJU+7ze6IX2bAUI6USZ2HYLw6jpVddv3WNrBavQa0gEFDrGYUleuGBKtnU0
	xrn93qmd7CEkIGGJh36sJEB1IWaAofAmK4fIYE15BhgTDIROqXaW/YKawMTa26PIdEMXqI
	Q1FAznPul+vin07Y5MNZ1/Go08VEOUsGcdL40PA+iW0fIqlqE+WN41tiL4GBfQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 09:19:46 +0100
Subject: [PATCH v2 51/56] ref-manual/system-requirements.rst: remove
 obsolete poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-remove-poky-references-v2-51-74bf80cc4e5a@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
In-Reply-To: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2292;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=RuGuem8CoQ014zvS1Lnnz/oHgoyKrwfCi/dEqiEtPEk=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeHUGF18c6gGxWyqx0PKzjh+0aEpY900pVI3iB
 zPkAYwc3v2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh1BgAKCRDRgEFAKaOo
 Nrq3D/9lPQu8TvWpVexBySotBmHJQKImn0/YRz3tJVUUzHc5BqHCOa4kndHDP+wojayTbGLtGed
 5uZ1PpJbfV0CPNl6HMuGf7GlECYl5i5T4erVln/U0Ii4SWr8I84YFkpm2hqNBfN8YNl8wfcvPFF
 wDRaKTkHmmPpq9s6Zh7PtABlz6823oriFQMlpvMccW9tmDXuSsQZOwpPqRhx07eSQMR3DKQxMaf
 n1lBcIIYYOqJofGS0bq4LR6Q8Th70qVPWQERqjFvlMPAc7CDJDLOTLVyhMcwK9JPc8R7IiBz2Gp
 nR7brnHE74l91d4Yc+d311D+P+6U5QWVE+supkNX3E4uYc6zLkW3ekua9V00qKpVjTVfO7DXswA
 v4Oy3zICSUnHVdXRAwjenrwAMYfL87EkFkcTbQI749wby8Jytoz9NqV+nG5i+O0Ej0Qxamgrug6
 DImOUfL3nw7XcEPJu2h6WcIiEpl7/XWHzDjuJvN5FIJRj3Tpv/XfK6YFR1qEkZuGmgtwhiq359Z
 EfH2nz3CGLN9tgiNYNncWQ5kDFSoMYlUrcbtBunz0dPHDyPikWmCrgO3+CzKaS3+tk7IzyWLQIi
 5aPawU9n+8DTO5uItFxBJw+kRZkpmllWDAGThylJs9G3ZrA0ejcTsYmfJfhp03grOAEkoShdBRR
 ZRVL60pEd30PdcA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:20:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8712

Refresh the document now that the Poky repository is obsolete.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/system-requirements.rst | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index a56e683ca..9b681290e 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -405,8 +405,8 @@ installer and automatically installs the tools for you:
 
 #. Execute the ``install-buildtools`` script. Here is an example::
 
-      $ cd poky
-      $ scripts/install-buildtools \
+      $ cd /path/to/bitbake-builds
+      $ ./layers/openembedded-core/scripts/install-buildtools \
         --without-extended-buildtools \
         --base-url &YOCTO_DL_URL;/releases/yocto \
         --release yocto-&DISTRO; \
@@ -420,26 +420,26 @@ installer and automatically installs the tools for you:
    To avoid the need of ``sudo`` privileges, the ``install-buildtools``
    script will by default tell the installer to install in::
 
-      /path/to/poky/buildtools
+      /path/to/bitbake-builds/buildtools
 
    If your host development system needs the additional tools provided
    in the :term:`buildtools-extended` tarball, you can instead execute the
    ``install-buildtools`` script with the default parameters::
 
-      $ cd poky
+      $ cd /path/to/bitbake-builds
       $ scripts/install-buildtools
 
    Alternatively if your host development system has a broken ``make``
    version such that you only need a known good version of ``make``,
    you can use the ``--make-only`` option::
 
-      $ cd poky
+      $ cd /path/to/bitbake-builds
       $ scripts/install-buildtools --make-only
 
 #. Source the tools environment setup script by using a command like the
    following::
 
-      $ source /path/to/poky/buildtools/environment-setup-x86_64-pokysdk-linux
+      $ source /path/to/bitbake-builds/buildtools/environment-setup-x86_64-pokysdk-linux
 
    After you have sourced the setup script, the tools are added to
    ``PATH`` and any other environment variables required to run the

-- 
2.52.0


