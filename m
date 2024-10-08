Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6A50CEF176
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 13:43:41 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.9589.1728395013936511343
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Oct 2024 06:43:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ksD2vkGJ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1189DFF805;
	Tue,  8 Oct 2024 13:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728395012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=nX7znWNNZPz2cgxUlcB6XR/qPYdlOyq9Yob2vLFvdv0=;
	b=ksD2vkGJMFELcY87WweeUvCq1V3LCWu8Zf2Ux1DlpPqZ9+ciFbNWlcl2Hg2bTzOBTFo8bU
	3Z6pkNdAYskWC+Vvfa88zdtLf+mIQs+ZtP367KWrJwT0iIwjYfD9N7Jv3XpYilX4WJYjCw
	LpJzXZ8PVYE6hKXAzqhU9wVRy3JbwVbthIheaahcO4IyOw8kxCtwsIJpqQVkshry3myp9o
	nn04MsAF9XEexC952VwOxobSoCs40XcWyoPLtu2r01ZeoBG2/adUV64w94TZ1hj3KBwUD3
	UOpR9AuwKCDci0URIAk8v9gRVe+fpwMUam1IvOMmarDhbzjE2tTBw8l93byelw==
Date: Tue, 8 Oct 2024 15:43:31 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: docs@lists.yoctoproject.org
Subject: [master] Pull request
Message-ID: <20241008134331eee90c00@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 08 Oct 2024 13:43:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5404

The following changes since commit c32b55b3403dcfd76a4694ff407d4b513e14c8f4:

  doc/features: describe distribution feature pni-name (2024-09-03 10:35:52 +0200)

are available in the Git repository at:

  git://git.yoctoproject.org/yocto-docs contrib/abelloni/master-next

for you to fetch changes up to 98e7f378bc5670d23a6c2bdfcd3b7af965f7c450:

  release-notes-5.1: document spirv-tools reproducibility (2024-10-08 15:33:38 +0200)

----------------------------------------------------------------
Lee Chee Yang (1):
      migration-guide: add release notes for 4.0.21

Yoann Congal (4):
      migration/release-notes-5.1: document oeqa/selftest envvars change
      release-notes-5.1: document added python3-libarchive-c ptest
      release-notes-5.1: document fixed _test_devtool_add_git_url test
      release-notes-5.1: document spirv-tools reproducibility

 documentation/migration-guides/migration-5.1.rst   |  14 ++
 documentation/migration-guides/release-4.0.rst     |   1 +
 .../migration-guides/release-notes-4.0.21.rst      | 166 +++++++++++++++++++++
 .../migration-guides/release-notes-5.1.rst         |   8 +
 4 files changed, 189 insertions(+)
 create mode 100644 documentation/migration-guides/release-notes-4.0.21.rst

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

