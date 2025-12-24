Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 177A1E776F0
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:32:24 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.123215.1766593942110174214
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:32:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=kiQLdx9f;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8BD934E41D91
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 63ACF6073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7432D10AB137D;
	Wed, 24 Dec 2025 17:32:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593940; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=y7CA3V7uznE+fphFZ+WLkpoaTi/BmIfw9byjefTreg0=;
	b=kiQLdx9fqJU1DFRGjMcrsa15aa2EnViwAql2ANrRTXZ6N3x6PKXp6MB7HEAx40XLHZN3Px
	lnpKEQqRubc79P/YrNCYoPCvGhHrx2Dsdd1Ey621TfgpZifxXamK9OpBEaaC4IUaFBfDOr
	XMscSidH676mrCqR4S+BwhEfyqRqREQpyaBJvg3LSoKY6LmH4RXqPJd17iK+H2EpuDwpm7
	qegPG+cnJybqPBh2nXmHtzrWfN07/da45Zq4eT+jZOX1MTEZenj7oILmmb42FHtoXuUmiT
	9hgouqigW95tcmF/MIruCgzT0vRnZNVM7oN072GUdR0JM9/iye6+FigQruzgPA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:32:12 +0100
Subject: [PATCH 46/53] ref-manual/faq.rst: remove obsolete poky repo
 references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-remove-poky-references-v1-46-658a5f4dbde2@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
In-Reply-To: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3877;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=lrsV/HgK4Z6z9JNo9fzZOF9sPtr2fn5IUsAmiEO8e10=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBVv43ZtQouLvT8fTiUFtTrrQnqGC/y1ELjwH
 LsbmRr6iRiJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwVbwAKCRDRgEFAKaOo
 NrapD/94LlTlvhxz7NilMy3Uafo6efZ647mQ1hQZEWaLDeuUX/2jg0KQKarC4H5g6suI1IF2yTP
 GAC50zxhYd92tPF3bprqJPGlb9uEZ3DMHuSMHSGVEOT4uJhcfhq981rIPAVpg5dJzbTIqbWzYw4
 L7NqRcPJQEDCZqiMbL1kOttzT9HYM/RLP/Ya161tjQqMZtayK1X67YDAlIMSOot+Iwu6r785S61
 bBrsRoRCNzufuZCCKbjJu7Ep2s5TNPLbwCwIkI1iy3Ydm2h//Yj59dkwubBgr/MW1zAD8/lxxfW
 e28CMECfzlWlttLBMIM2zotWPKSoRpNZ9tvLE2Yv3+PH9uji49jzD47xSe5vycj6y6jbBIAeaCm
 dx0EyFNH/svdrw4O2h26/hIV1oaBQm/QBDcussInpR2iGJIUaJU6RiSmgr0udLCzB/nA1ds4OoJ
 1mDRQuPkHALnuphMY7kgQ626n4b2LKlGAklkNf1E2CxA4ENgiF/+aTTNK3fqePa4i/yYDgY9TNc
 BOOkskNh6JCLqYYG4CGM1OJMbeoV7LakisE8sBf+fncAvGbfxfDsVGeMG06TMAOXFMVstR9dSge
 lcM2WiBZ+na+3Tp/Z6twJwi71t+FmxXEy+tJp+lJWeqHMuONNjDdusqioN48vaOmc/uYzGgUbFY
 SRswi8IA6LPizZg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8375

Refresh the document now that the Poky repository is obsolete.

Rework the difference between Poky and OpenEmbedded. Copy the note from
terms.rst regarding the now obsolete Poky repository.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/faq.rst | 43 ++++++++++++++++++++++++++++++----------
 1 file changed, 32 insertions(+), 11 deletions(-)

diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index 406b2c388..cd4801baa 100644
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
+System` and :term:`BitBake`. The :term:`metadata` used involved to build the
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
 
@@ -87,8 +108,8 @@ configurable. You can setup the build system to get source code in most
 environments if HTTP transport is available.
 
 When the build system searches for source code, it first tries the local
-download directory. If that location fails, Poky tries
-:term:`PREMIRRORS`, the upstream source, and then
+download directory. If that location fails, the :term:`OpenEmbedded Build
+System` tries :term:`PREMIRRORS`, the upstream source, and then
 :term:`MIRRORS` in that order.
 
 Assuming your distribution is "poky", the OpenEmbedded build system uses

-- 
2.51.0


