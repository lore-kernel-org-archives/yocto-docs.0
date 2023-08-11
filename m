Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 804CFC001B0
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 17:55:44 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.49491.1691776538893874929
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Aug 2023 10:55:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iXF3yl80;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A86691BF205;
	Fri, 11 Aug 2023 17:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691776536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oMcHl3ZmhHoJhz5q6B5dh9JgcV4WenZ08O2fPtv1D8U=;
	b=iXF3yl80fc4g1AFB5CH/ybNH7LT4HP60MJM2caZmWX1SRflsacGuUro7BPzT2ISsNz9dq9
	cFRvlbs7I6SoYZkPppytrQrII9c4tI+nfFWilCujN3Hchu9kW7puDgv1Uxn3l+ptCR3ikO
	qDvLqGyO4fyH+zPH73Y4k1fiLu9t6uQGbt3VsRxog9sds2r1+FzRz4g69mNsXZiPpOYbwq
	sgWR9GLTyfj6lkBma1cDVdS6m5zHxC1/QpSGgj8D+ARR5ggzzLVStRFRyMS5RIqahb0QaJ
	MWE9w+YjnW+pkG8+ULpYwx1m5Lls/ReI9ZgdZdO6G68ZT9m3kNA++tcNzyS87A==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [PATCH 1/5] contributor guide: call section "Reporting a defect"
Date: Fri, 11 Aug 2023 19:55:23 +0200
Message-Id: <20230811175527.1116864-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230811175527.1116864-1-michael.opdenacker@bootlin.com>
References: <20230811175527.1116864-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Aug 2023 17:55:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4146

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Instead of "Submitting a defect".

We all write bugs, and nobody needs documentation
support for doing so!

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by: Joshua Watt <JPEWhacker@gmail.com>
---
 documentation/contributor-guide/index.rst                       | 2 +-
 .../contributor-guide/{submit-defect.rst => report-defect.rst}  | 2 +-
 documentation/dev-manual/debugging.rst                          | 2 +-
 documentation/ref-manual/resources.rst                          | 2 +-
 documentation/ref-manual/system-requirements.rst                | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)
 rename documentation/contributor-guide/{submit-defect.rst => report-defect.rst} (98%)

diff --git a/documentation/contributor-guide/index.rst b/documentation/contributor-guide/index.rst
index 7a39f994e2..8fa65045a3 100644
--- a/documentation/contributor-guide/index.rst
+++ b/documentation/contributor-guide/index.rst
@@ -19,7 +19,7 @@ this.
    :numbered:
 
    identify-component
-   submit-defect
+   report-defect
    recipe-style-guide
    submit-change
 
diff --git a/documentation/contributor-guide/submit-defect.rst b/documentation/contributor-guide/report-defect.rst
similarity index 98%
rename from documentation/contributor-guide/submit-defect.rst
rename to documentation/contributor-guide/report-defect.rst
index 527ffb2dc0..8ef133b842 100644
--- a/documentation/contributor-guide/submit-defect.rst
+++ b/documentation/contributor-guide/report-defect.rst
@@ -1,6 +1,6 @@
 .. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
-Submitting a Defect Against the Yocto Project and OpenEmbedded
+Reporting a Defect Against the Yocto Project and OpenEmbedded
 **************************************************************
 
 You can use the Yocto Project instance of
diff --git a/documentation/dev-manual/debugging.rst b/documentation/dev-manual/debugging.rst
index 3a8d5080ce..890578cc05 100644
--- a/documentation/dev-manual/debugging.rst
+++ b/documentation/dev-manual/debugging.rst
@@ -1235,7 +1235,7 @@ Here are some other tips that you might find useful:
    :yocto_bugs:`Bugzilla <>`. For information on
    how to submit a bug against the Yocto Project, see the Yocto Project
    Bugzilla :yocto_wiki:`wiki page </Bugzilla_Configuration_and_Bug_Tracking>`
-   and the ":doc:`../contributor-guide/submit-defect`" section.
+   and the ":doc:`../contributor-guide/report-defect`" section.
 
    .. note::
 
diff --git a/documentation/ref-manual/resources.rst b/documentation/ref-manual/resources.rst
index 324d1fad10..8c3726e83b 100644
--- a/documentation/ref-manual/resources.rst
+++ b/documentation/ref-manual/resources.rst
@@ -45,7 +45,7 @@ your expectations).
 For a general procedure and guidelines on how to use Bugzilla to submit a bug
 against the Yocto Project, see the following:
 
--  The ":doc:`../contributor-guide/submit-defect`"
+-  The ":doc:`../contributor-guide/report-defect`"
    section in the Yocto Project and OpenEmbedded Contributor Guide.
 
 -  The Yocto Project :yocto_wiki:`Bugzilla wiki page </Bugzilla_Configuration_and_Bug_Tracking>`
diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 9ae7b4e63b..66ab65d2b7 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -134,7 +134,7 @@ tested by the &DISTRO; release ("&DISTRO_NAME;"), but no longer are:
       interested in hearing about your experience. For information on
       how to submit a bug, see the Yocto Project
       :yocto_wiki:`Bugzilla wiki page </Bugzilla_Configuration_and_Bug_Tracking>`
-      and the ":doc:`../contributor-guide/submit-defect`"
+      and the ":doc:`../contributor-guide/report-defect`"
       section in the Yocto Project and OpenEmbedded Contributor Guide.
 
 Required Packages for the Build Host
-- 
2.34.1


