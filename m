Return-Path: <othacehe@gnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18020C02194
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 10:28:57 +0000 (UTC)
Received: from eggs.gnu.org (eggs.gnu.org [209.51.188.92])
 by mx.groups.io with SMTP id smtpd.web11.113138.1738664933319784462
 for <docs@lists.yoctoproject.org>;
 Tue, 04 Feb 2025 02:28:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gnu.org header.s=fencepost-gnu-org header.b=JEXo7zsK;
 spf=pass (domain: gnu.org, ip: 209.51.188.92, mailfrom: othacehe@gnu.org)
Received: from fencepost.gnu.org ([2001:470:142:3::e])
	by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.90_1)
	(envelope-from <othacehe@gnu.org>)
	id 1tfGAm-0000Ja-AQ
	for docs@lists.yoctoproject.org; Tue, 04 Feb 2025 05:28:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gnu.org;
	s=fencepost-gnu-org; h=MIME-Version:Date:Subject:To:From:in-reply-to:
	references; bh=KgUdA2KJl6fhPWqNyZdRz3WdS/8pPsDuMvXtKIWJR6Q=; b=JEXo7zsKWl9A2q
	iAQ1rt/T+/6RIMb5i/7ITwTk2I8JIBUbF7RC47UEZjih6XxjJ+YGHkLU9l8m52pDmACzfD1SzOM/P
	iFB1Qx62DXKT0b5pHi5znD3xs4+/xBsTTp7CovyXInj5LhPtTscpQqqIi/PqTM6ZE0Dvl/iIz7xbf
	dFEoKa5OQV6jv36qONJPsaDr+WLf8exW543b/Tgtrvw6rNfvhmdcDXoDqQv0MPeKHTnz1nuoA+H1P
	Cjpm+OfjJGcCnlFRNmlf7gG6Ilzm4vXYZyJe1+RrgkmgftzGfuMWLITK3FDW6KX4egfXlPYWwS2tq
	RsiaAxaxXUVNQthnyYYg==;
From: Mathieu Othacehe <othacehe@gnu.org>
To: docs@lists.yoctoproject.org
Cc: Mathieu Othacehe <othacehe@gnu.org>
Subject: [PATCH] profile-manual: Document the PACKAGE_KEEP_SECTIONS variable.
Date: Tue,  4 Feb 2025 11:28:47 +0100
Message-ID: <20250204102847.27201-1-othacehe@gnu.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 04 Feb 2025 10:28:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6243

Document the 'PACKAGE_KEEP_SECTIONS' variable that can be used to keep some
specific ELF sections while stripping binaries and libraries.

That one can then be used to keep the .debug_frame section around for
example, this way:

PACKAGE_KEEP_SECTIONS = ".debug_frame"

By using libunwind + minidebuginfo, that provides a way for users to get
debug_frame based backtraces on target.

Signed-off-by: Mathieu Othacehe <othacehe@gnu.org>
---
 documentation/profile-manual/intro.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/documentation/profile-manual/intro.rst b/documentation/profile-manual/intro.rst
index 317912552..a7243c1ca 100644
--- a/documentation/profile-manual/intro.rst
+++ b/documentation/profile-manual/intro.rst
@@ -75,3 +75,9 @@ Additionally, in order to generate the right type of debug info, we also need to
 set :term:`PACKAGE_DEBUG_SPLIT_STYLE` in the ``local.conf`` file::
 
    PACKAGE_DEBUG_SPLIT_STYLE = 'debug-file-directory'
+
+When you are building a stripped image, you can also keep some specific ELF
+sections in the image by setting :term:`PACKAGE_KEEP_SECTIONS` in the
+``local.conf`` file::
+
+   PACKAGE_KEEP_SECTIONS = ".debug_frame"
-- 
2.47.1


