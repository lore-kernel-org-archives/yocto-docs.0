Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 481B3F30934
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 10:44:01 +0000 (UTC)
Received: from smtp-8fa9.mail.infomaniak.ch (smtp-8fa9.mail.infomaniak.ch [83.166.143.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41372.1772707434192347650
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 02:43:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@0leil.net header.s=20231125 header.b=ZH5nVTI7;
 spf=pass (domain: 0leil.net, ip: 83.166.143.169, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fRR3X5DfWzJXY;
	Thu,  5 Mar 2026 11:43:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1772707432;
	bh=79fb7UhARdrkhAAtdt8an9w5PtbGqAIAabnfajJIw0U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZH5nVTI7xc7+Qj54y2y5DTMDmnVSHDhUwxsdts7XsK0GKG+lApog2SwY+o2r5Bpln
	 jDOvcDQPxzvO5/bM++H8gIeppKTW2OPjRZYgYaM0CRHuo9ft/7cX82oF4hxzU8sI8H
	 WqH3nqlw2NYd1F09ayMunHQ+uozx0QWjs1ew7R51/TVkZIuc8nvktXLASGxsCV28BS
	 XV4FZUS2D1I84ZOs7mkO8d4rE5RpNwDMC26alH1Av0QdkLYfcdMg6llF568/GWKA5b
	 gIvnjiae06bfuxCM/a+a3T98QFY1jsllMOfydcJpDGrSap0umqtfwNrCjhzSeZoIlo
	 nzkh3APBJKB5Q==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4fRR3X22gJz21k;
	Thu,  5 Mar 2026 11:43:52 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Thu, 05 Mar 2026 11:43:43 +0100
Subject: [PATCH 1/2] ref-manual/system-requirements: update list of EoL
 distros we still test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-f43-v1-1-5dbf939b079b@cherry.de>
References: <20260305-f43-v1-0-5dbf939b079b@cherry.de>
In-Reply-To: <20260305-f43-v1-0-5dbf939b079b@cherry.de>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Mar 2026 10:44:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9059

From: Quentin Schulz <quentin.schulz@cherry.de>

Fedora 41 is EoL since end of 2025[1] and Ubuntu 25.04 since mid January
2026[2], so let's add them to the list of distros we're testing but
don't receive updates for.

[1] https://docs.fedoraproject.org/en-US/releases/eol/#_unsupported_fedora_linux_releases
[2] https://documentation.ubuntu.com/project/release-team/list-of-releases/#end-of-life
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/ref-manual/system-requirements.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index e7c1c3916..c51061643 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -91,7 +91,9 @@ organizations publishing them no longer make updates publicly available:
 
 -  Fedora 39
 -  Fedora 40
+-  Fedora 41
 -  OpenSUSE Leap 15.5
+-  Ubuntu 25.04
 
 Note that the Yocto Project doesn't have access to private updates
 that some of these versions may have. Therefore, our testing has

-- 
2.53.0


