Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 710FEC88E45
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 14:56:36 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41383.1789138594597453185
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Sep 2026 07:56:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=i7/jYj++;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id BCB1DC63A0C
	for <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 14:57:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id ECAD3601DE
	for <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 14:56:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 83DCE11C7AFAC;
	Fri, 11 Sep 2026 16:56:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789138591; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=s9yEr/Oyf75sTFm3kofEvAHOOf/SlLH9h0g14dM5RJs=;
	b=i7/jYj++8OsaWopPNcujj51zXEH+YFulav0SLwI7oV8VZ7DolxXgDvZp+6pm1EkXi4eBaq
	HQWkXtv4zL5C8lDeSkzK5+S7+QVBTRN72bFL2tLhp2/NxnWjWybDFaC/FIsZ5FGj0mIvzj
	iZJNHmrD8SI0c6ktQ06EDCTEy7skmw95ze3E71vXIEclWM3U5WqrNngzz6PMYz02xykdeM
	tXW2+64Vvo4KXXghnPC0LDPBqph3Ep8PRDzuk7EwmI/jee1u/Nfb9VMkc674HVHrzw6O8E
	H3SvLvLMQ5H+GgkWAzF+rI+EC/c3AWo8Nv6yrY9eOCZRkyyoDeLNqHvhVhk1Iw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 11 Sep 2026 16:56:10 +0200
Subject: [PATCH 10/10] ref-manual/variables.rst: mention built-in fragments
 for MACHINE/DISTRO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-assorted-fixes-v1-10-0d92a8112918@bootlin.com>
References: <20260911-assorted-fixes-v1-0-0d92a8112918@bootlin.com>
In-Reply-To: <20260911-assorted-fixes-v1-0-0d92a8112918@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2572;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=ryEFmiPI7aBwuVsrgIC4XvRFidyNLmo8ySl13wTGA90=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqpBaWvrpuL7h4aAu+SWohX6pcLkt7/vTdd7g0/
 zOhdU8DfPeJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaqQWlgAKCRDRgEFAKaOo
 Ns5yEACjIz3+jMv/ZHfX2nNpwZDG2Qizmodr0wdmsFOyXdL0L0P44+RrPJSWRjhN8BXbikBvbEQ
 ayPzmdKrtIYqUZN5ler7jHgnYKFtRxCWMBVTLLHn1vkPDr3CHLcc23WAfNoV/y6lEg4502jSWV8
 UPOCmLHDZUQDt02WO/kvMS3S8WfzPnxjNFCWaQp35rC6cEbUX78Gcw4MB+pYlur/9pkKTOS2L+w
 tK2/MHUlpa1IN0idgObn/2P/s5gDJ/I50RERSXZqkNRk3gVJIcnh8dSAKubMssbLecqyQvH3Ydt
 l+r6j0+9VDHaXxMR4HUwDREWxB+hCeJz91QuW+2uZu2+ktid1iPkUa2+K4pysc5ghSTCdLSgmYb
 DIX+tIsKpnMWODMMyMOPQnU9aLP20bPKIxjSs2w7vmjVw+x3rvzJoxszPC5r3CHLsM15eCOjNaA
 QdeKcrJvH7bi1vhAQol0J6u29V2mxyjopa/tNSFIEjnS8q9eq7qWZfMzZ3zqMLtZGymr3yBufg6
 rSSHEtNoIDXBEJe/IofbNNAcBXTGTkkypYjIZvp3H38U+HRvPf40/ayJ8+EtQHFLeDijOBFJgaA
 BA7aGC4Mmth83jKGAyhgG3dmsw+FZ6l5BMXa85FDngGG9wmPZSvdqZSUuDHMaGXWVhyFWxpQ/bu
 kBXtdybTYwKQFLQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 14:56:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10464

In the MACHINE and DISTRO variable description, mention that these can
be set either with their built-in fragments, or from the local.conf
file.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 33 +++++++++++++++++++++++++++------
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 4a41e3501..f76e5ba4d 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2441,6 +2441,20 @@ system and gives an overview of their function and contents.
       of the distribution, see the :term:`DISTRO_NAME`
       variable.
 
+      You can define the :term:`DISTRO` in two ways:
+
+      -  with the :ref:`ref-fragments-builtin-core-distro` fragment:
+
+         .. code-block:: console
+
+            $ bitbake-config-build enable-fragment distro/<DISTRO>
+
+         Replace ``<DISTRO>`` with the name of the distro in the above
+         command.
+
+      -  in the :ref:`structure-build-conf-local.conf` file found in the
+         :term:`Build Directory`.
+
       The :term:`DISTRO` variable corresponds to a distribution configuration
       file whose root name is the same as the variable's argument and whose
       filename extension is ``.conf``. For example, the distribution
@@ -6121,13 +6135,20 @@ system and gives an overview of their function and contents.
       in-use.
 
    :term:`MACHINE`
-      Specifies the target device for which the image is built. You define
-      :term:`MACHINE` in the ``local.conf`` file found in the
-      :term:`Build Directory`. By default, :term:`MACHINE` is set to
-      "qemux86", which is an x86-based architecture machine to be emulated
-      using QEMU::
+      Specifies the target device for which the image is built. You can define
+      the :term:`MACHINE` in two ways:
 
-         MACHINE ?= "qemux86"
+      -  with the :ref:`ref-fragments-builtin-core-machine` fragment:
+
+         .. code-block:: console
+
+            $ bitbake-config-build enable-fragment machine/<MACHINE>
+
+         Replace ``<MACHINE>`` with the name of the machine in the above
+         command.
+
+      -  in the :ref:`structure-build-conf-local.conf` file found in the
+         :term:`Build Directory`.
 
       The variable corresponds to a machine configuration file of the same
       name, through which machine-specific configurations are set. Thus,

-- 
2.55.0


