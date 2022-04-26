Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C94D9C433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 09:04:34 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web09.4023.1650963864296238653
 for <docs@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 02:04:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PCaLx2HK;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3E81410000A;
	Tue, 26 Apr 2022 09:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1650963862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0yb8XnoR5sT8ASwlpVMeo7hVtC845a7nlRzZ2DeZAM0=;
	b=PCaLx2HKgJzkwDgWP5p+hZPuxYEW6o4is7bRG+iF5NJ3gR89rC10Nliq1et75X+SUsZwDM
	pKT2Z3b47lW3GeG+WiPlt/q+RP9oe7S2kLUd1qGPF+9eGVo1lnyq4cwhnaRq6aBa66Zr2M
	WNpK8dKGm3gf1dQG1EEEtGXnMIrHdcy0lvw1L0fTMnZ1bERm78+hXRvvFbyOdqGDi4Q6ia
	qbxDHzWG/bRqQdAQMxLOtY125xv8GQ96dzmq+l1UMeAT8AkcXyGCYQgxCo+0x8htcTQZkG
	Vu678rAd6ovEY1YErCFRU3lLHuHB8fp1t4HIDR1X0cppnD3ijrWy/mbeQjjIrg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v2] overview-manual: licensing section fixes
Date: Tue, 26 Apr 2022 11:04:19 +0200
Message-Id: <20220426090419.142496-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <16E9662CF849984C.25468@lists.yoctoproject.org>
References: <16E9662CF849984C.25468@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 26 Apr 2022 09:04:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2865

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Remove the reference to the GPL license, unnecessary
in this part of the manual and pointing to a wrong
link (LGPL instead of GPL).

Anyway, we have no authority to say that the MIT license
is compatible with the GPL.

Also provide details about the MIT license through Wikipedia,
instead of just the raw license text with no explanations
through opensource.org.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/overview-manual/development-environment.rst | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/documentation/overview-manual/development-environment.rst b/documentation/overview-manual/development-environment.rst
index 19095fc116..e171d7aaa3 100644
--- a/documentation/overview-manual/development-environment.rst
+++ b/documentation/overview-manual/development-environment.rst
@@ -616,13 +616,9 @@ this history, you can find basic information here:
 In general, the Yocto Project is broadly licensed under the
 Massachusetts Institute of Technology (MIT) License. MIT licensing
 permits the reuse of software within proprietary software as long as the
-license is distributed with that software. MIT is also compatible with
-the GNU General Public License (GPL). Patches to the Yocto Project
+license is distributed with that software. Patches to the Yocto Project
 follow the upstream licensing scheme. You can find information on the
-MIT license
-`here <https://www.opensource.org/licenses/mit-license.php>`__. You can
-find information on the GNU GPL
-`here <https://www.opensource.org/licenses/LGPL-3.0>`__.
+MIT license `here <https://en.wikipedia.org/wiki/MIT_License>`__.
 
 When you build an image using the Yocto Project, the build process uses
 a known list of licenses to ensure compliance. You can find this list in
-- 
2.25.1


