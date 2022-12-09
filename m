Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E084C4332F
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 18:18:38 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.78.1670609911298012061
 for <docs@lists.yoctoproject.org>;
 Fri, 09 Dec 2022 10:18:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Y7hItV26;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E1A1C40004;
	Fri,  9 Dec 2022 18:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670609909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PKTaYNqhxElOj+h1IgK5/v4MvxtZ8nmtJZgtvhN236c=;
	b=Y7hItV26wgZm6mTtox+CKXBUItLJBOo1iVU9Ixnj8aEuhCCKCOFG1G9il2fSHvULhP/+/e
	XMQdI2QZrkv7ZyrmVFTLr9WRiUr869YrzU8FwUFSRstIAdb6qpzz6/YAITq95zS4P85J4j
	0x2P1f7vHctiTqAuEvsdGjea1qyA7aJlh4+mt7gLdjxf5RawRXFxQoCLSprZgZ59ap4qTU
	xHKC9Lujl5AmzKFz345pqT9j7bYM+l4WDCVRbO9kVe1pZTyTjfh8jFvZ1R/UgFxbRqr9cF
	8c+J5j6ta8K3DulQMNrVPGvVkMCepDR24FBc97MNhmN+xZY5mkYXEu5CfZrfLw==
Message-ID: <f56f2a9d-21c4-cf08-4d49-9c9f5977cc09@bootlin.com>
Date: Fri, 9 Dec 2022 19:18:27 +0100
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
 <docs@lists.yoctoproject.org>; Fri, 09 Dec 2022 18:18:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3543

Hi Richard,


The following changes since commit 8d0d56cea5373c928feaaba316038c84130b52e7:

   dev-manual/runtime-testing.rst: fix oeqa runtime test path 
(2022-12-01 19:46:50 +0100)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to 9a51f1ce0de9152d0cdca4bf1f67546fd6599448:

   ref-manual/images.rst: fix unnumbered list (2022-12-09 17:00:19 +0100)

----------------------------------------------------------------
Michael Opdenacker (9):
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

  documentation/_templates/footer.html                   |   2 +-
  documentation/boilerplate.rst                          |   2 +
  documentation/dev-manual/building.rst                  |   6 +--
  documentation/dev-manual/debugging.rst                 |   6 +--
  documentation/dev-manual/error-reporting-tool.rst      |   3 +-
  documentation/dev-manual/external-toolchain.rst        |  28 ++++++++----
  documentation/dev-manual/licenses.rst                  |   3 +-
  documentation/dev-manual/new-recipe.rst                |  16 +++----
  documentation/dev-manual/packages.rst                  |   2 +-
  documentation/dev-manual/qemu.rst                      |  20 +++------
  documentation/dev-manual/quilt.rst                     |   3 +-
  documentation/dev-manual/runtime-testing.rst           |   3 +-
  documentation/dev-manual/upgrading-recipes.rst         |  14 +++---
  documentation/dev-manual/wic.rst                       |   6 +--
  documentation/genindex.rst                             |   2 +
  documentation/kernel-dev/advanced.rst                  |  15 +++----
  documentation/kernel-dev/common.rst                    |  43 
++++++++----------
  documentation/migration-guides/migration-1.4.rst       |   2 +
  documentation/migration-guides/migration-1.5.rst       |   2 +
  documentation/migration-guides/migration-1.6.rst       |   2 +
  documentation/migration-guides/migration-1.7.rst       |   2 +
  documentation/migration-guides/migration-1.8.rst       |   2 +
  documentation/migration-guides/migration-2.0.rst       |   2 +
  documentation/migration-guides/migration-2.1.rst       |   2 +
  documentation/migration-guides/migration-2.2.rst       |  14 +++---
  documentation/migration-guides/migration-2.3.rst       |   2 +
  documentation/migration-guides/migration-2.4.rst       |   2 +
  documentation/migration-guides/migration-2.5.rst       |   2 +
  documentation/migration-guides/migration-2.6.rst       |   2 +
  documentation/migration-guides/migration-2.7.rst       |   2 +
  documentation/migration-guides/migration-3.0.rst       |   4 +-
  documentation/migration-guides/migration-3.1.rst       |   2 +
  documentation/migration-guides/migration-3.2.rst       |   2 +
  documentation/migration-guides/migration-3.3.rst       |   2 +
  documentation/migration-guides/migration-3.4.rst       |   2 +
  documentation/migration-guides/migration-4.0.rst       |   2 +
  documentation/migration-guides/migration-4.1.rst       |   4 +-
  documentation/migration-guides/migration-general.rst   |   2 +
  documentation/migration-guides/release-3.4.rst         |   2 +
  documentation/migration-guides/release-4.0.rst         |   2 +
  documentation/migration-guides/release-4.1.rst         |   2 +
  documentation/migration-guides/release-notes-3.4.1.rst |  24 +++++-----
  documentation/migration-guides/release-notes-3.4.2.rst |  12 ++---
  documentation/migration-guides/release-notes-3.4.3.rst |   8 ++--
  documentation/migration-guides/release-notes-3.4.4.rst |  12 ++---
  documentation/migration-guides/release-notes-3.4.rst   |  74 
++++++++++++++++---------------
  documentation/migration-guides/release-notes-4.0.1.rst |  22 +++++-----
  documentation/migration-guides/release-notes-4.0.2.rst |  16 ++++---
  documentation/migration-guides/release-notes-4.0.3.rst |  36 
+++++++--------
  documentation/migration-guides/release-notes-4.0.4.rst |  24 +++++-----
  documentation/migration-guides/release-notes-4.0.5.rst |  14 +++---
  documentation/migration-guides/release-notes-4.0.rst   |  30 +++++++------
  documentation/migration-guides/release-notes-4.1.1.rst |  48 
++++++++++----------
  documentation/migration-guides/release-notes-4.1.rst   |  10 +++--
  documentation/overview-manual/concepts.rst             |   6 +--
  documentation/profile-manual/intro.rst                 |   4 +-
  documentation/profile-manual/usage.rst                 |   2 +-
  documentation/ref-manual/classes.rst                   |  18 ++++----
  documentation/ref-manual/devtool-reference.rst         |   7 +--
  documentation/ref-manual/faq.rst                       |  19 +-------
  documentation/ref-manual/images.rst                    |   6 +--
  documentation/ref-manual/qa-checks.rst                 |   2 +-
  documentation/ref-manual/resources.rst                 |  48 
++++++++++----------
  documentation/ref-manual/variables.rst                 | 284 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++------------------
  documentation/sdk-manual/appendix-customizing.rst      |   3 +-
  documentation/sdk-manual/appendix-obtain.rst           |   3 +-
  documentation/sdk-manual/extensible.rst                |  27 +++++-------
  documentation/sdk-manual/using.rst                     |  21 ++++-----
  documentation/sdk-manual/working-projects.rst          |  15 +++----
  documentation/test-manual/intro.rst                    |   8 ++--
  documentation/test-manual/reproducible-builds.rst      |   2 +-
  documentation/test-manual/understand-autobuilder.rst   |   2 +-
  72 files changed, 631 insertions(+), 414 deletions(-)

Thank you in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


