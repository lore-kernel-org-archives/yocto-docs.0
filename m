Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CB88C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 20:48:53 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.66813.1699303723385429185
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Nov 2023 12:48:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Kz4OBrh3;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 23DB5C0004;
	Mon,  6 Nov 2023 20:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699303721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BBGmmXgekBcIH8iI1LU8171F6ZTXrKyGK01OB4sARCc=;
	b=Kz4OBrh3hGEvTHO5qZtfWjyazsBPwYFpfim5WlD5l38sLeO9194Ug4mpQZk1SM4D0r4Fcb
	sbv37w61wMoVxvoJ6TnuCdDyadHpgqlZzI6maWLB0bdluZOR5gN3IyQ0nGkv1XjXdqZSfe
	gHVKpcCzGmN0EyB9LSu69FteZSKFenBzSdxmZbnhiYxLMmYndzkFE68tAjD1MhqoCp0iQw
	P3sQdxVG9BOYfVoRHDuOL+kmr8STkhS2coMaMLBW1wrf2ulXvvbOAs+VqxIuByYw4NNvGW
	v/Wf5yaVY/EhiYCdpfoeRR/2HBFLaD7oLVF8Zp8zRGRda14Tmk2z2K5KRx0BMA==
Message-ID: <8bed973c-a99c-497d-9161-7c00b777cc58@bootlin.com>
Date: Mon, 6 Nov 2023 21:48:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [master nanbield] Pull request
Organization: Bootlin
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 06 Nov 2023 20:48:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4609

Hi Richard,

The following changes since commit 8109eeb5b7a4e5b2f50047e049ce0295bdc94856:

   ref-manual: document MESON_TARGET (2023-10-30 10:56:25 +0100)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to 897d5017eae6b3af2d5d489fc4e0915d9ce21458:

   migration-guides: fix empty sections (2023-11-06 21:41:05 +0100)

----------------------------------------------------------------
BELHADJ SALEM Talel (1):
       overview-manual: concepts: Add Bitbake Tasks Map

Marta Rybczynska (1):
       dev-manual: extend the description of CVE patch preparation

Michael Opdenacker (8):
       ref-manual: document cargo_c class
       ref-manual: variables: mention new CDN for SSTATE_MIRRORS
       ref-manual: variables: add RECIPE_MAINTAINER
       ref-manual: variables: remove SERIAL_CONSOLES_CHECK
       migration-guides: further updates for release 4.3
       bsp-guide: bsp.rst: update beaglebone example
       ref-manual: classes: explain cml1 class name
       migration-guides: fix empty sections

Paul Eggleton (12):
       Remove references to apm in MACHINE_FEATURES
       ref-manual: update SDK_NAME variable documentation
       ref-manual: remove semicolons from *PROCESS_COMMAND variables
       release-notes-4.3: fix some typos
       release-notes-4.3: tweaks to existing text
       release-notes-4.3: add CVEs, recipe upgrades, license changes, 
contributors
       release-notes-4.3: remove the Distribution section
       release-notes-4.3: move new classes to Rust section
       release-notes-4.3: feature additions
       migration-4.3: remove some unnecessary items
       migration-4.3: adjustments to existing text
       migration-4.3: additional migration items

Ross Burton (14):
       migration-guides: add debian 12 to newly supported distros
       migration-guides: edgerouter machine removed
       migration-guides: QEMU_USE_SLIRP variable removed
       migration-guides: remove non-notable change
       migration-guides: mention LLVM 17
       migration-guides: mention CDN
       migration-guides: add kernel notes
       migration-guides: remove SERIAL_CONSOLES_CHECK
       migration-guides: enabling SPDX only for Poky, not a global default
       migration-guides: add testing notes
       migration-guides: add utility notes
       migration-guides: add BitBake changes
       migration-guides: packaging changes
       migration-guides: git recipes reword

  documentation/bsp-guide/bsp.rst                         |  63 +++++----
  documentation/dev-manual/new-machine.rst                |   2 +-
  documentation/dev-manual/vulnerabilities.rst            | 111 
+++++++++++++---
  documentation/migration-guides/migration-4.3.rst        | 124 
++++++++++++++----
  documentation/migration-guides/release-notes-4.3.rst    | 835 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----
  documentation/overview-manual/concepts.rst              | 170 
+++++++++++++++++++++++++
  documentation/overview-manual/svg/bitbake_tasks_map.svg |   4 +
  documentation/ref-manual/classes.rst                    |  17 ++-
  documentation/ref-manual/features.rst                   |   2 -
  documentation/ref-manual/variables.rst                  |  94 
++++++++------
  10 files changed, 1272 insertions(+), 150 deletions(-)
  create mode 100644 documentation/overview-manual/svg/bitbake_tasks_map.svg

Thank you in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


