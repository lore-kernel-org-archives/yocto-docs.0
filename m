Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B61C77B75
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 15:30:40 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.22826.1683127836628233840
 for <docs@lists.yoctoproject.org>;
 Wed, 03 May 2023 08:30:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=A2YguyCB;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id F11DB24000D;
	Wed,  3 May 2023 15:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683127834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xQcyqxEGwpIlmxwtULX+9sXEznmOcL3dFPYX9FUr40M=;
	b=A2YguyCBk+8KAQPEM30rnZsqSbSLrEwMg4hnbPZaF08bZwmPcHJ3vFpY6e1CPxKdSZkSlt
	uWsAmN8tB+iL6zmP3URyMOTxhJIzRDryAGTG8y6gXm5s+q7EJAMlhPyHr3ABesGuJL3Osc
	QSjn4dkO1JT34CP7u5TUAVxDitXc8oj6bqQE0HWgO59geEzS/rbtRhaveaMvkHh1tQx2HA
	8PYpINNnwIUPcys9gUVqigIbOSoiNBp/7TC+LInP3eE/A5oQfIplcWCCTe5t2IZb91G1oY
	YGY/+Eza3Ph8oma/nIU/PWyCudbHzzghznyI9myLyPgnqE1+hxLGfkdBOFJo1Q==
Message-ID: <a00e3eba-e10b-c47b-8425-3005a4c72445@bootlin.com>
Date: Wed, 3 May 2023 17:30:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc: docs <docs@lists.yoctoproject.org>
Subject: Re: [docs] Start of 4.3 migration guide docs
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <d7788bbd4dba10c004fa56f0f4160f6c46bfd6f6.camel@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <d7788bbd4dba10c004fa56f0f4160f6c46bfd6f6.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 03 May 2023 15:30:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3902

Hi Richard,

On 03.05.23 at 16:55, Richard Purdie wrote:
> As mentioned on the weekly tech call, we need to get better about
> documenting changes for the migration guide and release notes as we go
> along. Whilst we're not far into 4.3, I realise I made or merged
> changes already which will need notes. Since we don't have a guide yet,
> let me note them here on the basis Michael will inject them into a new
> doc.
>
>
> * The '-crosssdk' suffix and any MLPREFIX were removed from virtual/XXX
> provider/dependencies where a PREFIX was used as well as we don't need
> both and it made automated dependency rewriting unnecessarily complex.
> In general this only affects internal toolchain dependencies so isn't
> end user visible.
>
> * runtime testing of ptest now fails if no test results are returned by
> any given ptest.
>
> * the bitbake cooker log now contains notes when the caches are
> invalidated which is useful for memory resident bitbake debugging.
>
> * glide was dropped as "go mod" has become the standard


That's a great start, thanks!

I was waiting for the release to made before creating the new pages, to 
make it easier to merge last minute changes into the "mickledore" branch.

Thanks again
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


