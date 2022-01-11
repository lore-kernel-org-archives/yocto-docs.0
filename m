Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1176C433EF
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 10:38:11 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.5358.1641897489827140701
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Jan 2022 02:38:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 3EDDA60008;
	Tue, 11 Jan 2022 10:38:06 +0000 (UTC)
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
 YP docs mailing list <docs@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: How to unpack a .tgz archive in a .zip file?
Organization: Bootlin
Message-ID: <a55c6066-cc1d-934c-68a3-5122cd6c4a79@bootlin.com>
Date: Tue, 11 Jan 2022 11:38:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Jan 2022 10:38:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2372

Hello

I'm working on adding the wiki guidelines for dealing with pre-compiled
libraries
(https://wiki.yoctoproject.org/wiki/TipsAndTricks/Packaging_Prebuilt_Libraries#Versioned_Libraries)
into the main documentation.

I'm trying to test the example recipe, but the latest pre-compiled
versions of libft4422.so are now available in
https://ftdichip.com/wp-content/uploads/2021/01/libft4222-linux-1.4.4.44.zip,
which actually contains a .tgz file!

I know that's absurd, but how would you handle this case? Through a
custom "do_unpack" task in the recipe?

Thanks in advance for your insights...
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


