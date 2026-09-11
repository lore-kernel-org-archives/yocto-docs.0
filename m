Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E910CC88E59
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 15:08:08 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41729.1789139276787789580
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Sep 2026 08:07:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=LeChSaaL;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-20260911150752f98893cdb500020781-jlzw9m@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260911150752f98893cdb500020781
        for <docs@lists.yoctoproject.org>;
        Fri, 11 Sep 2026 17:07:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=16z/nbkvAsp+J0QIKFekQJiPwZXncNBdC/gyXO47loE=;
 b=LeChSaaLAvE8uUNQS6/PbpMh/6yYYVl/PLEGmL8W8tTbAXLTFN2DGZZQlQ15FAGEex0JJQ
 kX9qUQT6Bq2y4ygDop9pwbatL/qs9zvSFimEONBnISj0lVtYp5Xxbkiz252jmiG514k5ffei
 X45cF6lRgAYO4uQx5cncpXHYDIAtkfjd/iM550o9bQaACAgY9M6Y+nS9g5K4SpDc8iYtPdAk
 Ktlif+pFy3UHglYrwQDJ3uM7cs2st8mLJaZDWlF7w1UmZr2LehcDKkPPhdiQi4oBXYFoA6j0
 iM9y4U6Vasq7LyOpnXmwkzQwDaTL0ddVtg+Te0gIbHo7rTKuSzGyBX8g==;
From: AdrianF <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 2/4] conf.py: enable sphinx.ext.graphviz extension
Date: Fri, 11 Sep 2026 17:07:48 +0200
Message-ID: <20260911150750.75697-2-adrian.freihofer@siemens.com>
In-Reply-To: <20260911150750.75697-1-adrian.freihofer@siemens.com>
References: <20260911150750.75697-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 15:08:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10467

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Required by the .. graphviz:: diagrams added to dev-manual/devtool.rst
in a following commit.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 documentation/conf.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/documentation/conf.py b/documentation/conf.py
index 48d28a686..7144d6db1 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -48,6 +48,7 @@ needs_sphinx = "4.0"
 extensions = [
     'sphinx.ext.autosectionlabel',
     'sphinx.ext.extlinks',
+    'sphinx.ext.graphviz',
     'sphinx.ext.intersphinx',
     'sphinx_copybutton',
     'sphinxcontrib.rsvgconverter',
-- 
2.55.0


