Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A11CC0032E
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 13:26:18 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.54131.1697808370647264358
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Oct 2023 06:26:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=M6SJ6Xxm;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 713C6C000C;
	Fri, 20 Oct 2023 13:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697808368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/+nB60ySn0jpg/ib8ap1eQudi3jLoZV5aiCTkbwVChY=;
	b=M6SJ6Xxm4o7b1cHGOziqzwlh/PPlJh0ySwaPdmusRK/UWlYOYhpRgG6RCPr90lliMNQHuw
	3qnuHUpeDdhw/qviWoPik5WvfGB8YS6Z8hvaeQ6Z+jp47Lk2b941jaglxKfuwn3lqSamIq
	X08lctHUCUNlKuSAUs0j0yjl3CUS9kjR4ISuY4wdfuLWm13AnXut1O1cgZmfWPpknHISqp
	Z7/8WdOI4TVb+wlV1/uTTN8fRnTN3VL7fbLp5CRwdXh+EFM9cVo0u+orYlotnUQmXa20VR
	ThQEOkQgfo+sq5M1sgIguqi4YQuTYCCLIp+fz+RYypLLMpxKlpnUZ5S5TgGpGw==
Message-ID: <82bbde1a-45cc-48d8-8ef8-1415ca007c94@bootlin.com>
Date: Fri, 20 Oct 2023 15:26:06 +0200
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
 <docs@lists.yoctoproject.org>; Fri, 20 Oct 2023 13:26:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4443

Hi Richard,

The following changes since commit ceb1812e63b9fac062f886c2a1dde23137c0e1ed:

   migration-guides: add release notes for 4.0.13 (2023-10-06 09:59:00 
+0200)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to 65b62118da6f355e56c489c6be08ba9ea94b9f04:

   ref-manual: variables: add example for SYSROOT_DIRS variable 
(2023-10-20 15:19:18 +0200)

----------------------------------------------------------------
Arne Schwerdt (1):
       ref-manual: Warn about COMPATIBLE_MACHINE skipping native recipes

BELHADJ SALEM Talel (5):
       ref-manual: Fix PACKAGECONFIG term and add an example
       dev-manual: layers: Add notes about layer.conf
       ref-manual: variables: add RECIPE_SYSROOT and RECIPE_SYSROOT_NATIVE
       ref-manual: variables: add TOOLCHAIN_OPTIONS variable
       ref-manual: variables: add example for SYSROOT_DIRS variable

Jérémy Rosen (1):
       ref-manual: Add documentation for the unimplemented-ptest QA warning

Michael Opdenacker (7):
       manuals: update linux-yocto append examples
       dev-manual: wic: update "wic list images" output
       sdk-manual: appendix-obtain: improve and update descriptions
       manuals: update list of supported machines
       bsp-guide: bsp: skip Intel machines no longer supported in Poky
       brief-yoctoprojectqs: use new CDN mirror for sstate
       dev-manual: start.rst: remove obsolete reference

Quentin Schulz (1):
       ref-manual: variables: provide no-match example for 
COMPATIBLE_MACHINE

Robert P. J. Day (2):
       dev-manual: new-recipe.rst: add missing parenthesis to "Patching 
Code" section
       profile-manual: aesthetic cleanups

Trevor Gamblin (2):
       contributor-guide: add patchtest section
       contributor-guide: clarify patchtest usage

  documentation/brief-yoctoprojectqs/index.rst       |   2 +-
  documentation/bsp-guide/bsp.rst                    |  52 
++++++++++++++++-----------------------------------
  documentation/contributor-guide/submit-changes.rst |  40 
+++++++++++++++++++++++++++++++++++++++
  documentation/dev-manual/layers.rst                |  14 ++++++++++++++
  documentation/dev-manual/new-recipe.rst            |   4 ++--
  documentation/dev-manual/runtime-testing.rst       |   8 +-------
  documentation/dev-manual/start.rst                 |  24 
++++++------------------
  documentation/dev-manual/wic.rst                   |  28 
+++++++++++++++-------------
  documentation/kernel-dev/advanced.rst              |   3 +--
  documentation/kernel-dev/common.rst                |  40 
++++++++++++++++++---------------------
  documentation/profile-manual/intro.rst             |  40 
++++++++++++++++++++-------------------
  documentation/ref-manual/classes.rst               |   3 +++
  documentation/ref-manual/qa-checks.rst             |  11 +++++++++++
  documentation/ref-manual/variables.rst             | 156 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--------------
  documentation/sdk-manual/appendix-obtain.rst       |  50 
++++++++++++++++++-------------------------------
  15 files changed, 309 insertions(+), 166 deletions(-)

Thank you in advance
Cheers
Michael

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


