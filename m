Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BD15C433F5
	for <webhook@archiver.kernel.org>; Mon,  3 Oct 2022 15:04:59 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web12.1037.1664809492922024689
 for <docs@lists.yoctoproject.org>;
 Mon, 03 Oct 2022 08:04:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=a5oQr/QV;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id F29AD1BF218;
	Mon,  3 Oct 2022 15:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1664809490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8cT5z1DdD/0HnzgMt93Lejbd2nC2dBfM8wlQG++g//k=;
	b=a5oQr/QVHXlW3LakBKeXnb4W6fM4czzSV2PwmvDgSSkkyjZL7f6fSX8Vk1fW1WgD4cKEE+
	n6SW74q8/XZEPgkqgvrbJejQGvv3cgkF/vaYFHLFXuaZdojbcZBXBAMVIw1IAbWSERFWCl
	qQg36IwMqi/SnFLsuxrhEFgANZk54a5jAz1W/OfmqCH7a3AtsnDxbl762nV4xEKFC5NqFB
	cGT8B86bWDkL3/rn/fGKu4V5QLnHsvvcfMsQaPYh6VOMwIbk7lfVaEoAXMVgoRh0/m8kyY
	w0hV88rXEUS6gsziQtgXtGAaAwIKYqixRdrl1FLepI9le12KXJwQBlI9CRUc5Q==
Message-ID: <0a132144-f790-2fe7-d21d-c7f52a52aeed@bootlin.com>
Date: Mon, 3 Oct 2022 17:04:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Cc: "Yocto Documentation (docs@lists.yoctoproject.org)"
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] Incorrect minimum versions shown for GCC and make
Content-Language: en-US
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
References: <e50abe3c777e4a23a752a3ec25ad0b2a@axis.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <e50abe3c777e4a23a752a3ec25ad0b2a@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 03 Oct 2022 15:04:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3260

Hi Peter,

Thanks for reporting this issue.

On 01.10.22 16:49, Peter Kjellerstedt wrote:
> If I look at
> https://docs.yoctoproject.org/dev/singleindex.html#compatible-linux-distribution
> the minimum version for GCC is shown as "5.0", while the minimum version
> specified in documentation/poky.yaml.in (MIN_GCC_VERSION) is "7.5".
>
> And the minimum version "&MIN_MAKE_VERSION;" for make indicates that
> the MIN_MAKE_VERSION variable is not defined, but in
> documentation/poky.yaml.in it is set to "4.0".
>
> Based on the above, it seems the development documentation is using the
> poky.yaml.in file for Kirkstone rather than the one for Langdale.

Right, and the documentation is out of date for Kirkstone too.
I'll try to find why this happens.

Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


