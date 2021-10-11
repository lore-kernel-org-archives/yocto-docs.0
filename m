Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F13C3C43219
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 03:58:04 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.7349.1633924683544146588
 for <docs@lists.yoctoproject.org>;
 Sun, 10 Oct 2021 20:58:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=VyApMFJn;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id C8A4C20B8008; Sun, 10 Oct 2021 20:58:02 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C8A4C20B8008
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1633924682;
	bh=4Z/XqtE11YuF2kvC1+uANBoWin0eB9H2HnzLfHpufiI=;
	h=From:To:Subject:Date:From;
	b=VyApMFJnGSkHpeysqGHqm0nZX0eddbFCWf2psj0+jfZ38h0x8YUpu2tHcFtWwrrAp
	 BvEB8CZbpCJy4BAQvSFaUtfL7w7c/t0vpNuYm/PGRKCqUgv34Gpl5yB0RCNr4BY72X
	 d+L+PzclRXEVAk3WKbAkuEKX0WHh28AB61bYY9ro=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 0/5] Migration info for honister release
Date: Sun, 10 Oct 2021 20:57:52 -0700
Message-Id: <cover.1633924455.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 11 Oct 2021 03:58:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1980

Migration info for 3.4 on top of the overrides info that was written up
previously. Please double-check for accuracy.

Note that the lz4/zstd distro-specific package names have not been
checked on the respective distros, however I used pkgs.org as a
reference so they should be correct.



The following changes since commit 444ca8900e8057562d2a71a77e6e6798aca3ce85:

  dev-manual: warn about license compliance issues when static libraries are used (2021-10-08 22:01:20 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib paule/migration-3.4
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=paule/migration-3.4

Paul Eggleton (5):
  migration-3.4: tweak overrides change section
  ref-manual: remove meta class
  poky.yaml: add lz4 and zstd to essential host packages
  migration-3.4: add additional migration info
  migration: tweak introduction section

 documentation/migration-guides/migration-3.4.rst   | 208 +++++++++++++++++++--
 .../migration-guides/migration-general.rst         |  26 ++-
 documentation/poky.yaml                            |  11 +-
 documentation/ref-manual/classes.rst               |   9 -
 4 files changed, 222 insertions(+), 32 deletions(-)

-- 
1.8.3.1


