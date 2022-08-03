Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78A24C19F28
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 12:59:33 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web09.8173.1659531566145960051
 for <docs@lists.yoctoproject.org>;
 Wed, 03 Aug 2022 05:59:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JxYmDYp0;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3568F1C0010
	for <docs@lists.yoctoproject.org>; Wed,  3 Aug 2022 12:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1659531564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ux12B9dL/8BiVR6Cl8CxIdHBSx92WW6vl+v+xxSqPVw=;
	b=JxYmDYp03IC95dLaaoalxc6PstE1PyhGzqlnFqDZr++6k6xDxTpk6OHCkyIcGAlJpSq7DX
	+Jg0QWteDvkL3IJF8Wko42aTmFZsHQ+Z1UmN/eIXCq69ej3Cug7TgeeB5aVfKbHLvL3cLk
	OL9SCL9XkrIjiVRTlf511WAOqNfBvLPHQLPYpK+ziRgGnnc8Fpp7sM56ULZf6NdK2Ve63h
	Kos8gwoQpPRnDbWYDhXw63sfG4sYdCzf1tGA5w+AlDxwVleE0z3rcxJgTHT5Q2EJKi2/Uq
	sSus7GyxWKHJp27/3fPfJNmCMJ1kf+f463sOknKgNCmp2IC/qOn6ohbw7rkuSw==
Message-ID: <ac5fc19e-3c47-edb2-b5f0-da408275c0f6@bootlin.com>
Date: Wed, 3 Aug 2022 14:59:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: YP docs mailing list <docs@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: Generated master docs not up to date - issue in run-docs-build?
Organization: Bootlin
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 03 Aug 2022 12:59:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3103

Greetings

I've found issues with https://docs.yoctoproject.org/, generated from 
the master branch:

  * The 4.0.1 and 4.0.2 release notes don't appear on
    https://docs.yoctoproject.org/migration-guides/index.html while they
    are in the master branch
    (https://git.yoctoproject.org/yocto-docs/commit/?id=027a58616db9f3e8ee5992b57fd99cb3c284ece9
    and
    https://git.yoctoproject.org/yocto-docs/commit/?id=a17bfe2636c11ce8e3266d9add804d795991e2ea)
  * PEP517_BUILD_API is still documented on
    https://docs.yoctoproject.org/ref-manual/variables.html#term-PEP517_BUILD_API
    while it was removed by
    https://git.yoctoproject.org/yocto-docs/commit/?id=afa895871e8ec18f4861f48f70b8a54cc2e4cb98

So, some commits in master doesn't seem to have been used for generating 
the docs. However, the latest commit 
(https://git.yoctoproject.org/yocto-docs/commit/?id=5004957d1c65d03d3e296bc9f0a00982457a27f8) 
was used because you have the new hash server (hashserv.yocto.io:8687) 
on 
https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html#building-your-image

On the contrary, https://docs.yoctoproject.org/next generated from the 
master-next branch looks OK as it contains the 3 above changes, and the 
changes from the latest commit.

Weird, isn't it? Could there be an issue in 
https://git.yoctoproject.org/yocto-autobuilder-helper/tree/scripts/run-docs-build 
, the scripts which generates our docs?

I started looking at the Autobuilder logs 
(https://autobuilder.yoctoproject.org/typhoon/#/builders/114), but 
haven't found anything suspicious yet. Investigations may take time though.

Any guesses?

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


