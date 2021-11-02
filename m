Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F999C433F5
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 19:06:25 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web12.2485.1635879984112898527
 for <docs@lists.yoctoproject.org>;
 Tue, 02 Nov 2021 12:06:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id D9165FF80C
	for <docs@lists.yoctoproject.org>; Tue,  2 Nov 2021 19:06:21 +0000 (UTC)
To: YP docs mailing list <docs@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: Variable documentation overlap between Yocto and Bitbake
Organization: Bootlin
Message-ID: <f9c8e642-a6d1-afbe-247c-39ac1db60a0c@bootlin.com>
Date: Tue, 2 Nov 2021 20:06:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 02 Nov 2021 19:06:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2069

Greetings,

Following recent discussions, I realize that the "gitsm" fetcher (Git
Submodule) is not documented yet in the description of SRC_URI.

However, shall I add this to both Yocto Project and Bitbake
documentation, which both describe SRC_URI? There's a lot of overlap
between the two, by the way, and this makes me uncomfortable.

Could there be a clean way to document all the common stuff in Bitbake's
documentation, and only OE core's specific options in Yocto docs? I'm
thinking about options such as "striplevel" that are implemented only in
OE core...

Thanks in advance for your advice.

Cheers,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


