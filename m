Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6805C433EF
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 09:47:58 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web12.4963.1641894477458444498
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Jan 2022 01:47:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 6462A1BF208;
	Tue, 11 Jan 2022 09:47:55 +0000 (UTC)
Cc: michael.opdenacker@bootlin.com,
 YP docs mailing list <docs@lists.yoctoproject.org>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: No more nightly builds?
Organization: Bootlin
Message-ID: <69f31ad6-7e08-29de-8dc7-8dc575eb134c@bootlin.com>
Date: Tue, 11 Jan 2022 10:47:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Jan 2022 09:47:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2371

Greetings,

Do we still have nightly builds? I cannot find them anywhere, but the
documentation still refer to a broken location
(https://autobuilder.yocto.io/pub/nightly/).

I'll be happy to remove the corresponding chapter
(https://docs.yoctoproject.org/dev-manual/start.html#accessing-nightly-builds)
if indeed we no longer produce such builds.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


