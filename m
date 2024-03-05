Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17894C54E41
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 14:51:45 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.24627.1709650295749676383
 for <docs@lists.yoctoproject.org>;
 Tue, 05 Mar 2024 06:51:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pdwXVkJ3;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E69BC240009;
	Tue,  5 Mar 2024 14:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709650294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=itbDtVkI5S4CZtOF1c75LjsnPkUJCCyPkZhY17ueb5k=;
	b=pdwXVkJ3H3W5FvbpFZyGWyVfzi9gijctl+bnqc59eHeKNeAtm74kRTz531x0fmxFAuNQjW
	3Sz+DfenjwWloPtmQGKw1eagknibKfmv8hAVP+3m25Dr8Zgl6DUemuDmKgDkK/dRNdvLBP
	8KOKB3vnkeR0ER8zGrad1SarU92ys8zAn3AdxvcP5wtQeyDsOa1DAnejMxXqUEPfM0PV53
	KRssI+qeYSdUz1cPq+LFu3FdfWF7vmaidertHlTCyQ7sBUXO4oSNmc12VDEjPHiPeOMfrW
	WOmbYPEvg8VPl6XJImPla6BF3JWqcsUKXbucJkV/41WDhiiUDsicyqO9euyMJw==
Message-ID: <93bfc62e-c92b-4aff-b06e-40bbcbd46d87@bootlin.com>
Date: Tue, 5 Mar 2024 15:51:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Tim Orling <ticotimo@gmail.com>
Content-Language: en-US
To: YP docs mailing list <docs@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: Documenting VIRTUAL-RUNTIME variables
Organization: Bootlin
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 05 Mar 2024 14:51:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4932

Greetings,

Following a warning from Tim (thanks!).

The VIRTUAL-RUNTIME_* variables do not appear in the YP manual variable 
index, and we shouldn't definitely address this.

However, I still hesitate between:

 1. Creating multiple entries, especially for the most frequent
    variables (VIRTUAL-RUNTIME_init_manager,
    VIRTUAL-RUNTIME_dev_manager...), and maybe for "VIRTUAL-RUNTIME" as
    a name prefix
 2. Creating just a generic "VIRTUAL-RUNTIME" entry for this common prefix.

I'm tempted to go for 1, but then I guess it opens to door to 
documenting most uses of this scheme.

Your opinions are welcome!
Thanks
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


