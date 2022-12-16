Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8748C4332F
	for <webhook@archiver.kernel.org>; Fri, 16 Dec 2022 18:05:40 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.1587.1671213931885179024
 for <docs@lists.yoctoproject.org>;
 Fri, 16 Dec 2022 10:05:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=EnUswXq8;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 96CC5E0004;
	Fri, 16 Dec 2022 18:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1671213930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cmqVrRjS82jlBzx2gNZkFKbYtNK9nJQG9t9M/jQVwPM=;
	b=EnUswXq81OOUcdoM5g69acAI8TAvjIt6U3btnPLRqvoW8xt3OgywXCyoBj6UL8mzh+ZMK7
	3QMZ4dMqvTp9zpfB5+u/YdqTvUdx6vMwM830mi1ZFD2TdKaBLTKa2OFYFUTYskiy//JbWl
	wZz5dMgnq/bjaC17ykrOtVzHyJB69MfPA9TF64jnafwHR66CyXzObcywTkx+yKb3UvZF3S
	zGpi00EvF4t4pwth/QobzOm3ciNM2G+zzbpftmI+63LGjx6sDQc3e+KadTjz5m2bkdbPxF
	fqbAEW6hG8tUO6ZG1NSUb+TnHeYgz8hL3K1adzP3IDw+7YDnlOjtRmFu6zM9nA==
Message-ID: <58a27c9a-428d-7e77-f3ac-6898ec839ed0@bootlin.com>
Date: Fri, 16 Dec 2022 19:05:29 +0100
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
 <docs@lists.yoctoproject.org>; Fri, 16 Dec 2022 18:05:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3560

Hi Richard,

The following changes since commit 8d0d56cea5373c928feaaba316038c84130b52e7:

   dev-manual/runtime-testing.rst: fix oeqa runtime test path 
(2022-12-01 19:46:50 +0100)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to 9276628507233aef554450c807d8456a0eb00225:

   manuals: prepare 4.2 migration notes (2022-12-16 11:44:34 +0100)

----------------------------------------------------------------
Michael Opdenacker (16):
       ref-manual: add references to variables only documented in the 
BitBake manual
       manuals: add reference to yocto-docs git repository to page footer
       manuals: add missing references to variables
       manuals: add missing SPDX license header to source files
       manuals: fix double colons
       ref-manual/resources.rst: fix formating
       ref-manual: update references to release notes
       manual: improve documentation about using external toolchains
       ref-manual/images.rst: fix unnumbered list
       manuals: define proper numbered lists
       manuals: final removal of SERIAL_CONSOLE variable
       ref-manual/resources.rst: improve description of mailing lists
       ref-manual/system-requirements.rst: update buildtools instructions
       manuals: create references to buildtools
       documentation/poky.yaml.in: update minimum python version to 3.8
       manuals: prepare 4.2 migration notes

  documentation/0001-manuals-prepare-4.2-migration-notes.patch | 134 
+++++++++++++++++++++++++++++++++++++++++
  documentation/_templates/footer.html                         | 2 +-
  documentation/boilerplate.rst                                | 2 +
  documentation/dev-manual/bmaptool.rst                        | 6 +-
  documentation/dev-manual/building.rst                        | 48 
+++++++--------
  documentation/dev-manual/changes.rst                         | 48 
+++++++--------
  documentation/dev-manual/debugging.rst                       | 28 
++++-----
  documentation/dev-manual/error-reporting-tool.rst            | 3 +-
  documentation/dev-manual/external-toolchain.rst              | 28 
++++++---
  documentation/dev-manual/gobject-introspection.rst           | 18 +++---
  documentation/dev-manual/layers.rst                          | 18 +++---
  documentation/dev-manual/licenses.rst                        | 3 +-
  documentation/dev-manual/new-recipe.rst                      | 16 ++---
  documentation/dev-manual/packages.rst                        | 6 +-
  documentation/dev-manual/qemu.rst                            | 32 
++++------
  documentation/dev-manual/quilt.rst                           | 19 +++---
  documentation/dev-manual/runtime-testing.rst                 | 31 
+++++-----
  documentation/dev-manual/start.rst                           | 94 
++++++++++++++---------------
  documentation/dev-manual/upgrading-recipes.rst               | 42 
+++++++------
  documentation/dev-manual/wayland.rst                         | 4 +-
  documentation/dev-manual/wic.rst                             | 14 ++---
  documentation/genindex.rst                                   | 2 +
  documentation/kernel-dev/advanced.rst                        | 15 ++---
  documentation/kernel-dev/common.rst                          | 153 
++++++++++++++++++++++-------------------------
  documentation/kernel-dev/intro.rst                           | 10 ++--
  documentation/kernel-dev/maint-appx.rst                      | 16 ++---
  documentation/migration-guides/index.rst                     | 1 +
  documentation/migration-guides/migration-1.4.rst             | 2 +
  documentation/migration-guides/migration-1.5.rst             | 5 +-
  documentation/migration-guides/migration-1.6.rst             | 2 +
  documentation/migration-guides/migration-1.7.rst             | 4 +-
  documentation/migration-guides/migration-1.8.rst             | 2 +
  documentation/migration-guides/migration-2.0.rst             | 2 +
  documentation/migration-guides/migration-2.1.rst             | 6 +-
  documentation/migration-guides/migration-2.2.rst             | 16 ++---
  documentation/migration-guides/migration-2.3.rst             | 2 +
  documentation/migration-guides/migration-2.4.rst             | 2 +
  documentation/migration-guides/migration-2.5.rst             | 2 +
  documentation/migration-guides/migration-2.6.rst             | 17 +++---
  documentation/migration-guides/migration-2.7.rst             | 2 +
  documentation/migration-guides/migration-3.0.rst             | 4 +-
  documentation/migration-guides/migration-3.1.rst             | 2 +
  documentation/migration-guides/migration-3.2.rst             | 4 +-
  documentation/migration-guides/migration-3.3.rst             | 4 +-
  documentation/migration-guides/migration-3.4.rst             | 4 +-
  documentation/migration-guides/migration-4.0.rst             | 4 +-
  documentation/migration-guides/migration-4.1.rst             | 8 ++-
  documentation/migration-guides/migration-4.2.rst             | 48 
+++++++++++++++
  documentation/migration-guides/migration-general.rst         | 16 ++---
  documentation/migration-guides/release-3.4.rst               | 2 +
  documentation/migration-guides/release-4.0.rst               | 2 +
  documentation/migration-guides/release-4.1.rst               | 2 +
  documentation/migration-guides/release-4.2.rst               | 9 +++
  documentation/migration-guides/release-notes-3.4.1.rst       | 24 ++++----
  documentation/migration-guides/release-notes-3.4.2.rst       | 12 ++--
  documentation/migration-guides/release-notes-3.4.3.rst       | 8 ++-
  documentation/migration-guides/release-notes-3.4.4.rst       | 12 ++--
  documentation/migration-guides/release-notes-3.4.rst         | 74 
++++++++++++-----------
  documentation/migration-guides/release-notes-4.0.1.rst       | 22 +++----
  documentation/migration-guides/release-notes-4.0.2.rst       | 16 ++---
  documentation/migration-guides/release-notes-4.0.3.rst       | 36 
+++++------
  documentation/migration-guides/release-notes-4.0.4.rst       | 24 ++++----
  documentation/migration-guides/release-notes-4.0.5.rst       | 14 +++--
  documentation/migration-guides/release-notes-4.0.rst         | 30 
+++++-----
  documentation/migration-guides/release-notes-4.1.1.rst       | 48 
++++++++-------
  documentation/migration-guides/release-notes-4.1.rst         | 12 ++--
  documentation/migration-guides/release-notes-4.2.rst         | 28 
+++++++++
  documentation/overview-manual/concepts.rst                   | 6 +-
  documentation/overview-manual/yp-intro.rst                   | 20 +++----
  documentation/poky.yaml.in                                   | 2 +-
  documentation/profile-manual/intro.rst                       | 4 +-
  documentation/profile-manual/usage.rst                       | 2 +-
  documentation/ref-manual/classes.rst                         | 22 +++----
  documentation/ref-manual/devtool-reference.rst               | 7 +--
  documentation/ref-manual/faq.rst                             | 19 +-----
  documentation/ref-manual/images.rst                          | 6 +-
  documentation/ref-manual/qa-checks.rst                       | 2 +-
  documentation/ref-manual/resources.rst                       | 54 
++++++++---------
  documentation/ref-manual/system-requirements.rst             | 81 
++++++++++++-------------
  documentation/ref-manual/terms.rst                           | 18 ++++++
  documentation/ref-manual/variables.rst                       | 309 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-------------------
  documentation/sdk-manual/appendix-customizing.rst            | 17 +++---
  documentation/sdk-manual/appendix-obtain.rst                 | 31 
+++++-----
  documentation/sdk-manual/extensible.rst                      | 85 
+++++++++++++-------------
  documentation/sdk-manual/intro.rst                           | 6 +-
  documentation/sdk-manual/using.rst                           | 21 +++----
  documentation/sdk-manual/working-projects.rst                | 37 
+++++-------
  documentation/test-manual/intro.rst                          | 8 +--
  documentation/test-manual/reproducible-builds.rst            | 2 +-
  documentation/test-manual/understand-autobuilder.rst         | 4 +-
  documentation/toaster-manual/reference.rst                   | 8 +--
  91 files changed, 1265 insertions(+), 832 deletions(-)
  create mode 100644 
documentation/0001-manuals-prepare-4.2-migration-notes.patch
  create mode 100644 documentation/migration-guides/migration-4.2.rst
  create mode 100644 documentation/migration-guides/release-4.2.rst
  create mode 100644 documentation/migration-guides/release-notes-4.2.rst

Thank you in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


