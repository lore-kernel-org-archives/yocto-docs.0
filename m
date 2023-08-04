Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E801C001DB
	for <webhook@archiver.kernel.org>; Fri,  4 Aug 2023 17:45:08 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.3525.1691171101203876018
 for <docs@lists.yoctoproject.org>;
 Fri, 04 Aug 2023 10:45:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dIuvqEuJ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B53F720005;
	Fri,  4 Aug 2023 17:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691171099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AeJTXOhjsRusFWXIUpYE4Jv7YwNH/Ze5ilsmOnLvF4c=;
	b=dIuvqEuJUg12ieAW2wA0f8V2UHOMbx0AUnVZcxZeqJtZ1E7S++37iXtFka/PXLUu/svN2e
	vprydmFGPrFnD/BtVKw+nODy6+aSwO0deTost74zTv+Fbd6XFTuiE+zf/ltDPkTwHvtYc4
	Pi91RbZFKrwyxXVRwenXVYpBkEIxxxYC7FJeklXne3+kSWRq+0C1oS4knHgXVRAI0W3E7n
	ynQ+7I6NcWjmcVLkBGr1siaIBrCcClJi/rqL0PS+rUVo41x4RmacP7JVMdhxCHH2LKSX+a
	pCQh6OuTpZOB17+3kRZU5XDKVDRS1pd8+sS/iN2ZG8B9rF4gGg5hNMpdvVWBBQ==
Message-ID: <f1935be9-60dd-0dbd-855e-b8edbe83c417@bootlin.com>
Date: Fri, 4 Aug 2023 19:44:58 +0200
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
 <docs@lists.yoctoproject.org>; Fri, 04 Aug 2023 17:45:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4106

Hi Richard,

The following changes since commit efa1c57ecec934998792b7851b4a162be92c8b23:

   ref-manual: document image-specific variant of INCOMPATIBLE_LICENSE 
(2023-07-31 11:30:46 +0200)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to cfac42fa5424c383f3e5701c9be9918bdfcfbd9b:

   ref-manual: classes.rst: fix location of _ref-classes-ccache 
(2023-08-02 20:53:17 +0200)

----------------------------------------------------------------
Frederic Martinsons (1):
       ref-manual: classes.rst: suppress rust-hello-world reference, add 
ptest-cargo class

Michael Opdenacker (2):
       manuals: create a dedicated "Contributor Guide" document
       ref-manual: classes.rst: fix location of _ref-classes-ccache

  documentation/bsp-guide/bsp.rst |   4 ++--
  documentation/contributor-guide/identify-component.rst |  29 
+++++++++++++++++++++++++++++
  documentation/contributor-guide/index.rst |  25 +++++++++++++++++++++++++
  documentation/{dev-manual/changes.rst => 
contributor-guide/submit-change.rst} | 102 
++++++++++++++++++++----------------------------------------------------------------------------------
  documentation/contributor-guide/submit-defect.rst |  67 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  documentation/dev-manual/debugging.rst |   7 ++-----
  documentation/dev-manual/index.rst |   3 ---
  documentation/dev-manual/start.rst |   9 ++++-----
  documentation/dev-manual/vulnerabilities.rst |   2 +-
  documentation/index.rst |   1 +
  documentation/overview-manual/development-environment.rst |  19 
+++++++++----------
  documentation/ref-manual/classes.rst |  26 ++++++++++++++++++++------
  documentation/ref-manual/resources.rst |   7 +++----
  documentation/ref-manual/system-requirements.rst |   4 ++--
  14 files changed, 185 insertions(+), 120 deletions(-)
  create mode 100644 documentation/contributor-guide/identify-component.rst
  create mode 100644 documentation/contributor-guide/index.rst
  rename documentation/{dev-manual/changes.rst => 
contributor-guide/submit-change.rst} (85%)
  create mode 100644 documentation/contributor-guide/submit-defect.rst

Thank you in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


