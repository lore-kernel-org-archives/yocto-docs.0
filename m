Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60A59C05027
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 14:07:57 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.9200.1675865272105213899
 for <docs@lists.yoctoproject.org>;
 Wed, 08 Feb 2023 06:07:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=oww4DE29;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 21FCF40007;
	Wed,  8 Feb 2023 14:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675865269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RKfDIqN+P6IRN0y1pLL2ahO67XUqrzl4vjaBXkLPgho=;
	b=oww4DE29kT/rLZDTQNK3Kx+1XxDfp8/n6gkOoLD4wacf4ajyfrCLulud23d+tgZLvCP9s2
	RhgzF+2Fob9SZ+7i/KxmDmguxjy1gf+b2OAVohzkKuGe0T59on2o3j2io3saafQx21M92y
	DdTpocGbpYnSmxifm1+ZTPduGezZIx0lKGz3Y+ZgKtr/8um/U8FYKbuJxtgfbWnQ0WLraG
	QmlMCfE6gkRemFn2FO+OBCDCXJV9QicvtFqWNrkOQLS5u1/y+wvF7ZdxKjvaEhAm58gG7E
	I25DLe6xkM4NqMaI9uQZ94RL2syUJMcCPzv6QdJytH8YK/uAY/gAfhDq3Ln5aA==
Message-ID: <594390d7-0e59-3d12-6ddc-171824b8e484@bootlin.com>
Date: Wed, 8 Feb 2023 15:07:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] migration-guides: add release-notes for 4.0.7
Content-Language: en-US
To: Takayasu Ito <ito@lineo.co.jp>
References: <20230205134830.808950-1-chee.yang.lee@intel.com>
 <4f83127e-a8ee-de98-043e-2887b7baf483@lineo.co.jp>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <4f83127e-a8ee-de98-043e-2887b7baf483@lineo.co.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 08 Feb 2023 14:07:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3646


On 06.02.23 at 02:14, Takayasu Ito wrote:
> Hi Lee
>
> Add Security Fixes in Yocto-4.0.7
> python3: Fix :cve-2022-45061
>
> https://git.yoctoproject.org/poky/commit/?h=kirkstone&id=c4bbc6d9c5077b26d6d8e48aa47927b3cbb023e0 
>
>
> https://nvd.nist.gov/vuln/detail/CVE-2022-45061

Good catch, thanks.

I'm taking care of fixing this.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


