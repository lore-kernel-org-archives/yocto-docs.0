Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A09A4C41535
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:51:59 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.3386.1650591648340393959
 for <docs@lists.yoctoproject.org>;
 Thu, 21 Apr 2022 18:40:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=j5Wqqvbl;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 8A02B20E57FF; Thu, 21 Apr 2022 18:40:47 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 8A02B20E57FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1650591647;
	bh=eEZXyuDg10hb/ZaW6IMw93lSnHj7lH+4SoUrTTUB3L8=;
	h=From:To:Subject:Date:From;
	b=j5WqqvbljtNYshCRQAbMKQ0jJk4SkpocmBF6odOzmTZspMuEb0J21HmUhwtzR2Yul
	 GDzx/+wEUZa3EAlGyrX8z9ixn1JQ0gmySlTdYwq1ldakajRlBCsaoNFNPaomVomOd5
	 KKHt31GM/gEqkQ/giV5f074r3TWCYlh2CXyo3UOs=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 0/9] Release documentation for 4.0
Date: Thu, 21 Apr 2022 18:40:33 -0700
Message-Id: <cover.1650591341.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Apr 2022 16:51:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2822

Release notes, migration guide and related changes for the
4.0 release.

(Note that the "Repositories / Downloads" section of the release notes
still needs to be filled in.)


The following changes since commit 4755961bbb5f674a7532b91cca20ea44a1e22ae7:

  docs: sphinx-static: switchers.js.in: do not mark branches as outdated (2022-04-20 17:24:31 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib paule/4.0-release
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=paule/4.0-release

Paul Eggleton (9):
  migration-3.4: add missing entry on EXTRA_USERS_PARAMS
  ref-manual: add a note about hard-coded passwords
  ref-manual: mention wildcarding support in INCOMPATIBLE_LICENSE
  ref-manual: add mention of vendor filtering to CVE_PRODUCT
  ref-manual: add KERNEL_DEBUG_TIMESTAMPS
  ref-manual: add XZ_THREADS and ZSTD_THREADS
  ref-manual: add empty-dirs QA check and QA_EMPTY_DIRS*
  migration-guides: complete migration guide for 4.0
  migration-guides: add release notes for 4.0

 documentation/migration-guides/migration-3.4.rst   |   7 +
 documentation/migration-guides/migration-4.0.rst   | 345 +++++---
 .../migration-guides/release-notes-4.0.rst         | 864 +++++++++++++++++++++
 documentation/ref-manual/classes.rst               |  12 +
 documentation/ref-manual/qa-checks.rst             |  10 +-
 documentation/ref-manual/variables.rst             |  48 +-
 6 files changed, 1161 insertions(+), 125 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-4.0.rst

-- 
1.8.3.1


