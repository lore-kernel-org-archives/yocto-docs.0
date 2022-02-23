Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD88C433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 14:20:40 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web08.8020.1645626038533552896
 for <docs@lists.yoctoproject.org>;
 Wed, 23 Feb 2022 06:20:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hUdpyyCQ;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4809424000D;
	Wed, 23 Feb 2022 14:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1645626036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1uX402DNtg/v0cDUwcpjQjuWsfBMojmfMFOrdl92sQA=;
	b=hUdpyyCQYxWQ+4abudwhXLz0vU5hvPYhiWyn4G1tVw0iqCW0hxHGcJOlCn4wjE4mePzvj+
	UTUJxxrOLIlPLRxz6WLdicWAQnu1e2+jsypRLMyIuiaz6u7wDvRfPenOvNblaMVcZznI3S
	54H9aYo/fxW20DNSGuftfTvuw7FyRAWxjIuc65YB+64uVqwopg7MVm3QFS/LTS7q3wcWa4
	MX8SaxW5nR17EEbBzXNowaubCAs1VGJBBjlsPd7rX5qqthcMYVbiQhM4dV2gUvSTV2NFQs
	PqeWrr5LVCPN5IytUna9hWy9YdhdTxHZzDYFkRIzSChx3tHxgEqWVymq6Wvbgg==
Message-ID: <f7c608ec-6631-77e2-28c4-91af2a0eaf43@bootlin.com>
Date: Wed, 23 Feb 2022 15:20:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Cc: Quentin Schulz <foss+yocto@0leil.net>
Subject: Re: [docs] [PATCH 1/2] docs: fix hardcoded link warning messages
Content-Language: en-US
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
References: <20220223105206.2766014-1-foss+yocto@0leil.net>
 <24a2b39e-0d85-5514-b7dd-48782b2a4d2d@bootlin.com>
 <acd8aa9b-393a-e022-124f-804a6aa953a2@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <acd8aa9b-393a-e022-124f-804a6aa953a2@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 23 Feb 2022 14:20:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2495


On 2/23/22 14:46, Quentin Schulz wrote:
> Hi Michael,
>
> On 2/23/22 14:34, Michael Opdenacker wrote:
>> Hi Quentin,
>>
>> On 2/23/22 11:52, Quentin Schulz wrote:
>>> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>>>
>>> Sphinx complains about hardcoded links which can be replaced by an
>>> extlink.
>>>
>>> So let's apply its recommendations.
>>
>>
>> Many thanks for the fixes!
>> I wonder how you got those while I didn't. Which version of Sphinx do
>> you have? I have version 4.2.
>>
>
> $ sphinx-build --version
> sphinx-build 4.4.0


Thanks. I upgraded, and will document this:
pip3 install --upgrade sphinx sphinx_rtd_theme pyyaml

I get the warnings now!

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


