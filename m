Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3144C5478C
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 18:47:47 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.2885.1708714062628829072
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Feb 2024 10:47:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=eGlm+TH8;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 53875E0004;
	Fri, 23 Feb 2024 18:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708714061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ad8Mxe1Ht8qDSYh1iUn7PT3wGhU8PiEdVAfAyiaWapY=;
	b=eGlm+TH8oD099JwB9G5JNjafFgB+X1IkWBcCJdmSTgqVLSZhDn0+qMVyZ4dsYoqC85eIs/
	xQJ3YxYn0CT1RLym8Y9/F7U8Q1nF0tS2Dg6KpZENC+YSjvPeK6xPcl9f7gWMcjaL26Gejm
	atjBBYW09Wwt2AcAzDb+JihLwN6KtD0uW+CwpxI0CEI+Nx2dweEglo4AulqgHk2bGDN3/w
	5AEKAcPJh31l/HQORYopaCtK578siXI45qopIQoTULdvfU+kdLXgh6MgjpOiHj3IM4LQ/j
	6n6hRZzt9VHTia1IqoPuUVcunff/w7hc/+cyAqaW3gAIQTywAUQfbp9oJPGmZQ==
Message-ID: <b381569f-6a73-4efa-9eed-19119070c467@bootlin.com>
Date: Fri, 23 Feb 2024 19:47:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [master] Pull request
Organization: Bootlin
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 Feb 2024 18:47:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4867

Hi Richard,

The following changes since commit 79530aeb97976b9a63bf04ed247f98061fc9d737:

   release-notes-4.3: fix spacing (2024-02-05 15:22:33 +0100)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to b63e6a5ac71b347961037b7ee496c2e958ad22c5:

   dev-manual: packages: need enough free space (2024-02-23 09:50:37 +0100)

----------------------------------------------------------------
Adrian Freihofer (1):
       sdk-manual: extensible.rst: cover devtool ide-sdk

Khem Raj (1):
       ref-manual: variables: remove PYTHON_PN

Lee Chee Yang (1):
       migration-guide: add release notes for 4.3.3

Michael Opdenacker (5):
       ref-manual: system-requirements: update packages to build docs
       ref-manual: release-process: grammar fix
       manuals: suppress excess use of "following" word
       dev-manual: packages: clarify shared PR service constraint
       dev-manual: packages: need enough free space

Simone Weiß (1):
       dev-manual: Rephrase spdx creation

Vyacheslav Yurkov (1):
       manuals: kernel-dev: Fix BSP in recipe space

  documentation/bsp-guide/bsp.rst                        |   9 ++--
  documentation/dev-manual/building.rst                  |   2 +-
  documentation/dev-manual/debugging.rst                 |   8 ++--
  documentation/dev-manual/development-shell.rst         |   2 +-
  documentation/dev-manual/layers.rst                    |   8 ++--
  documentation/dev-manual/libraries.rst                 |   4 +-
  documentation/dev-manual/licenses.rst                  |   2 +-
  documentation/dev-manual/new-machine.rst               |   2 +-
  documentation/dev-manual/new-recipe.rst                |   8 ++--
  documentation/dev-manual/packages.rst                  |  22 +++++++---
  documentation/dev-manual/prebuilt-libraries.rst        |   4 +-
  documentation/dev-manual/python-development-shell.rst  |   2 +-
  documentation/dev-manual/qemu.rst                      |   4 +-
  documentation/dev-manual/runtime-testing.rst           |   4 +-
  documentation/dev-manual/sbom.rst                      |  40 
++++++++++-------
  documentation/dev-manual/speeding-up-build.rst         |   4 +-
  documentation/dev-manual/start.rst                     |   6 +--
  documentation/kernel-dev/advanced.rst                  |   2 +-
  documentation/kernel-dev/common.rst                    |   4 +-
  documentation/migration-guides/migration-1.5.rst       |   6 +--
  documentation/migration-guides/migration-2.2.rst       |   6 +--
  documentation/migration-guides/migration-2.4.rst       |   8 ----
  documentation/migration-guides/migration-2.5.rst       |   8 +---
  documentation/migration-guides/migration-4.0.rst       |   2 +-
  documentation/migration-guides/release-4.3.rst         |   1 +
  documentation/migration-guides/release-notes-4.3.3.rst | 200 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  documentation/overview-manual/concepts.rst             |  18 ++++----
  documentation/overview-manual/yp-intro.rst             |   2 +-
  documentation/ref-manual/classes.rst                   |   8 ++--
  documentation/ref-manual/devtool-reference.rst         |   4 +-
  documentation/ref-manual/faq.rst                       |   6 +--
  documentation/ref-manual/features.rst                  |   2 +-
  documentation/ref-manual/images.rst                    |   2 +-
  documentation/ref-manual/release-process.rst           |   8 ++--
  documentation/ref-manual/structure.rst                 |   2 +-
  documentation/ref-manual/system-requirements.rst       |  10 ++---
  documentation/ref-manual/terms.rst                     |   4 +-
  documentation/ref-manual/variables.rst                 |  22 ++--------
  documentation/sdk-manual/appendix-obtain.rst           |  10 ++---
  documentation/sdk-manual/extensible.rst                | 283 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
  documentation/sdk-manual/intro.rst                     |   2 +-
  documentation/toaster-manual/setup-and-use.rst         |   4 +-
  42 files changed, 614 insertions(+), 141 deletions(-)
  create mode 100644 documentation/migration-guides/release-notes-4.3.3.rst

Thank you in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


