Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 855D2C678DC
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 09:38:41 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.7833.1692351516423373959
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Aug 2023 02:38:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AF+hdWu0;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 33A081BF209;
	Fri, 18 Aug 2023 09:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692351514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FGaccru1yrmwZaG4YHy1RQyA7ZJSq0O++1onZk9oEvM=;
	b=AF+hdWu0Ja0punlYx/BodFhwj8CtAXETKub71qkncAfu5OP35hGCAxB1xU9RbegVMINNGZ
	PndngpcS5rgeKlRELPjop6i5KACAJKG5hFGqYthlo1Q6y/qSt65hrOcQIR+ZT2B90JqRiy
	FLjYCKgtesqfF9qC2MLZZYgT8JvXO49OXnqKj32ooAJzFg77nXc7jXPIKuzScwNn8dW2hu
	GGqozIs8/zu60rDpn1gOz19CnphytYUmtRuTptU6N820K8tQBfwUPmofS0mc89pBo4Rxf8
	IImKXPp8ar4ANFIykcvqGmprGgvwiemAMEUwz8V+AlKPg6dbQQw2xh1pIhAv9w==
Message-ID: <f5ded1f7-f773-b7c2-ec60-4d349d687416@bootlin.com>
Date: Fri, 18 Aug 2023 11:38:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [master] Pull request
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <177C70532F319E37.30507@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <177C70532F319E37.30507@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Aug 2023 09:38:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4163

Hi Richard,

Oops, Charlie Johnston's patches are not ready to merge yet (waiting for 
merged in OE-core), so here's an update without these patches:

The following changes since commit efa1c57ecec934998792b7851b4a162be92c8b23:

   ref-manual: document image-specific variant of INCOMPATIBLE_LICENSE 
(2023-07-31 11:30:46 +0200)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to 9a9ecbe46c74280b3741389829764b70671975e6:

   dev-manual: disk-space: mention faster "find" command to trim sstate 
cache (2023-08-17 16:54:46 +0200)

----------------------------------------------------------------
Daniel Semkowicz (1):
       dev-manual: wic.rst: Update native tools build command

Frederic Martinsons (1):
       ref-manual: classes.rst: suppress rust-hello-world reference, add 
ptest-cargo class

Michael Opdenacker (13):
       manuals: create a dedicated "Contributor Guide" document
       ref-manual: classes.rst: fix location of _ref-classes-ccache
       ref-manual: update supported distro versions
       contributor-guide: add missing links to mailing lists
       contributor-guide: add section about why we use mailing lists
       contributor-guide: add recipe style guide
       ref-manual: remove AUTHOR variable
       contributor guide: call section "Reporting a defect"
       contributor-guide: remove obsolete pkg-config guidelines
       contributor guide: remove unnecessary information about mailing lists
       contributor-guide: clarification about patchtest
       contributor guide: update instructions for making and sharing changes
       dev-manual: disk-space: mention faster "find" command to trim 
sstate cache

  documentation/bsp-guide/bsp.rst |   4 +-
  documentation/contributor-guide/identify-component.rst |  29 +++++++++++++
  documentation/contributor-guide/index.rst |  26 ++++++++++++
  documentation/contributor-guide/recipe-style-guide.rst | 257 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  documentation/contributor-guide/report-defect.rst |  67 
+++++++++++++++++++++++++++++
  documentation/{dev-manual/changes.rst => 
contributor-guide/submit-changes.rst} | 290 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++------------------------------------------------------------------
  documentation/dev-manual/debugging.rst |   7 +--
  documentation/dev-manual/disk-space.rst |  34 +++++++++++----
  documentation/dev-manual/index.rst |   3 --
  documentation/dev-manual/new-recipe.rst |  54 ++---------------------
  documentation/dev-manual/start.rst |   9 ++--
  documentation/dev-manual/vulnerabilities.rst |   2 +-
  documentation/dev-manual/wic.rst |   2 +-
  documentation/index.rst |   1 +
  documentation/overview-manual/development-environment.rst |  19 ++++-----
  documentation/ref-manual/classes.rst |  26 +++++++++---
  documentation/ref-manual/resources.rst |   7 ++-
  documentation/ref-manual/system-requirements.rst |  43 +++++++++++++------
  documentation/ref-manual/variables.rst |   4 --
  19 files changed, 617 insertions(+), 267 deletions(-)
  create mode 100644 documentation/contributor-guide/identify-component.rst
  create mode 100644 documentation/contributor-guide/index.rst
  create mode 100644 documentation/contributor-guide/recipe-style-guide.rst
  create mode 100644 documentation/contributor-guide/report-defect.rst
  rename documentation/{dev-manual/changes.rst => 
contributor-guide/submit-changes.rst} (69%)

Thank you in advance
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


