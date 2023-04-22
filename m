Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E3BEC77B61
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 03:20:06 +0000 (UTC)
Received: from mail2.g23.pair.com (mail2.g23.pair.com [66.39.132.40])
 by mx.groups.io with SMTP id smtpd.web11.1288.1682133602132436235
 for <docs@lists.yoctoproject.org>;
 Fri, 21 Apr 2023 20:20:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 66.39.132.40, mailfrom: bluelightning@bluelightning.org)
Received: from mail2.g23.pair.com (localhost [127.0.0.1])
	by mail2.g23.pair.com (Postfix) with ESMTP id 34A38E664A;
	Fri, 21 Apr 2023 23:20:01 -0400 (EDT)
Received: from linc.fritz.box (unknown [161.29.131.251])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mail2.g23.pair.com (Postfix) with ESMTPSA id 62AA1E707B;
	Fri, 21 Apr 2023 23:20:00 -0400 (EDT)
From: Paul Eggleton <bluelightning@bluelightning.org>
To: docs@lists.yoctoproject.org
Cc: michael.opdenacker@bootlin.com
Subject: [PATCH 00/17] Documentation updates for 4.2
Date: Sat, 22 Apr 2023 15:19:36 +1200
Message-Id: <cover.1682133339.git.bluelightning@bluelightning.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Scanned-By: mailmunge 3.11 on 66.39.132.40
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 22 Apr 2023 03:20:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3851

Release notes, migration guide and additional manual updates for the
imminent 4.2 release.

As usual I found a bunch of things that were undocumented that I either
needed to link to or that I felt should be completed, those are included
in this series. There is also a dependency on the BitBake User Manual
changes I just sent.

Please let me know if I missed or messed up anything :) Thanks.


The following changes since commit 3aac9f8b57434f3852a78915c3260742521775=
15:

  migration-guides: update 4.2 migration and release notes (2023-04-12 14=
:41:19 +0200)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib paule/4.2-release
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dpaule/4.2-re=
lease

Paul Eggleton (17):
  ref-manual: add new SDK_ZIP_OPTIONS variable
  ref-manual: Add new RUST_CHANNEL variable
  ref-manual: update for IMAGE_MACHINE_SUFFIX addition
  Remove references to INC_PR
  ref-manual: add BB_CACHEDIR
  Add coverage of addpylib directive
  Remove references to package_tar class
  ref-manual: add missing QA checks from previous releases
  ref-manual: document new patch-status-* QA checks
  ref-manual: add FIT_CONF_DEFAULT_DTB
  ref-manual: add section link also to buildtools-extended entry
  ref-manual: add SDK_ARCHIVE_TYPE
  ref-manual: move Initramfs entry from variables to terms
  Document INIT_MANAGER
  migration-guides: extend migration guide for 4.2
  release-notes-4.1: fix some CVE links
  release-notes-4.2: add release notes

 documentation/dev-manual/init-manager.rst     |  24 +-
 documentation/dev-manual/packages.rst         |  12 -
 .../migration-guides/migration-4.2.rst        | 200 +++-
 .../migration-guides/release-notes-4.1.rst    |  12 +-
 .../migration-guides/release-notes-4.2.rst    | 853 +++++++++++++++++-
 documentation/overview-manual/concepts.rst    |   8 +-
 documentation/ref-manual/classes.rst          |  92 +-
 documentation/ref-manual/qa-checks.rst        |  23 +
 documentation/ref-manual/structure.rst        |   4 +-
 documentation/ref-manual/tasks.rst            |  11 -
 documentation/ref-manual/terms.rst            |  46 +
 documentation/ref-manual/variables.rst        | 231 ++---
 12 files changed, 1240 insertions(+), 276 deletions(-)

--=20
2.34.1


