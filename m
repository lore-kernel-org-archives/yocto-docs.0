Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B90E4C001B0
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 18:42:54 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.50569.1691779372464049024
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Aug 2023 11:42:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NWTVz8FY;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CFCF420003;
	Fri, 11 Aug 2023 18:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691779370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LBf8HiNGmdwL2KbvSyuXnVvGJpy4jeBi6VInQMOraVY=;
	b=NWTVz8FYHwbxuQM/qpwc6c0cZQty4Sk139URTVwTGF4XgnA1L6y+8q2itWFk5YbqG9mvM3
	Ad52QrXlbLKLcDx++CO5EQgqgNEcitGJL/4+XKAfhJUD22TZvpmwt7v0s/qnhLMDOn1xVn
	xGHYQV3+Zi/DBKclsMxbZCnaADinmg+9y5vAaLhUSG4YT1YMXRqpEFdXuq1BmlXzvgaJhw
	u0ld5EaI5NRVNSon5eKgXcUI4ehpF2q9Vz2ZkYJZXZVJRJe6b+3dwAiO1u6BU9RYsgVTgo
	HiL648ijhbLE+05bbMLijYvCpweq+QsHHio/DzCDN2JB7yRLQoZI+s+FOHO+9g==
Message-ID: <54bd1bd8-d6ab-5ac5-ff3d-379a1d62315b@bootlin.com>
Date: Fri, 11 Aug 2023 20:42:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
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
 <docs@lists.yoctoproject.org>; Fri, 11 Aug 2023 18:42:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4151

Hello Richard,

The following changes since commit efa1c57ecec934998792b7851b4a162be92c8b23:

   ref-manual: document image-specific variant of INCOMPATIBLE_LICENSE 
(2023-07-31 11:30:46 +0200)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to 26588059b5dca211115c1259f1166cfba3616280:

   ref-manual: remove AUTHOR variable (2023-08-10 10:57:19 +0200)

----------------------------------------------------------------
Daniel Semkowicz (1):
       dev-manual: wic.rst: Update native tools build command

Frederic Martinsons (1):
       ref-manual: classes.rst: suppress rust-hello-world reference, add 
ptest-cargo class

Michael Opdenacker (7):
       manuals: create a dedicated "Contributor Guide" document
       ref-manual: classes.rst: fix location of _ref-classes-ccache
       ref-manual: update supported distro versions
       contributor-guide: add missing links to mailing lists
       contributor-guide: add section about why we use mailing lists
       contributor-guide: add recipe style guide
       ref-manual: remove AUTHOR variable

  documentation/bsp-guide/bsp.rst |   4 +-
  documentation/contributor-guide/identify-component.rst |  29 ++++++++++++
  documentation/contributor-guide/index.rst |  26 +++++++++++
  documentation/contributor-guide/recipe-style-guide.rst | 262 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  documentation/{dev-manual/changes.rst => 
contributor-guide/submit-change.rst} | 157 
+++++++++++++++++++++++++++-----------------------------------
  documentation/contributor-guide/submit-defect.rst |  67 
+++++++++++++++++++++++++++
  documentation/dev-manual/debugging.rst |   7 +--
  documentation/dev-manual/index.rst |   3 --
  documentation/dev-manual/new-recipe.rst |  54 ++--------------------
  documentation/dev-manual/start.rst |   9 ++--
  documentation/dev-manual/vulnerabilities.rst |   2 +-
  documentation/dev-manual/wic.rst |   2 +-
  documentation/index.rst |   1 +
  documentation/overview-manual/development-environment.rst |  19 ++++----
  documentation/ref-manual/classes.rst |  26 ++++++++---
  documentation/ref-manual/resources.rst |   7 ++-
  documentation/ref-manual/system-requirements.rst |  43 ++++++++++++-----
  documentation/ref-manual/variables.rst |   4 --
  18 files changed, 530 insertions(+), 192 deletions(-)
  create mode 100644 documentation/contributor-guide/identify-component.rst
  create mode 100644 documentation/contributor-guide/index.rst
  create mode 100644 documentation/contributor-guide/recipe-style-guide.rst
  rename documentation/{dev-manual/changes.rst => 
contributor-guide/submit-change.rst} (83%)
  create mode 100644 documentation/contributor-guide/submit-defect.rst

Thank you in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


