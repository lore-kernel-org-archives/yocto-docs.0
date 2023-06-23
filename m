Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75823EB64D7
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 17:36:48 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.4593.1687541800757254692
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Jun 2023 10:36:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ac4jvNWD;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
X-GND-Sasl: michael.opdenacker@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687541798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NhhzbGlIXDxrdnRK2px+34hzehCacLWRIIQwXIEak/8=;
	b=ac4jvNWDVeS/Wvf9Gk3+S7Jm/yBasN4QE5oRAfrIZ0vgFP22uIruvF5Qn9XkvsSK9OE9Be
	SArdcCtJ9IErokML4Ix/L9qtRJyOjjA/rmCnUThiAG0UkE60dPVxymz+hQSaNFqyP/fS0C
	Z7zGRxuMjKnFH8q/QoG9qxBWX2K7lCeu7OPDMD9WmUgi7vmUeBrkZSp4v8F9MizJG0bh4s
	g63oFxxi6nkfDfusKLOi5aDT0Noh454+T25GLera+0JqOV05D7BYGxUn24+9saI5mJ4Lh4
	EEjnk9fErlL8LeAp8POHyiBOLkh7glzoR/QFjPBpdBhBU45HF7nYlMd0KQTuqA==
X-GND-Sasl: michael.opdenacker@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 308981C0009;
	Fri, 23 Jun 2023 17:36:38 +0000 (UTC)
Message-ID: <493f82ff-50de-f3f6-4b46-53e8a59a7eac@bootlin.com>
Date: Fri, 23 Jun 2023 19:36:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
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
 <docs@lists.yoctoproject.org>; Fri, 23 Jun 2023 17:36:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4038

The following changes since commit c74928b1a7b2f285ed70999539f0c630316ad364:

   reproducible-builds.rst: document OEQA_REPRODUCIBLE_TEST_TARGET and 
OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS (2023-06-15 19:42:32 +0200)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to cbacc8a77aca68c5b25c8cad42bc4c88275cfc09:

   ref-manual: classes: devicetree: fix sentence saying the same thing 
twice (2023-06-23 19:34:37 +0200)

----------------------------------------------------------------
Luca Ceresoli (1):
       ref-manual: classes: devicetree: fix sentence saying the same 
thing twice

Michael Opdenacker (1):
       ref-manual: variables.rst: explicit variables accepting colon 
separated lists

Quentin Schulz (4):
       docs: bsp-guide: bsp: fix typo
       docs: ref-manual: terms: fix typos in SPDX term
       docs: fix unnecessary double white space
       docs: ref-manual: terms: fix incorrect note directive

Richard Purdie (2):
       migration-guides: add notes on FILE_LAYERNAME
       migration-guides: add notes on systemd/usrmerge changes

  documentation/bsp-guide/bsp.rst                        |  2 +-
  documentation/dev-manual/init-manager.rst              |  2 +-
  documentation/dev-manual/new-recipe.rst                |  2 +-
  documentation/dev-manual/upgrading-recipes.rst         |  2 +-
  documentation/migration-guides/migration-3.4.rst       |  2 +-
  documentation/migration-guides/migration-4.3.rst       | 17 
+++++++++++++++++
  documentation/migration-guides/release-notes-4.0.9.rst |  2 +-
  documentation/migration-guides/release-notes-4.3.rst   | 12 ++++++++++++
  documentation/overview-manual/concepts.rst             |  2 +-
  documentation/ref-manual/classes.rst                   | 12 ++++++------
  documentation/ref-manual/release-process.rst           |  2 +-
  documentation/ref-manual/terms.rst                     |  8 ++++----
  documentation/ref-manual/variables.rst                 | 43 
++++++++++++++++++++++++-------------------
  13 files changed, 71 insertions(+), 37 deletions(-)

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


