Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C269FD6B079
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:39 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17119.1769700278401421848
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:24:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=jYKYwfce;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D649F4E4231D;
	Thu, 29 Jan 2026 15:24:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AE046606FD;
	Thu, 29 Jan 2026 15:24:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B604D119A885C;
	Thu, 29 Jan 2026 16:24:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700276; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DAwbHrETQg9C866NThUeQRmVaj1oDZel9ip743aLLAs=;
	b=jYKYwfcedUzTa9qp3EOCIVOCJIu5FIUh+DmwIbd8NSRjIdJHfoHSEa1o1lceDNGf4VWctt
	EzJeR/jQu2lW11mL0vce+ZvHg/G0NF7ZHYNoLB3HJafhuwAGHQMVzfs25aadpxxEuSHErE
	TjZ6f6mRqcMrqmLqRTJz7R2IXHtsV0lwJF8vzMYwNRm2ExZuKs6NCtOxXGrtguRB20KGSz
	AcnIA6NfTbNOkR73Rbsll0vkn869RQjd2cjXOv1Qewo9hYq1sMIi2xpQOWYSeuQbZzRt9C
	iybC1j9g/oQ+g6Lz9t+su/5uNOqEPfCyEL5/6lCLHJxGPW5a9uPYift/Ke6MTA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Jan 2026 16:23:39 +0100
Subject: [PATCH v3 48/57] ref-manual/faq.rst: remove obsolete poky repo
 references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-remove-poky-references-v3-48-804acc3d9b7a@bootlin.com>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4080;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=fgSozbuMk5pp6FhUaD4XKBFSxHo95R5P6zUbmhVpZ2k=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpe3uQta973VhwHHeTXyI0pB8R3YrjFqNP0YZpu
 uA8OjlDnU6JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXt7kAAKCRDRgEFAKaOo
 No6OD/9G3YiV7pNsAkI/A33Ket9BRbb0pCJaRy1rhQTs8yz2Fo3MECBQpWMzSq5NVtUY1OH/fkY
 HRZNA90++uYdq+ObM3JVlfQFjmot8XJ75+frYUsooDeAtl7DGpvFsRQhYsRBeXiwDO2lCFEmW0Y
 pySgT18eSgeRzgTesirWSY0snIa2PZ39BSQ5lx1pmD/R/E83r3TZbsn+9SqFTHHFZiKpy4oCRzd
 KPrdfM1AeubGWGdGGXAH/rElxPa6dGDk8TENj+INShC8TDzzS1OYppHB56LdJmPCCVjLGVGb5dg
 6GNAwYmJIqvKdGLofc3oajrNcwR8E0b9olRRg0WNUS0CW2My7LN3uhGq48qDMSULxSxzYn2TjKn
 kh2RJUPycmADWPHBCepeSnPb13DhIxCqC/IgmZrA86MucfZYCKbdqqyhSAxXDKKkiswTWtxNVjo
 syMYvsL8fLGSi9DOdzGkxscDaWL/O/9pyhOVRpwlkz/ni639IZl0Kw4HYiXlZ5m+Fl8ex1UqupP
 u2HNkTBKN1NaWlwj4hPYKUPpPYo3G92D0rhlDWgw+aP04JWaXAOdZUy8A5n5kZ6MER4LbuWcSLq
 8Q/Gek0t7ROeG99GSfo68jNCZBDxmWwLJxcl7LJvd56tSWnJFq/el5aACUlrzhyArkjPeDWyXnn
 olgwhikcaJAR2oA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8834

Refresh the document now that the Poky repository is obsolete.

Rework the difference between Poky and OpenEmbedded. Copy the note from
terms.rst regarding the now obsolete Poky repository.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/faq.rst | 45 +++++++++++++++++++++++++++++-----------
 1 file changed, 33 insertions(+), 12 deletions(-)

diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index 6c5b9d4e7..152fbf7b2 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -12,14 +12,35 @@ General questions
 How does Poky differ from OpenEmbedded?
 ---------------------------------------
 
-The term ``Poky`` refers to the specific reference build
-system that the Yocto Project provides. Poky is based on
-:term:`OpenEmbedded-Core (OE-Core)` and :term:`BitBake`. Thus, the
-generic term used here for the build system is the "OpenEmbedded build
-system." Development in the Yocto Project using Poky is closely tied to
-OpenEmbedded, with changes always being merged to OE-Core or BitBake
-first before being pulled back into Poky. This practice benefits both
-projects immediately.
+The term :term:`Poky` refers to the reference distribution that the Yocto
+Project provides, and a reference test configuration.
+
+The :term:`Poky` distribution is built using the :term:`OpenEmbedded Build
+System` and :term:`BitBake`. The :term:`metadata` involved to build the
+:term:`Poky` reference distribution is:
+
+-  :term:`OpenEmbedded-Core (OE-Core)`, which is hosted at
+   :oe_git:`/openembedded-core`.
+
+-  :yocto_git:`meta-poky <meta-yocto/tree/meta-poky>`, which defines the
+   ``poky`` distro configuration file (:term:`DISTRO`).
+
+.. note::
+
+   Poky also used to be a repository containing the combination of
+   :term:`BitBake`, :term:`OpenEmbedded-Core (OE-Core)`, the
+   :yocto_git:`meta-yocto </meta-yocto>` repository and the Yocto Project
+   documentation -- which were combined with the :yocto_git:`combo-layer
+   </poky-config>` tool.
+
+   This repository is still hosted at :yocto_git:`/poky` and is still
+   updated for maintained releases that are older than Whinlatter (5.3).
+   Newer releases now use ``bitbake-setup`` to clone and setup the initial
+   :term:`OpenEmbedded Build System` environment. For more information on
+   how to use ``bitbake-setup``, see the :doc:`/brief-yoctoprojectqs/index`
+   document. An alternative can be to setup the above repositories
+   manually, by following the :doc:`/dev-manual/poky-manual-setup`
+   section of the Yocto Project Development Tasks Manual.
 
 How can you claim Poky / OpenEmbedded-Core is stable?
 -----------------------------------------------------
@@ -27,7 +48,7 @@ How can you claim Poky / OpenEmbedded-Core is stable?
 There are three areas that help with stability;
 
 -  The Yocto Project team keeps :term:`OpenEmbedded-Core (OE-Core)` small and
-   focused, containing around 830 recipes as opposed to the thousands
+   focused, containing around a thousand recipes as opposed to the thousands
    available in other OpenEmbedded community layers. Keeping it small
    makes it easy to test and maintain.
 
@@ -87,9 +108,9 @@ configurable. You can setup the build system to get source code in most
 environments if HTTP transport is available.
 
 When the build system searches for source code, it first tries the local
-download directory. If that location fails, Poky tries
-:term:`PREMIRRORS`, the upstream source, and then
-:term:`MIRRORS` in that order.
+download directory (:term:`DL_DIR`). If that location fails, the :term:`OpenEmbedded Build
+System` tries :term:`PREMIRRORS`, the upstream source (specified in
+:term:`SRC_URI`), and then :term:`MIRRORS` in that order.
 
 Assuming your distribution is "poky", the OpenEmbedded build system uses
 the Yocto Project source :term:`PREMIRRORS` by default for SCM-based

-- 
2.52.0


