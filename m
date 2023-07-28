Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3E0BC41513
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 18:41:58 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.39845.1690569708584511020
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Jul 2023 11:41:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=gt3AUnaT;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1609A1C0004;
	Fri, 28 Jul 2023 18:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690569706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bUs/unakyhlyFmvc7TRmEn36CTOCOpBQkNlnIEu/seQ=;
	b=gt3AUnaTT2Aj9Og7b08vom0eU5swjsVgv6y9J1PXXkPxV/FQuDm9LQPMclq1LMlWq8Ohuq
	FXTYxp6OcwnFLwg3KPcZzUNvdSGgRwAAxelO4DO+Y8qgn45tzRiaEZ42BZHcwlvyl4aEuU
	jEr+belnvSNv+qV1B5aA/kCTtWtKT/E2E1Hgbto2kPR5WzF5jyuK0G9GjO00KTTc3++xon
	xS0PG3bpfYXQYpbsb8n7qAqSVILoFr4fh1RYklAdGwj1yqqVIz7eiBqYxNnYrOtnMpMZz1
	IE1Wpcj+b8Mr44q5ucDdSLZz/TNaF3da7T9L2+MIqcoBNRfTHismwjHjRrDH6A==
Message-ID: <1fdd238e-b14b-6f85-db68-07eeea3e2726@bootlin.com>
Date: Fri, 28 Jul 2023 20:41:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Language: en-US
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: Updating the list of sanity tested distros?
Organization: Bootlin
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Jul 2023 18:41:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4084

Greetings,

As far as I understand, the list of distros that the Yocto Project 
supports (or should claim it supports) is the intersection of the list 
of sanity tested distros (SANITY_TESTED_DISTROS in 
meta-poky/conf/distro/poky.conf) and the distribution versions that are 
still publicly supported by their vendors (as checked on Wikipedia). 
There's no point in claiming to support a distribution for which package 
updates are no longer available.

Currently for master, this intersection is only:

  * Ubuntu 20.04 (LTS)
  * Ubuntu 22.04 (LTS)
  * Fedora 37
  * Debian GNU/Linux 11.x (Bullseye)
  * OpenSUSE Leap 15.4

Here are a few obvious absents here:

  * AlmaLinux: version 8.7 and 9.1 are still in SANITY_TESTED_DISTROS
    but they are obsolete. I see an AlmaLinux9 worker on
    https://autobuilder.yoctoproject.org/typhoon/#/workers, but I don't
    know whether it's 9.1 or 9.2 (not obsolete unlike 9.1).
  * Fedora 38: important as Fedora 37 ends in November. I see a Fedora38
    worker, but there are still failed jobs, even though the majority
    are successful. When is a distro version ready to be added to
    SANITY_TESTED_DISTROS?.
  * Debian 12: we also have such a worker, with a mix of successful and
    failed builds. Is this version eligible too?
  * OpenSuse Leap 15.5, as OpenSuse Leap 15.4 expires in November too. I
    see a worker, but with only failed builds.

I'd say that the most urgent one is AlmaLinux 9.2 as otherwise we don't 
support AlmaLinux any more. The next ones for the end of the year are 
Fedora 38 and OpenSuse Leap 15.5.

Would you have any thoughts?

I was about to send a documentation update to declare that master (and 
probably Mickledore and Kirkstone) only support 5 different distribution 
versions, but a longer list would look better...

Thanks in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


