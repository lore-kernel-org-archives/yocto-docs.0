Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F377CC5321B
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 13:25:24 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19150.1784899514783091440
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Jul 2026 06:25:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=bD5LlU0G;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1D3791A11E5
	for <docs@lists.yoctoproject.org>; Fri, 24 Jul 2026 13:25:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E5E5260395
	for <docs@lists.yoctoproject.org>; Fri, 24 Jul 2026 13:25:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2BE0111C103CD;
	Fri, 24 Jul 2026 15:25:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784899512; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HdAyM+iPHAJUlFUGBNEUPXRZ1PVtL7Y4yOuyqiGIZkU=;
	b=bD5LlU0Gp33QMz5V21SmMbxKpBJhPVW2EehFCzDNbD6IEad8T3CTTt21BLwIUvimGaMrgl
	CqAuUVGTGpUVJc8xDY9Ej+DeN8+N3bAhZLC7qg1iRK/ZqlXfGQl0bZsih/7K9q1uERdlfc
	26PPMldGuog02WtcWR0am5YPgDXmoY5mu50YlsA4f6VQ3/z+GFV1gf+Eu+YiYS2MyYhGtB
	CckmjMY/M47Jn5TBxowPr+6qwwlJuRPM8EzQ5H71/n1YmPKZqL5B6UJ8WyWHBy9u6sBI9a
	/SXXKSuLcXo3zrCcC19FhP1HS9uA4Pk68FtTzP2EzW1Gq+jlUplfTE29oN7t0Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 24 Jul 2026 15:25:02 +0200
Subject: [PATCH 5/9] overview-manual: move the intro content in the index
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-rework-welcome-page-v1-5-491772cc4b65@bootlin.com>
References: <20260724-rework-welcome-page-v1-0-491772cc4b65@bootlin.com>
In-Reply-To: <20260724-rework-welcome-page-v1-0-491772cc4b65@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7574;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=IVlQ2i3KON6/EtJPUALNe2GuTneG2q0feAxiTLgc35M=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqY2eyqT2RzOCB16zEqoZirOOxfx5Yp5S10aZV4
 aehHQBQkPiJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCamNnsgAKCRDRgEFAKaOo
 NpJGD/9r0iXo9PP0Vy6qzCjiQbh1NvV2RK9ERgLyAK4Mera9gEmG/A/XIHclBdECGrrqLHyw2fE
 WDFcVzvFlCtXmo9f1npkZZuNQDE/6cm0fwWkGfzc8DgzCarmUy/5Kwn+gwiEiZt4/yFE6D6zhdw
 FIN4+CNF1oeSLIu0dqUE//lnjTwHv+qT0pYLDb5N9H62+H+fIia/GmdWrTirRJfPCaa+WMeLyu9
 Khp19aHzZADG213Inly6MLtMWYsfgS0xSbY+O+yzjppgMM/pJcWZUgAPcfGsqqbFmx6eJhvGO5R
 qNlhibOGvhOccIM8UPa3Z8ICteZBkLV58qObcSMbvck/q6E8PEdkAOGhukTv/LUDfbHDQQcbSKj
 sHh7OEGPReGNYJe2HY8P1PD5o+OHmZkSGMHXB21Mk8MvpPVfByiWIDsxUBJwiyXYOL4TmN8z2zR
 PeST4Prw79hH0YAlXxTWNSv6zduJ9TjGWSsBPDrg16XV1daWrbYtwBik8z6j+ePD9eroAXgtCkF
 bbUy990qegE9eYfqJRlseiHN0kLyv8CRXNP5bRXkEg2E1jlkEgttMsGnJPUZO1XqCgU1gsu8/L9
 68TlKi0EzSgEpsPFG0EVC+jwt5xlGOUe5c9djGFBu3Xkcc+KbHynfnkFgX4p+D35JvRWUHZGDAH
 kUCiKspXsnOHmDw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Jul 2026 13:25:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10133

The index document can act as an intro document. Having an extra intro
document to this section felt a bit superfluous, now that it is part of
the whole "Introduction and Overview" section.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/overview-manual/index.rst | 59 +++++++++++++++++++++++++++-
 documentation/overview-manual/intro.rst | 69 ---------------------------------
 2 files changed, 57 insertions(+), 71 deletions(-)

diff --git a/documentation/overview-manual/index.rst b/documentation/overview-manual/index.rst
index 04061f8f4..7d96881b9 100644
--- a/documentation/overview-manual/index.rst
+++ b/documentation/overview-manual/index.rst
@@ -4,15 +4,70 @@
 Yocto Project Overview and Concepts Manual
 ==========================================
 
-|
+Welcome to the Yocto Project Overview and Concepts Manual! This manual
+introduces the Yocto Project by providing concepts, software overviews,
+best-known-methods (BKMs), and any other high-level introductory
+information suitable for a new Yocto Project user.
+
+Here is what you can get from this manual:
+
+-  :ref:`overview-manual/yp-intro:introducing the yocto project`\ *:*
+   This chapter provides an introduction to the Yocto Project. You will learn
+   about features and challenges of the Yocto Project, the layer model,
+   components and tools, development methods, the
+   :term:`Poky` reference distribution, the
+   :term:`OpenEmbedded Build System` workflow, and some basic Yocto terms.
+
+-  :ref:`overview-manual/development-environment:the yocto project development environment`\ *:*
+   This chapter helps you get started understanding the Yocto Project
+   development environment. You will learn about open source, development hosts,
+   Yocto Project source repositories, workflows using Git and the Yocto
+   Project, a Git primer, and information about licensing.
+
+-  :doc:`/overview-manual/concepts` *:* This
+   chapter presents various concepts regarding the Yocto Project. You
+   can find conceptual information about components, development,
+   cross-toolchains, and so forth.
+
+This manual does not give you the following:
+
+-  *Step-by-step Instructions for Development Tasks:* Instructional
+   procedures reside in other manuals within the Yocto Project
+   documentation set. For example, the :doc:`/dev-manual/index`
+   provides examples on how to perform
+   various development tasks. As another example, the
+   :doc:`/sdk-manual/index` manual contains detailed
+   instructions on how to install an SDK, which is used to develop
+   applications for target hardware.
+
+-  *Reference Material:* This type of material resides in an appropriate
+   reference manual. For example, system variables are documented in the
+   :doc:`/ref-manual/index`. As another
+   example, the :doc:`/bsp-guide/index` contains reference information on
+   BSPs.
+
+-  *Detailed Public Information Not Specific to the Yocto Project:* For
+   example, exhaustive information on how to use the Source Control
+   Manager Git is better covered with Internet searches and official Git
+   Documentation than through the Yocto Project documentation.
 
 .. toctree::
    :caption: Table of Contents
    :numbered:
 
-   intro
    yp-intro
    development-environment
    concepts
 
+Because this manual presents information for many different topics,
+supplemental information is recommended for full comprehension. For
+additional introductory information on the Yocto Project, see the
+:yocto_home:`Yocto Project Website <>`. If you want to build an image
+with no knowledge of Yocto Project as a way of quickly testing it out,
+see the :doc:`/brief-yoctoprojectqs/index` document.
+For a comprehensive list of links and other documentation, see the
+":ref:`Links and Related
+Documentation <resources-links-and-related-documentation>`"
+section in the Yocto Project Reference Manual.
+
 .. include:: /boilerplate.rst
diff --git a/documentation/overview-manual/intro.rst b/documentation/overview-manual/intro.rst
deleted file mode 100644
index ffdbd3f83..000000000
--- a/documentation/overview-manual/intro.rst
+++ /dev/null
@@ -1,69 +0,0 @@
-.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
-
-**********************************************
-The Yocto Project Overview and Concepts Manual
-**********************************************
-
-Welcome
-=======
-
-Welcome to the Yocto Project Overview and Concepts Manual! This manual
-introduces the Yocto Project by providing concepts, software overviews,
-best-known-methods (BKMs), and any other high-level introductory
-information suitable for a new Yocto Project user.
-
-Here is what you can get from this manual:
-
--  :ref:`overview-manual/yp-intro:introducing the yocto project`\ *:*
-   This chapter provides an introduction to the Yocto Project. You will learn
-   about features and challenges of the Yocto Project, the layer model,
-   components and tools, development methods, the
-   :term:`Poky` reference distribution, the
-   :term:`OpenEmbedded Build System` workflow, and some basic Yocto terms.
-
--  :ref:`overview-manual/development-environment:the yocto project development environment`\ *:*
-   This chapter helps you get started understanding the Yocto Project
-   development environment. You will learn about open source, development hosts,
-   Yocto Project source repositories, workflows using Git and the Yocto
-   Project, a Git primer, and information about licensing.
-
--  :doc:`/overview-manual/concepts` *:* This
-   chapter presents various concepts regarding the Yocto Project. You
-   can find conceptual information about components, development,
-   cross-toolchains, and so forth.
-
-This manual does not give you the following:
-
--  *Step-by-step Instructions for Development Tasks:* Instructional
-   procedures reside in other manuals within the Yocto Project
-   documentation set. For example, the :doc:`/dev-manual/index`
-   provides examples on how to perform
-   various development tasks. As another example, the
-   :doc:`/sdk-manual/index` manual contains detailed
-   instructions on how to install an SDK, which is used to develop
-   applications for target hardware.
-
--  *Reference Material:* This type of material resides in an appropriate
-   reference manual. For example, system variables are documented in the
-   :doc:`/ref-manual/index`. As another
-   example, the :doc:`/bsp-guide/index` contains reference information on
-   BSPs.
-
--  *Detailed Public Information Not Specific to the Yocto Project:* For
-   example, exhaustive information on how to use the Source Control
-   Manager Git is better covered with Internet searches and official Git
-   Documentation than through the Yocto Project documentation.
-
-Other Information
-=================
-
-Because this manual presents information for many different topics,
-supplemental information is recommended for full comprehension. For
-additional introductory information on the Yocto Project, see the
-:yocto_home:`Yocto Project Website <>`. If you want to build an image
-with no knowledge of Yocto Project as a way of quickly testing it out,
-see the :doc:`/brief-yoctoprojectqs/index` document.
-For a comprehensive list of links and other documentation, see the
-":ref:`Links and Related
-Documentation <resources-links-and-related-documentation>`"
-section in the Yocto Project Reference Manual.

-- 
2.55.0


