Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37449C531C9
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 13:25:14 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19146.1784899511796033395
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Jul 2026 06:25:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Y25m51s/;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2EF091A11E7
	for <docs@lists.yoctoproject.org>; Fri, 24 Jul 2026 13:25:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F1AD160395
	for <docs@lists.yoctoproject.org>; Fri, 24 Jul 2026 13:25:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 04E9411C10FFB;
	Fri, 24 Jul 2026 15:25:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784899509; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lxOH1h4b+m9XnUlCYvQKCl17Uz5LwCPlrcyhH26zHP4=;
	b=Y25m51s/7BzW7K5FshJdwoAF4KBTNoTK/RuoVMjcgd4aubcW5I2utr9erLMb+CPo6A+SGI
	p5FuzD4dvL7mPv474Fw1I8XfKm1Y9gCv3/gmXVb8gEtqOW1itn4Si3bYgym54TLEJKghWA
	fElPvIMTPGsTy623HLEV1F1JhM1OtFWQIPwQ8XjwIVgnGnwHwODRqCE7sDyJGCOyDz+h5s
	k6m06kSCpGGnIS503/FTnO1EFtshGK4BRTRnVzyQbb0MrKTn4cIdYoUjqzfrMUm3Xiuxhs
	ow6eqwGMcbWKNi7owJuLy0QUMO4jOPIuH3lBdH3/urydh9/wqaxRr5cWCyaN2A==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 24 Jul 2026 15:24:58 +0200
Subject: [PATCH 1/9] index.rst: add introduction paragraphs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-rework-welcome-page-v1-1-491772cc4b65@bootlin.com>
References: <20260724-rework-welcome-page-v1-0-491772cc4b65@bootlin.com>
In-Reply-To: <20260724-rework-welcome-page-v1-0-491772cc4b65@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3306;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=cLK1dUaWVs2ngdQX1fe4/41SEddRF31xoQhw9V6JIjw=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqY2exTK/OHE1tTni9h28VUXW/6GkrnSyfvv1Sn
 MQQYdmrcfGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCamNnsQAKCRDRgEFAKaOo
 NmYdD/9kBZKM+HYHToSX8bWgZlio7E46SCoVMeEyzYdDho3DVAukCOjw9BS3qFecUMkn0dmavCo
 EkUlVJKcKCKPQI9w29Vee4yqUL9bvYMu15TXnL3jcePIvl8DycD7DsOA4wEf6+95Cub2qVz5qlr
 1LuFFlV0tXvsi8X1ntuNOSsyClWmBrWqp0fKntN70ETfMQLw1AdulxlkfTWv8n2a2PMnMPyLeQ1
 nrCS12+pm2do4bv6w5mb4dt2xHogQREULk36PDp9xxkYrqmExSfMubl1g7pXOuG2s/I7/CUd6OC
 bPJuoKAfv7yhfsjgYpHka8NsHfKRpMv/wfVvMZRx94XNfvNYsl0fFPoLXZUVCXs1b+fshUHAm9n
 GFhSYjhwvd41o0qZq/eZAiZsF+jWNqH4bWHfTjdv62PCbA+GLoGBYRwuaeqtn6q0z25PXGIdL/a
 2eIe846DBprSXA4BL1UwIMS4/gGmRxrw91BCVdz3Hv0lgXDwUPD4kf2Bjo+7/4AKVUnbBZxH7ZV
 ichzZAmIk117tnodFazddkckVNEg5UYBfXWiUaNeZyfWCKs5fC3YMXCPCUljHXiLPen6L5o/ifF
 KddAhkYiAHUzYrW/GmzlyVrpjYuOTagg1NE2IZ9kDHaa9K18jWkTFzAEHBaP76sICP8Uybe65b3
 JUSwpoxgXnQOpXw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Jul 2026 13:25:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10130

The homepage of the Yocto Project documentation currently has no
introduction and only displays the table of contents. Inspired by
https://docs.kernel.org, provide a short introduction to the
documentation and also precede each section with a short sentence about
what the section contains.

The section titles are voluntarily duplicated in the document itself and
in the toctree directive, so that the sidebar still contains them, and we
can have text between the section titles and the toctree content.
However this also duplicates the title in the document itself, so add
CSS directive in our customization file to hide the duplicates.

Note that these titles do not show in the PDF and ePub outputs as those
are generated differently.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/index.rst                         | 25 +++++++++++++++++++++++--
 documentation/sphinx-static/theme_overrides.css |  4 ++++
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/documentation/index.rst b/documentation/index.rst
index 46b775711..802f895b4 100644
--- a/documentation/index.rst
+++ b/documentation/index.rst
@@ -5,10 +5,19 @@
    You can adapt this file completely to your liking, but it should at least
    contain the root `toctree` directive.
 
+==========================================
 Welcome to the Yocto Project Documentation
 ==========================================
 
-|
+This is the top level of the Yocto Project documentation tree. The Yocto Project
+documentation is always a work in progress, just like the Yocto Project itself.
+Improvements to the documentation are always welcome; join the
+:yocto_lists:`docs mailing list </g/docs>` if you want to help out.
+
+Introduction and Overview
+=========================
+
+Get started using the Yocto Project.
 
 .. toctree::
    :maxdepth: 1
@@ -20,6 +29,13 @@ Welcome to the Yocto Project Documentation
    Yocto Project Technical Overview <https://www.yoctoproject.org/development/technical-overview/>
    Tips and Tricks Wiki <https://wiki.yoctoproject.org/wiki/TipsAndTricks>
 
+Manuals
+=======
+
+A collection of manuals covering many aspects of the Yocto Project, including
+reference definitions, tutorials, and details about the project's
+infrastructure.
+
 .. toctree::
    :maxdepth: 1
    :caption: Manuals
@@ -37,9 +53,14 @@ Welcome to the Yocto Project Documentation
    Test Environment Manual <test-manual/index>
    bitbake
 
+Security Reference
+==================
+
+Security-related processes and contact information for vulnerability reporting.
+
 .. toctree::
    :maxdepth: 1
-   :caption: Security
+   :caption: Security Reference
 
    Yocto Project Security Reference <security-reference/index>
 
diff --git a/documentation/sphinx-static/theme_overrides.css b/documentation/sphinx-static/theme_overrides.css
index 3cb16dbcc..f9e067239 100644
--- a/documentation/sphinx-static/theme_overrides.css
+++ b/documentation/sphinx-static/theme_overrides.css
@@ -103,6 +103,10 @@ em {
     background: #f8f8f8;
 }
 
+section#welcome-to-the-yocto-project-documentation p.caption {
+   display: none;
+}
+
 @media screen {
     .wy-nav-content {
        max-width: 1000px;

-- 
2.55.0


