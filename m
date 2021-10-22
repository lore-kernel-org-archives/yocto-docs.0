Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA7D0C433F5
	for <webhook@archiver.kernel.org>; Fri, 22 Oct 2021 03:09:50 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.3377.1634872189959059434
 for <docs@lists.yoctoproject.org>;
 Thu, 21 Oct 2021 20:09:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=GDc+RgSt;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id CF9E120B7179; Thu, 21 Oct 2021 20:09:48 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com CF9E120B7179
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1634872188;
	bh=06/3RaFRDqvU7f4Sz9oSZTYI8VXgcuGQ/xyib0AWHfU=;
	h=From:To:Subject:Date:From;
	b=GDc+RgStb1QRcxlnqH9KEVCNcfz1v4LxxtXqhMHlBN4mcCE1R7kamXVC8AHE3eTku
	 zEoONlzctGLnP+Qm7PNzNr3TGtYeb6Kr0sXTpGScduv9ofUWWilC6BJQ0P1d0K2B0t
	 H/OcQTmZ9ToogA716t103vBJmJtTtRHfwfubMlgw=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 0/2] Fixes for 3.4 changes
Date: Thu, 21 Oct 2021 20:09:27 -0700
Message-Id: <cover.1634872024.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Oct 2021 03:09:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2035

In wrapping up the release notes for 3.4 I found a few more things that
I missed earlier.

Note: these don't need to be rushed into the release, as long as we can
regenerate the online docs after merging that should be fine.


The following changes since commit 160d672641c52338ba499edfb66339a10b088490:

  ref-manual: document SOURCE_DATE_EPOCH (2021-10-20 18:44:19 +0200)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib paule/3.4-fixes
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=paule/3.4-fixes

Paul Eggleton (2):
  poky.yaml: fix lz4 package name for older Ubuntu versions
  migration-3.4: add some extra packaging notes

 documentation/migration-guides/migration-3.4.rst | 9 +++++++++
 documentation/poky.yaml                          | 2 +-
 2 files changed, 10 insertions(+), 1 deletion(-)

-- 
1.8.3.1


