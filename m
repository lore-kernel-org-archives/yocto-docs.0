Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84BFAC4332F
	for <webhook@archiver.kernel.org>; Fri, 25 Nov 2022 17:13:49 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web10.52013.1669396426395339419
 for <docs@lists.yoctoproject.org>;
 Fri, 25 Nov 2022 09:13:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=anApLge6;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3FBAC100009;
	Fri, 25 Nov 2022 17:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669396424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0d4OmdpTT/Zuga8jLP5R+tavs60YCtiZVeQ2cgh7HWY=;
	b=anApLge6Kf+ntzQeW3JRv+GgfRrR84Maf+BTUbVp+cMxluSSUk0gO+3ELScdliGMV7TKi4
	O6ybkexAYVTZtmf3lhLS+TvaBPhTNMS/MdhJkoj30DcIuUlBfzs4LZdp8qhZJ4uuUBkYQd
	LNPRjc7pRRNBJd11FaN2+JpndVlBTsGbZhnbpxUcmu887mwFT6r77RF6L2ra29KTwZQZKq
	1nwbZSBy3xUaHQpjlxjEVv65qkNJVtIkpx86mM2ciQVFRVklTl2jNtup3vwDngbrfnYiY2
	DsUBc7w2tLZ5aO+fcMASQy+3aGJzD8ATtKbpGl2JwzjHZrBtwjjkVb2XMbJ0uQ==
Message-ID: <d54041c3-e0ab-5154-40ef-ad7995f15d04@bootlin.com>
Date: Fri, 25 Nov 2022 18:13:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [master] Pull request
Organization: Bootlin
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 25 Nov 2022 17:13:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3509

Hi Richard,

The following changes since commit ac844062400a7bf4732ea6ee639a478b1b77b83e:

   release-notes: use oe_git and yocto_git macros (2022-11-10 19:29:25 
+0100)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to 56bf7a3e521e7368e620685354aa89f540bb7564:

   dev-manual/sbom.rst: minor corrections (2022-11-25 18:09:24 +0100)

----------------------------------------------------------------
Atanas Bunchev (1):
       qemu.rst: slirp port forwarding details

Chee Yang Lee (1):
       migration-guides: add release-notes for 4.1.1

Michael Opdenacker (6):
       manuals: add missing references to classes
       manuals: fix paragraphs with the "inherit" word
       ref-manual/classes.rst: remove reference to sip.bbclass
       manuals: simplify .gitignore files
       manuals: split dev-manual/common-tasks.rst
       dev-manual/sbom.rst: minor corrections

  .gitignore |    41 -
  documentation/.gitignore |     1 +
  documentation/brief-yoctoprojectqs/index.rst |     4 +-
  documentation/bsp-guide/bsp.rst |    22 +-
  documentation/dev-manual/bmaptool.rst |    59 +
  documentation/dev-manual/build-quality.rst |   411 +++++
  documentation/dev-manual/building.rst |   940 ++++++++++
  documentation/dev-manual/changes.rst |   525 ++++++
  documentation/dev-manual/common-tasks.rst                            | 
11875 
----------------------------------------------------------------------------------------------------------------------------
  documentation/dev-manual/custom-distribution.rst |   108 ++
  documentation/dev-manual/custom-template-configuration-directory.rst 
|    52 +
  documentation/dev-manual/customizing-images.rst |   223 +++
  documentation/dev-manual/debugging.rst                               | 
1253 +++++++++++++
  documentation/dev-manual/development-shell.rst |    82 +
  documentation/dev-manual/device-manager.rst |    72 +
  documentation/dev-manual/disk-space.rst |    40 +
  documentation/dev-manual/efficiently-fetching-sources.rst |    68 +
  documentation/dev-manual/error-reporting-tool.rst |    85 +
  documentation/dev-manual/external-scm.rst |    67 +
  documentation/dev-manual/external-toolchain.rst |    28 +
  documentation/dev-manual/gobject-introspection.rst |   157 ++
  documentation/dev-manual/index.rst |    38 +-
  documentation/dev-manual/init-manager.rst |    89 +
  documentation/dev-manual/layers.rst |   905 ++++++++++
  documentation/dev-manual/libraries.rst |   267 +++
  documentation/dev-manual/licenses.rst |   520 ++++++
  documentation/dev-manual/new-machine.rst |   118 ++
  documentation/dev-manual/new-recipe.rst                              | 
1674 ++++++++++++++++++
  documentation/dev-manual/packages.rst                                | 
1252 +++++++++++++
  documentation/dev-manual/prebuilt-libraries.rst |   209 +++
  documentation/dev-manual/python-development-shell.rst |    50 +
  documentation/dev-manual/qemu.rst |    25 +-
  documentation/dev-manual/quilt.rst |    90 +
  documentation/dev-manual/read-only-rootfs.rst |    89 +
  documentation/dev-manual/runtime-testing.rst |   599 +++++++
  documentation/dev-manual/sbom.rst |    69 +
  documentation/dev-manual/securing-images.rst |   158 ++
  documentation/dev-manual/speeding-up-build.rst |   110 ++
  documentation/dev-manual/start.rst |     6 +-
  documentation/dev-manual/temporary-source-code.rst |    66 +
  documentation/dev-manual/upgrading-recipes.rst |   400 +++++
  documentation/dev-manual/vulnerabilities.rst |   214 +++
  documentation/dev-manual/wayland.rst |    90 +
  documentation/dev-manual/wic.rst |   732 ++++++++
  documentation/dev-manual/x32-psabi.rst |    54 +
  documentation/kernel-dev/common.rst |    16 +-
  documentation/kernel-dev/faq.rst |     2 +-
  documentation/kernel-dev/intro.rst |     2 +-
  documentation/migration-guides/migration-1.3.rst |    21 +-
  documentation/migration-guides/migration-1.4.rst |     2 +-
  documentation/migration-guides/migration-1.5.rst |    13 +-
  documentation/migration-guides/migration-1.6.rst |    13 +-
  documentation/migration-guides/migration-1.7.rst |     2 +-
  documentation/migration-guides/migration-1.8.rst |     6 +-
  documentation/migration-guides/migration-2.1.rst |    10 +-
  documentation/migration-guides/migration-2.3.rst |    23 +-
  documentation/migration-guides/migration-2.5.rst |     2 +-
  documentation/migration-guides/migration-2.6.rst |    14 +-
  documentation/migration-guides/migration-3.0.rst |     8 +-
  documentation/migration-guides/migration-3.2.rst |     8 +-
  documentation/migration-guides/migration-3.3.rst |    22 +-
  documentation/migration-guides/migration-3.4.rst |     2 +-
  documentation/migration-guides/migration-general.rst |    23 +-
  documentation/migration-guides/release-4.1.rst |     1 +
  documentation/migration-guides/release-notes-3.4.rst |     6 +-
  documentation/migration-guides/release-notes-4.0.rst |    15 +-
  documentation/migration-guides/release-notes-4.1.1.rst |   317 ++++
  documentation/migration-guides/release-notes-4.1.rst |     9 +-
  documentation/overview-manual/concepts.rst |    22 +-
  documentation/overview-manual/development-environment.rst |    12 +-
  documentation/overview-manual/yp-intro.rst |    10 +-
  documentation/ref-manual/classes.rst |    73 +-
  documentation/ref-manual/devtool-reference.rst |     4 +-
  documentation/ref-manual/faq.rst |     6 +-
  documentation/ref-manual/features.rst |     8 +-
  documentation/ref-manual/images.rst |     4 +-
  documentation/ref-manual/kickstart.rst |     2 +-
  documentation/ref-manual/qa-checks.rst |    20 +-
  documentation/ref-manual/release-process.rst |     4 +-
  documentation/ref-manual/resources.rst |     4 +-
  documentation/ref-manual/structure.rst |    15 +-
  documentation/ref-manual/system-requirements.rst |     2 +-
  documentation/ref-manual/tasks.rst |    10 +-
  documentation/ref-manual/terms.rst |     8 +-
  documentation/ref-manual/variables.rst |   260 +--
  documentation/sdk-manual/appendix-customizing.rst |    15 +-
  documentation/sdk-manual/extensible.rst |     4 +-
  documentation/test-manual/intro.rst |     2 +-
  documentation/test-manual/understand-autobuilder.rst |     2 +-
  documentation/test-manual/yocto-project-compatible.rst |     2 +-
  documentation/toaster-manual/reference.rst |     2 +-
  documentation/transitioning-to-a-custom-environment.rst |     8 +-
  documentation/what-i-wish-id-known.rst |     2 +-
  93 files changed, 12688 insertions(+), 12287 deletions(-)
  delete mode 100644 .gitignore
  create mode 100644 documentation/dev-manual/bmaptool.rst
  create mode 100644 documentation/dev-manual/build-quality.rst
  create mode 100644 documentation/dev-manual/building.rst
  create mode 100644 documentation/dev-manual/changes.rst
  delete mode 100644 documentation/dev-manual/common-tasks.rst
  create mode 100644 documentation/dev-manual/custom-distribution.rst
  create mode 100644 
documentation/dev-manual/custom-template-configuration-directory.rst
  create mode 100644 documentation/dev-manual/customizing-images.rst
  create mode 100644 documentation/dev-manual/debugging.rst
  create mode 100644 documentation/dev-manual/development-shell.rst
  create mode 100644 documentation/dev-manual/device-manager.rst
  create mode 100644 documentation/dev-manual/disk-space.rst
  create mode 100644 
documentation/dev-manual/efficiently-fetching-sources.rst
  create mode 100644 documentation/dev-manual/error-reporting-tool.rst
  create mode 100644 documentation/dev-manual/external-scm.rst
  create mode 100644 documentation/dev-manual/external-toolchain.rst
  create mode 100644 documentation/dev-manual/gobject-introspection.rst
  create mode 100644 documentation/dev-manual/init-manager.rst
  create mode 100644 documentation/dev-manual/layers.rst
  create mode 100644 documentation/dev-manual/libraries.rst
  create mode 100644 documentation/dev-manual/licenses.rst
  create mode 100644 documentation/dev-manual/new-machine.rst
  create mode 100644 documentation/dev-manual/new-recipe.rst
  create mode 100644 documentation/dev-manual/packages.rst
  create mode 100644 documentation/dev-manual/prebuilt-libraries.rst
  create mode 100644 documentation/dev-manual/python-development-shell.rst
  create mode 100644 documentation/dev-manual/quilt.rst
  create mode 100644 documentation/dev-manual/read-only-rootfs.rst
  create mode 100644 documentation/dev-manual/runtime-testing.rst
  create mode 100644 documentation/dev-manual/sbom.rst
  create mode 100644 documentation/dev-manual/securing-images.rst
  create mode 100644 documentation/dev-manual/speeding-up-build.rst
  create mode 100644 documentation/dev-manual/temporary-source-code.rst
  create mode 100644 documentation/dev-manual/upgrading-recipes.rst
  create mode 100644 documentation/dev-manual/vulnerabilities.rst
  create mode 100644 documentation/dev-manual/wayland.rst
  create mode 100644 documentation/dev-manual/wic.rst
  create mode 100644 documentation/dev-manual/x32-psabi.rst
  create mode 100644 documentation/migration-guides/release-notes-4.1.1.rst

Thank you in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


