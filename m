Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D67DAC3F6B0
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 10:35:57 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web08.23067.1659350147537799076
 for <docs@lists.yoctoproject.org>;
 Mon, 01 Aug 2022 03:35:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.198,
 mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id 98D66C0007;
	Mon,  1 Aug 2022 10:35:45 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 3/4] docs: README: add TeX font package required for building
 PDF
Date: Mon,  1 Aug 2022 12:35:28 +0200
Message-Id: <20220801103529.2053164-3-foss+yocto@0leil.net>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220801103529.2053164-1-foss+yocto@0leil.net>
References: <20220801103529.2053164-1-foss+yocto@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 01 Aug 2022 10:35:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3097

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

The fncychap.sty font needs to be installed on the host in order to be
able to build the PDF version of the docs, so let's mention it in the
README.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 documentation/README | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/documentation/README b/documentation/README
index 6f6a8ec84..6333f0496 100644
--- a/documentation/README
+++ b/documentation/README
@@ -129,6 +129,10 @@ Also install the "inkscape" package from your distribution.
 Inkscape is need to convert SVG graphics to PNG (for EPUB
 export) and to PDF (for PDF export).
 
+Additionally install "fncychap.sty" TeX font if you want to build PDFs. Debian
+and Ubuntu have it in "texlive-latex-extra" package while RedHat distributions
+and OpenSUSE have it in "texlive-fncychap" package for example.
+
 To build the documentation locally, run:
 
  $ cd documentation
-- 
2.37.1


