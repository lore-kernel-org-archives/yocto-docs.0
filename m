Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A722C3A5A1
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 09:24:44 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.4250.1665393876282291339
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 02:24:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=T72zQqtV;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id BF80D2034CAB; Mon, 10 Oct 2022 02:24:35 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com BF80D2034CAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1665393875;
	bh=ghOZfIWG07AkAkfZUbnfMNB/k9Oqn+C7BRpcSdrqhQk=;
	h=From:To:Subject:Date:From;
	b=T72zQqtVmjW+KZjUYTP9y5E2OCdJlWMwq+0McZqhwvLhl9cEw0Y3yG4OQkAeIZicr
	 CzB8Hngix+B5NXHHX6pCB9lAWw+BeChce7kIpaJ4zKLo2Z0xjzxKAHfTSIkQdETPIZ
	 shqsTxNj5pR2I/h3Ne0aX00513K1raNPsiQhw1pA=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 00/34] 4.1 release notes and related changes
Date: Mon, 10 Oct 2022 02:23:46 -0700
Message-Id: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Oct 2022 09:24:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3303

Here are the release notes and migration guide for 4.1 (langdale) as well
as a whole heap of additions of missing documentation. I may have got a
little carried away, but almost all of it was necessary to be able to
have links from the release notes / migration guide for more information.

Some things that we still need to sort out before release:
 * Known issues (if any)
 * Download info
 * externalsrc class has been moved to classes-recipe/ but documentation
   and comments in the class suggest using it globally (presumably to make
   it easier to support a subset of recipes without having to bbappend all
   of them.) We need to do one of the following:
   A) move the class back to classes/ (easiest),
   B) update the documentation and comments to remove the global usage,
      and note in the migration guide, or
   C) add it as a known issue and fix with A/B later.
 * New direct ESDK feature refers to "bitbake populate-sysroots" instead
   of "bitbake build-sysroots" - Alex will be sending a patch soon.

A few gaps that are still present (probably post-release at this point):
 * Rust support (classes, variables)
 * New layer setup functionality

Let me know if I missed anything / messed anything up.


The following changes since commit 42d3e26a0d04bc5951e640b471686f347dc9b74a:

  ref-manual/faq.rst: update references to products built with OE / Yocto Project (2022-10-06 10:22:27 +0200)

are available in the git repository at:

  https://git.yoctoproject.org/poky-contrib paule/4.1-release
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=paule/4.1-release

Paul Eggleton (34):
  migration-general: add section on using buildhistory
  ref-manual: add DISABLE_STATIC
  ref-manual: expand documentation on image-buildinfo class
  ref-manual: add WATCHDOG_TIMEOUT to variable glossary
  ref-manual: correct default for BUILDHISTORY_COMMIT
  ref-manual: document new github-releases class
  ref-manual: add a note to ssh-server-dropbear feature
  ref-manual: sync supported distro list with code
  ref-manual: update buildpaths QA check documentation
  ref-manual: add UBOOT_MKIMAGE_SIGN
  ref-manual: add DEV_PKG_DEPENDENCY
  ref-manual: add SDK_TOOLCHAIN_LANGS
  ref-manual: add pressure limit variable documentation
  ref-manual: add pypi class
  ref-manual: update pypi documentation for CVE_PRODUCT default in 4.1
  ref-manual: add CVE_CHECK_SHOW_WARNINGS
  ref-manual: add info on buildtools-make-tarball
  ref-manual: add FIT_PAD_ALG
  ref-manual: add CVE_DB_UPDATE_INTERVAL
  ref-manual: add KERNEL_DEPLOY_DEPEND
  ref-manual: add MOUNT_BASE variable
  ref-manual: remove reference to testimage-auto class
  Update documentation for classes split
  ref-manual: complementary package installation recommends
  ref-manual: remove reference to largefile in DISTRO_FEATURES
  ref-manual: add missing features
  ref-manual: add serial-autologin-root to IMAGE_FEATURES documentation
  ref-manual: add previous overlayfs-etc variables
  ref-manual: add OVERLAYFS_ETC_EXPOSE_LOWER
  ref-manual: add WIRELESS_DAEMON
  ref-manual: add section for create-spdx class
  ref-manual: add overlayfs class variables
  ref-manual: add OVERLAYFS_QA_SKIP
  Add 4.1 migration guide & release notes

 documentation/dev-manual/common-tasks.rst          |   8 +-
 documentation/migration-guides/index.rst           |   1 +
 documentation/migration-guides/migration-1.5.rst   |   2 +-
 documentation/migration-guides/migration-2.6.rst   |   2 +-
 documentation/migration-guides/migration-4.1.rst   | 214 +++++++
 .../migration-guides/migration-general.rst         |  33 +
 documentation/migration-guides/release-4.1.rst     |   7 +
 .../migration-guides/release-notes-4.1.rst         | 687 +++++++++++++++++++++
 documentation/overview-manual/concepts.rst         |   6 +-
 documentation/ref-manual/classes.rst               |  96 ++-
 documentation/ref-manual/faq.rst                   |   2 +-
 documentation/ref-manual/features.rst              |  74 ++-
 documentation/ref-manual/qa-checks.rst             |  16 +
 documentation/ref-manual/release-process.rst       |   2 +-
 documentation/ref-manual/structure.rst             |   6 +-
 documentation/ref-manual/system-requirements.rst   |  28 +-
 documentation/ref-manual/tasks.rst                 |   4 +-
 documentation/ref-manual/variables.rst             | 303 +++++++--
 documentation/test-manual/intro.rst                |   4 +-
 19 files changed, 1414 insertions(+), 81 deletions(-)
 create mode 100644 documentation/migration-guides/migration-4.1.rst
 create mode 100644 documentation/migration-guides/release-4.1.rst
 create mode 100644 documentation/migration-guides/release-notes-4.1.rst

-- 
1.8.3.1


