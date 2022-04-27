Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0E06C433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 09:34:17 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web09.6133.1651052049510198787
 for <docs@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 02:34:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TufQA69M;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B794220013
	for <docs@lists.yoctoproject.org>; Wed, 27 Apr 2022 09:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1651052047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rFbHBbDy+6O0BsFx2mvFMNrqh7Khm4VNLxvM3sHpjjI=;
	b=TufQA69MPDVw10s23gxuzTLJ+ePXxsaBG73NmAn/ZofVwXyGrojplKIhkrQvuyedqU/DD6
	DrTRpCLz6cEyLQfXpQFo63JVXY+ERbiOiUCeUOMW2nVHDnBPs5KGAxRr4gAMUcESjdnBiz
	c0EAhvkPWd8+w9whSe0sGFcKAevVX6LsdJ0MEgydMaxI+sYQzSFiKCODXH9C9SClUSyvQI
	Kx9kdHpsveTxRoqfhw0egmaKVRVBFsiW3yuxyxL9gfq6hUd2HMIZg+d2S8UcpDUZ3DQI1m
	7pXMiQCOYje7GVok/30Onk188gkltM5iUKiNjOE8w9OfQ8fxxQlf/Nbk8guMbQ==
Message-ID: <6c3311c1-801b-b17a-44a1-ca76017e9e94@bootlin.com>
Date: Wed, 27 Apr 2022 11:34:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: YP docs mailing list <docs@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: Sstate cache for version 4.0.999?
Organization: Bootlin
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 27 Apr 2022 09:34:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2878

Greetings,

In https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html, we
suggest to use:

SSTATE_MIRRORS ?= "file://.* https://sstate.yoctoproject.org/4.0.999/PATH;downloadfilename=PATH"

However, https://sstate.yoctoproject.org/4.0.999/ doesn't seem to exist.
Could we create it?

Thanks in advance
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


