Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAEDCC19F28
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 14:07:53 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web09.8989.1659535663567737772
 for <docs@lists.yoctoproject.org>;
 Wed, 03 Aug 2022 07:07:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RCMWJs8G;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A8ADC60011
	for <docs@lists.yoctoproject.org>; Wed,  3 Aug 2022 14:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1659535661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AQi6GITvHkxgy6WLVXLRBlNuEvnSf6zTv0Ns4qOCF6M=;
	b=RCMWJs8Gq7RJaUzLlJkJbgHr8YtEvskaH4NfthWdjGB+gha4SbieMSbNrAt+qyEpA3ceVZ
	rskMLe5LhlU1ysdHPk0y+lS06Ms1tVXFu4xi3d5q7b82M2DrdsLCaiDmtwkRecWvhGW3bD
	VpKFx6YS4lyJQP8Kaemp0SNBcjjqtnw3kFhFSbL/uBqlNpMkWKRKrCa9fJiebqva5AMxKV
	EBdfMZDyErY6YUlz9uDDa0eu4ZRcfivhKuAg5dIqztbWF6YxjhcteP4ttb3OWTPzF94dMT
	YlkiaicbZWAXsKDLzrvGz2D+OcQ6LWr3ngbRDhOwNLC+q03dljFRe+RtJGbNvQ==
Message-ID: <21b24dbd-1355-ac55-2d7c-b4ad303817e2@bootlin.com>
Date: Wed, 3 Aug 2022 16:07:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: YP docs mailing list <docs@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: Add 3.1.18 to supported release manuals
Organization: Bootlin
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 03 Aug 2022 14:07:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3108

Hi again Quentin,

This question is also related to release management.

https://docs.yoctoproject.org/dev/releases.html doesn't have version 
3.1.18 (released yesterday) yet, though a "yocto-3.1.18" tag was added 
the yocto-docs repository too.

I guess nothing triggered a rebuild, and therefore the set_versions.py 
script didn't get a chance to update the list of releases 
(releases.rst). Would it be possible with the Autobuilder to cause the 
addition of a new tag to trigger a new build? Or any other solution?

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


