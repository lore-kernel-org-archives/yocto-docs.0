Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E197CE79B1
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 08:16:13 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.32324.1695197765929764981
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Sep 2023 01:16:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hAITAgrH;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F055C1BF206;
	Wed, 20 Sep 2023 08:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695197764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9OcZTZ6teY1FrCtqYmhMBPk17aSkQdMfjIgzG2k1wgE=;
	b=hAITAgrHfTztKRWooJ9QVLMetghhs4cgObKkQXee+1w4Dqp3k83HmbVKELhreAiuwf+F9a
	l3QzIQrTGWbXP+qo6FCoi/c7ktsXsSyRJkX541O+yf76it+BW4b4ysBRxMfqaNv6hCJQ4t
	bXwUDuRXQi0Tz58Kz5+YYwVv6j3qguJtEmzVx+yhX6AXjDaFKVZUpF1DOv3QJHzzIheAkB
	a4LFTMkd2YnWOkOQ5laKshC9Og6BHpimyWlogy3BQzi1WH25w/Ol2zUCAQ79dCilDnVh/C
	TT01njW8RJ9Wkm7JwwJjtyrAuA/CRLQG+Sj5+sIbo01rIOGuFWse6U82RuCEMw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 03/10] documentation/README: align with master
Date: Wed, 20 Sep 2023 10:15:37 +0200
Message-Id: <20230920081544.1226760-4-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230920081544.1226760-1-michael.opdenacker@bootlin.com>
References: <20230920081544.1226760-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Sep 2023 08:16:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4250

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/README | 43 +++++++++++++++++++++++++++++++++++--------
 1 file changed, 35 insertions(+), 8 deletions(-)

diff --git a/documentation/README b/documentation/README
index 6f6a8ec842..4d31036e69 100644
--- a/documentation/README
+++ b/documentation/README
@@ -34,16 +34,18 @@ Manual Organization
 
 Here the folders corresponding to individual manuals:
 
+* brief-yoctoprojectqs - Yocto Project Quick Start
 * overview-manual      - Yocto Project Overview and Concepts Manual
-* sdk-manual           - Yocto Project Software Development Kit (SDK) Developer's Guide.
+* contributor-guide    - Yocto Project and OpenEmbedded Contributor Guide
+* ref-manual           - Yocto Project Reference Manual
 * bsp-guide            - Yocto Project Board Support Package (BSP) Developer's Guide
 * dev-manual           - Yocto Project Development Tasks Manual
 * kernel-dev           - Yocto Project Linux Kernel Development Manual
-* ref-manual           - Yocto Project Reference Manual
-* brief-yoctoprojectqs - Yocto Project Quick Start
 * profile-manual       - Yocto Project Profiling and Tracing Manual
+* sdk-manual           - Yocto Project Software Development Kit (SDK) Developer's Guide.
 * toaster-manual       - Toaster User Manual
 * test-manual          - Yocto Project Test Environment Manual
+* migration-guides     - Yocto Project Release and Migration Notes
 
 Each folder is self-contained regarding content and figures.
 
@@ -129,6 +131,10 @@ Also install the "inkscape" package from your distribution.
 Inkscape is need to convert SVG graphics to PNG (for EPUB
 export) and to PDF (for PDF export).
 
+Additionally install "fncychap.sty" TeX font if you want to build PDFs. Debian
+and Ubuntu have it in "texlive-latex-extra" package while RedHat distributions
+and OpenSUSE have it in "texlive-fncychap" package for example.
+
 To build the documentation locally, run:
 
  $ cd documentation
@@ -271,6 +277,19 @@ websites.
 More information can be found here:
 https://sublime-and-sphinx-guide.readthedocs.io/en/latest/references.html.
 
+For external links, we use this syntax:
+`link text <link URL>`__
+
+instead of:
+`link text <link URL>`_
+
+Both syntaxes work, but the latter also creates a "link text" reference
+target which could conflict with other references with the same name.
+So, only use this variant when you wish to make multiple references
+to this link, reusing only the target name.
+
+See https://stackoverflow.com/questions/27420317/restructured-text-rst-http-links-underscore-vs-use
+
 Anchor (<#link>) links are forbidden as they are not checked by Sphinx during
 the build and may be broken without knowing about it.
 
@@ -340,13 +359,16 @@ The sphinx.ext.intersphinx extension is enabled by default
 so that we can cross reference content from other Sphinx based
 documentation projects, such as the BitBake manual.
 
-References to the BitBake manual can be done:
+References to the BitBake manual can directly be done:
  - With a specific description instead of the section name:
-  :ref:`Azure Storage fetcher (az://) <bitbake:bitbake-user-manual/bitbake-user-manual-fetching:fetchers>`
+  :ref:`Azure Storage fetcher (az://) <bitbake-user-manual/bitbake-user-manual-fetching:fetchers>`
  - With the section name:
-  :ref:`bitbake:bitbake-user-manual/bitbake-user-manual-intro:usage and syntax` option
- - Linking to the entire BitBake manual:
-  :doc:`BitBake User Manual <bitbake:index>`
+  :ref:`bitbake-user-manual/bitbake-user-manual-intro:usage and syntax` option
+
+If you want to refer to an entire document (or chapter) in the BitBake manual,
+you have to use the ":doc:" macro with the "bitbake:" prefix:
+ - :doc:`BitBake User Manual <bitbake:index>`
+ - :doc:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata`" chapter
 
 Note that a reference to a variable (:term:`VARIABLE`) automatically points to
 the BitBake manual if the variable is not described in the Reference Manual's Variable Glossary.
@@ -355,6 +377,11 @@ BitBake manual as follows:
 
   :term:`bitbake:BB_NUMBER_PARSE_THREADS`
 
+This would be the same if we had identical document filenames in
+both the Yocto Project and BitBake manuals:
+
+  :ref:`bitbake:directory/file:section title`
+
 Submitting documentation changes
 ================================
 
-- 
2.34.1


