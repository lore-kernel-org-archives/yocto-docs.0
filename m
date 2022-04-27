Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 263C7C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 10:23:38 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web09.6441.1651055013763277713
 for <docs@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 03:23:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=atnVfQpm;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E90EE240004;
	Wed, 27 Apr 2022 10:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1651055011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4pnWa0UWhz7Clb1iLNQmC9WjcJRZ9uNUqbCbqHvf2V4=;
	b=atnVfQpmJwaDbfkyvVPjemHQJM2qCT3YbWdjHHwICrVyvRt0a7VGFl1yTih3c0v9AL2qhg
	iSb6q43vVhqsbdzs0ETWZgMPPtDMlkKvqPKeb+Jw8gi45EJWBYRQ9qaIogAc839bV1WV/H
	QWjd/225V1XhMB+IKd6hWNE1V5T51ub/u0LvcQj+6d8huLGWiYooKC2DKJGpnIZi2x8IWc
	xer2/w7s7kChMEaDNTs0LCMSKCcxze9zSH5f+a/u/0S10r5oUxuiupeaxVSRzLkdDpevQV
	kBIafjsf5p99fJaRrdqX+tWRe0lRe/cKplpXb9b64vvWS+ELlffrEUiuYy9QtQ==
Message-ID: <d6938cec-65a0-b2de-619d-a21bbf1d7bd5@bootlin.com>
Date: Wed, 27 Apr 2022 12:23:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [docs] Sstate cache for version 4.0.999?
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: <6c3311c1-801b-b17a-44a1-ca76017e9e94@bootlin.com>
 <5e8a23044f0a0284fb12e6dde5a37331160c4b6a.camel@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: 
 <5e8a23044f0a0284fb12e6dde5a37331160c4b6a.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 27 Apr 2022 10:23:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2881

Hi Richard,

On 4/27/22 12:07, Richard Purdie wrote:
> On Wed, 2022-04-27 at 11:34 +0200, Michael Opdenacker via lists.yoctoproject.org
> wrote:
>> Greetings,
>>
>> In https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html, we
>> suggest to use:
>>
>> SSTATE_MIRRORS ?= "file://.* https://sstate.yoctoproject.org/4.0.999/PATH;downloadfilename=PATH"
>>
>> However, https://sstate.yoctoproject.org/4.0.999/ doesn't seem to exist.
>> Could we create it?
> It needs to be 4.0 for all releases in the kirkstone series.


Unfortunately, I see no variable in poky.yaml.in for this. Could we have
something like a "DISTRO_SERIES" variable which would be "DISTRO" but
without the point release number?

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


