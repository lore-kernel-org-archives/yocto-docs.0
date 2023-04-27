Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDCD3C77B73
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 08:57:11 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.15731.1682585830111235559
 for <docs@lists.yoctoproject.org>;
 Thu, 27 Apr 2023 01:57:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=X2dU6Wj/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E507F240004;
	Thu, 27 Apr 2023 08:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1682585828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C876NZSwFtMnbLnrTf7Q4ibRa4RwQwk2TjS4mD2qaYc=;
	b=X2dU6Wj/OFYrcdWwTMmxoPPnghPShGIR6zsZZax4/lnUi4wbpsDPMCowkzzRcisP+wh71l
	q/XraxhWk/TKalQZON79QIKLR5eJiVT0xD4PIg+ecHjDce3hue85Jyu8Be+Gysn1ZOj3HS
	o0dk2oO36ffhuzw6NbIOHJRotq/70y965RjOQf/UTHTgLgDLTex08pPdak3bHN73Wlx9nE
	m55Q5PVo4pBLQM3dxPRGYXds7kqf/GTPnSemw4eoL/CoUCQ+l0NIwE8Y2wIbXL7FSCk7Ct
	rBWF6+7ZN5WfHr1K6sOYgv9fSe5XcN0iAfWkfZLTohuNWil6DaySMe8DSKH7Ag==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Lee Chee Yang <chee.yang.lee@intel.com>
Subject: [PATCH] migration-guides: release-notes-4.0.9.rst: add missing SPDX info
Date: Thu, 27 Apr 2023 10:56:56 +0200
Message-Id: <20230427085656.18352-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <1759BE70A86F9C52.22629@lists.yoctoproject.org>
References: <1759BE70A86F9C52.22629@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 27 Apr 2023 08:57:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3872

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
CC: Lee Chee Yang <chee.yang.lee@intel.com>
---
 documentation/migration-guides/release-notes-4.0.9.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/migration-guides/release-notes-4.0.9.rst b/documentation/migration-guides/release-notes-4.0.9.rst
index 883514e686..7c35b85810 100644
--- a/documentation/migration-guides/release-notes-4.0.9.rst
+++ b/documentation/migration-guides/release-notes-4.0.9.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
 Release notes for Yocto-4.0.9 (Kirkstone)
 -----------------------------------------
 
-- 
2.34.1


