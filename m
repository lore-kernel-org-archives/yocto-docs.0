Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29553EED617
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 16:13:57 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.24990.1694794428051922601
 for <docs@lists.yoctoproject.org>;
 Fri, 15 Sep 2023 09:13:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=DtNhw5Nw;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2D8ED1BF207;
	Fri, 15 Sep 2023 16:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694794425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=F3CtfZIQBFU56FOsV04+kszAlEVJrNbPWKfJXBGWgck=;
	b=DtNhw5Nwi8LHj5Uy4RWmPDwIgwWMgKOX06jvoAFaeQtlxtNfPHGBskLosPBWjijDMIZ05r
	XTdzhQzw/lGv54sLPZlxdqoCEs6+cykQ6LmZhEB7St3UBJNpKPfKnZ49EFnkcMo1LPn7p3
	9TPc1r8EK6JQe/z9tkeAnXEHOQWUP8y9mIx/cYlg8wwsf3gKqfkQWrE6i9KfQ1rhSoPWs6
	0qkepQUz0yxo5wLIvEI/PPCsK/1n30l5GQNRQwNXBtLNTCVFeXTpp57lRDeQhJowGbaB9f
	Xp45qjKh2yY8q46aAbKgD/HDITKANpNfjnY0bbcsikFTDgCB3hxDwDlHHj6Blg==
Message-ID: <a2414183-264f-da20-699c-c2a257cee2d2@bootlin.com>
Date: Fri, 15 Sep 2023 18:13:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
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
 <docs@lists.yoctoproject.org>; Fri, 15 Sep 2023 16:13:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4218

Hi Richard,

The following changes since commit 7ec90b6af4dc32dbe313b77d17297e19c809bb3c:

   README: Update to point to new contributor guide (2023-09-07 11:27:06 
+0200)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to a34626dd59617a32f6c20aa9ac11f15db2795a75:

   dev-manual: licenses: mention SPDX for license compliance (2023-09-14 
11:57:36 +0200)

----------------------------------------------------------------
Michael Opdenacker (4):
       dev-manual: new-recipe.rst fix inconsistency with contributor guide
       contributor-guide: recipe-style-guide: add Upstream-Status
       dev-manual: licenses: update license manifest location
       dev-manual: licenses: mention SPDX for license compliance

Ross Burton (1):
       manuals: document LICENSE_FLAGS_DETAILS

  documentation/contributor-guide/recipe-style-guide.rst | 81 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  documentation/dev-manual/licenses.rst                  | 42 
++++++++++++++++++++++++++++++++----------
  documentation/dev-manual/new-recipe.rst                | 13 +++++++------
  documentation/migration-guides/release-notes-4.3.rst   |  5 ++++-
  documentation/ref-manual/variables.rst                 | 17 
+++++++++++++++++
  5 files changed, 141 insertions(+), 17 deletions(-)

Thank you in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


