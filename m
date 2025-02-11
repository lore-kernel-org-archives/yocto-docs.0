Return-Path: <othacehe@gnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24219C0219B
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 16:12:56 +0000 (UTC)
Received: from eggs.gnu.org (eggs.gnu.org [209.51.188.92])
 by mx.groups.io with SMTP id smtpd.web10.3142.1739290374765018476
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Feb 2025 08:12:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gnu.org header.s=fencepost-gnu-org header.b=nON9Dhhy;
 spf=pass (domain: gnu.org, ip: 209.51.188.92, mailfrom: othacehe@gnu.org)
Received: from fencepost.gnu.org ([2001:470:142:3::e])
	by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.90_1)
	(envelope-from <othacehe@gnu.org>)
	id 1thssW-0000sc-CP; Tue, 11 Feb 2025 11:12:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gnu.org;
	s=fencepost-gnu-org; h=MIME-Version:Date:Subject:To:From:in-reply-to:
	references; bh=8A5AuGQXrFQR7XhwfUfWuuj+yS7Ttls35LGsj5L9tvs=; b=nON9DhhyPBGITA
	gDRBQomghBTFPOgW8Sbn9XQItjifOqet3gVrqFqWFzbHq0BXaLI+wXqinvgcyLLHOcuWNwJKPPJeJ
	mKuVkWqCe+dHqLGJGklKQLutsA8vIqJZBzsot61UlZr6VOrfTWQLccxrqwmlIb2gqa6xPRCvo1/1F
	S2HZblxRA4hW4ry2127/CiM8qc8QnTIzyr4YiLpkpWEILr+cH4y2ZLJm1cp+KiP4VOmZBaiOPnrpb
	c87UqYFYPHfSZTNGtZKmM+v14J6zbF+OasZA9AkAIQy+5s2SGtPBJfchGg+c54mMC8WRSqttZIIYu
	9LgXeG/oN/4zYq77V7mA==;
From: Mathieu Othacehe <othacehe@gnu.org>
To: docs@lists.yoctoproject.org
Cc: Antonin Godard <antonin.godard@bootlin.com>,
	Mathieu Othacehe <othacehe@gnu.org>
Subject: [PATCH v3 0/2] Document the PACKAGE_KEEP_DEBUG_FRAME variable
Date: Tue, 11 Feb 2025 17:12:37 +0100
Message-ID: <20250211161239.5396-1-othacehe@gnu.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Feb 2025 16:12:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6335

Hello,

That series is introducing a PACKAGE_KEEP_DEBUG_FRAME variable that can be
used to keep the .debug_frame ELF section when stripping packages.

It is then building upon that to present how to get human-readable backtraces
on target, possibly also relying on the minidebuginfo mechanism.

Thanks,

Mathieu

v2: https://lists.yoctoproject.org/g/docs/message/6252
poky: https://git.yoctoproject.org/poky/commit/?h=master-next&id=10448200b63bdc45b39504ebcddd85b5f274f0c4

Changelog:
v2: Fix a build issue
v3: Document the PACKAGE_KEEP_DEBUG_FRAME
variable rather that the PACKAGE_KEEP_SECTIONS variable because the former
approach was preferred and merged into poky.

Mathieu Othacehe (2):
  profile-manual: Document the PACKAGE_KEEP_DEBUG_FRAME variable.
  dev-manual/debugging: Add a "Backtraces or target" section

 documentation/dev-manual/debugging.rst | 55 ++++++++++++++++++++++++++
 documentation/ref-manual/variables.rst |  9 +++++
 2 files changed, 64 insertions(+)

-- 
2.47.1


