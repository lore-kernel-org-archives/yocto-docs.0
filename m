Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EA17C001E0
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 14:55:59 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.17524.1690988158021073368
 for <docs@lists.yoctoproject.org>;
 Wed, 02 Aug 2023 07:55:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ecehCgKd;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 34391E000F;
	Wed,  2 Aug 2023 14:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690988155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=58nLBPO2pi0Dy2DDX4Nbz8aDY8ITV1Iat44pQq9pngw=;
	b=ecehCgKdX2JBnb3gWa7Wso5lQrjYulJP5aIb4QYr1Db9fTHEBXEO+a/MGAF8t6P+N2ymBn
	P2uuQ4ftCjN01NFgKCj8jh2GmZGs40Wq//8+WErJRiwB+oZjmOF0wP2sAJ/r47NpRTJIXH
	vPz1d6ikrpVG4cDdO5qn7jPx/g5OillN9TRvNj2/N9qkMGEcO8N9gqAlT6OOoSm7F1plzR
	I4lyPuwsWVFncvUZj5uf/1dad4VULKI+x+fSPDOSasxb6q5TUbD6E7pWrgLI7ybzyhd9cy
	40y0FDCLCYw5qNSOXov9MNbXGim08M3YaeYBqrfzshEO8J4Wp4J/l5PP/2VIzQ==
Message-ID: <19776934-5246-96c2-f3f8-e94699f3a34f@bootlin.com>
Date: Wed, 2 Aug 2023 16:55:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual: classes.rst: suppress rust-hello-world
 reference and ptest-cargo class
Content-Language: en-US
To: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
References: <20230802132352.95244-1-frederic.martinsons@gmail.com>
 <cc9f9aa3-3951-f9cf-fd8c-a2b38db5ffc2@bootlin.com>
 <CA+cAkeoD9DotF5VU-GEC_6_b7WEeOY-Lr4qvb8C0NvUsAcbH+g@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CA+cAkeoD9DotF5VU-GEC_6_b7WEeOY-Lr4qvb8C0NvUsAcbH+g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 02 Aug 2023 14:55:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4100


On 02.08.23 at 16:51, Frédéric Martinsons wrote:
>
>
>     Could you just confirm that this patch doesn't depend on the 3
>     OE-core
>     patches you've just sent?
>
>
> Glad you asked, the part concerning ptest-cargo class doesn't depend 
> on them, but the removal
> of rust-hello-world does (third patch on the series you mentioned).
> Sorry, I should have made two patches for the docs. Please tell me
> if it is too annoying for you and I'll send a rework here with two 
> patches instead of a single one (one for ptest-cargo
> doc and one for removal of rust-hello-world).


Well, it doesn't hurt to stop mentioning example code that will be 
removed later. It's not like mentioning some code that hasn't been 
merged yet.
So, I believe your single commit is fine.

Thanks
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


