Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F2C8C6FD1C
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 14:57:27 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.103984.1679669844822464934
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Mar 2023 07:57:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iookIgIE;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B83AAFF811;
	Fri, 24 Mar 2023 14:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679669842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KuDiJ81xD31G6vImVmD48FrAUTOsGwK8Zr663g9GNfo=;
	b=iookIgIEyhftjFXmtYXo/MnOIIsWnzAVNlTXwB74xfNe93ALoHekCWxbpVOF7BJsdVpYCY
	4eDWtLe9dj2AFcYiSlxJYerN10HLvIdpW2oGnjS13JOt7mROj/I/XZ/MMlBjkst1ftUR+v
	g97tzBLtGBfhjL6kKrRw9dIXt+LCOk+BSt89vwTGrk5kBvy1niDgBLNJczng47N4CkgoMN
	lN7QPCPk8SVykdIwipkBaYC8Ro6EhIONszzF7sP2gbAaDYNbutRQPo4mcBJ7BK8eDFfPyw
	cy/MZUNz0ZYC+NLMCVIFsNW+X11DZfbsoddWB4pURu2zZlvtw8dO/FMAR6/QKg==
Message-ID: <0db1e8c4-eed8-fdaf-46b1-de452550bf13@bootlin.com>
Date: Fri, 24 Mar 2023 15:57:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
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
 <docs@lists.yoctoproject.org>; Fri, 24 Mar 2023 14:57:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3815

Hi Richard

The following changes since commit 87cdda981fa6a3d05c559fb00e214214956346dc:

   ref-manual: variables.rst: update LAYERSERIES_COMPAT (2023-03-17 
17:23:02 +0100)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to 70536fa188101c8fdd6bbca8343829c4f798ef47:

   manuals: add "LTS" term (2023-03-23 18:15:45 +0100)

----------------------------------------------------------------
Michael Opdenacker (6):
       manuals: update disk space requirements
       manuals: add rm_work disk space data
       manuals: add minimum RAM requirements
       ref-manual: release-process.rst: update testing section
       ref-manual: release-process.rst: major updates
       manuals: add "LTS" term

  documentation/brief-yoctoprojectqs/index.rst           |    8 +-
  documentation/dev-manual/disk-space.rst                |    6 +
  documentation/dev-manual/securing-images.rst           |    2 +-
  documentation/migration-guides/release-notes-4.0.1.rst |    2 +-
  documentation/poky.yaml.in                             |    6 +
  documentation/ref-manual/release-process.rst           |   72 +++++----
  documentation/ref-manual/svg/releases.svg              | 1230 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  documentation/ref-manual/system-requirements.rst       |   19 +++
  documentation/ref-manual/terms.rst                     |    6 +
  9 files changed, 1317 insertions(+), 34 deletions(-)
  create mode 100644 documentation/ref-manual/svg/releases.svg


Thanks in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


