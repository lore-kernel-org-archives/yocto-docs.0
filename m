Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15BC6C77B60
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 13:30:39 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.19706.1682688631180516629
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Apr 2023 06:30:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PP/Z64tO;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E37B41BF207;
	Fri, 28 Apr 2023 13:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1682688628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ai+iUPoXnyoMrysckqZakrrdZ6r+dwLuY04HErBrBqU=;
	b=PP/Z64tOPciWhe3tbLsl2cRMSRw7YPcam0NsytILV7p6Be3eQLbIJJisbVd3ZmryodPZkM
	ek5O6OTTnJ9ad5zoNybLKccgPazH7zyCpQt0o6dT8HV3bZE1RPNFLn/hnzWfwBOTCdiOoi
	HtqRaOF0eYJsyTVqywmPRuLiSxyNeaDOV4zzxVwUW0j7p7NO8CsxBkD6F/pEKnQuNC3N87
	TJFcfcpPzgNT6hrbyhIL3wXxfOtd3WnYjrCH/Xq4n2PUqRe/Q20+fGkD4wtaHEI+dm7Evb
	h5Ihbi7IZBwj8oOZc2GOmeIbhd2BeN7Fa4GNJ/elGig91zI2vWNwPzJyZdDHhw==
Message-ID: <3bccc8a9-f96d-e7c7-216b-0b270c2b5bec@bootlin.com>
Date: Fri, 28 Apr 2023 15:30:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
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
 <docs@lists.yoctoproject.org>; Fri, 28 Apr 2023 13:30:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3881

Hi Richard,

The following changes since commit daafb70e6d60fd7d00c8de736eca2c430db77ee8:

   release-notes-4.2: update RC3 changes (2023-04-26 15:59:34 +0100)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to dc59b636bb4319a3af552bce84929ddb22a479fb:

   ref-manual: variables.rst: document 
KERNEL_DANGLING_FEATURES_WARN_ONLY (2023-04-28 10:23:55 +0200)

----------------------------------------------------------------
Michael Opdenacker (11):
       ref-manual: classes.rst: document devicetree.bbclass
       ref-manual: remove unused and obsolete file
       ref-manual: variables.rst: add wikipedia shortcut for "getty"
       overview-manual: update section about source archives
       manuals: document SPDX_CUSTOM_ANNOTATION_VARS
       overview-manual: development-environment: update text and screenshots
       ref-manual: add "Mixin" term
       migration-guides: release-notes-4.0.9.rst: add missing SPDX info
       migration-guides: fixes and improvements to 4.2 release notes
       manuals: expand init manager documentation
       ref-manual: variables.rst: document 
KERNEL_DANGLING_FEATURES_WARN_ONLY

  documentation/dev-manual/device-manager.rst               |   2 ++
  documentation/dev-manual/init-manager.rst                 | 108 
+++++++++++++++++++++++++++++++++++++++++++++++++++--------------------------
  documentation/dev-manual/sbom.rst                         |   3 +++
  documentation/dev-manual/start.rst                        |  45 
+++++++++-----------------------
  documentation/migration-guides/release-notes-4.0.9.rst    |   2 ++
  documentation/migration-guides/release-notes-4.2.rst      | 192 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------------------------------------------------
  documentation/overview-manual/development-environment.rst |  34 
++++++++-----------------
  documentation/overview-manual/figures/index-downloads.png | Bin 18142 
-> 0 bytes
  documentation/overview-manual/figures/source-repos.png    | Bin 298757 
-> 775796 bytes
  documentation/overview-manual/figures/yp-download.png     | Bin 82939 
-> 518257 bytes
  documentation/ref-manual/TODO                             |  11 --------
  documentation/ref-manual/classes.rst                      |  43 
+++++++++++++++++++++++++++++++
  documentation/ref-manual/release-process.rst              |   8 +++---
  documentation/ref-manual/terms.rst                        |   8 +++++-
  documentation/ref-manual/variables.rst                    |  90 
+++++++++++++++++++++++++++++++++++++++++++++++++++-------------
  15 files changed, 341 insertions(+), 205 deletions(-)
  delete mode 100755 
documentation/overview-manual/figures/index-downloads.png
  delete mode 100644 documentation/ref-manual/TODO

Thanks in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


