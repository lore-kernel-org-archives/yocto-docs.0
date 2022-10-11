Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1639EC433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 08:20:49 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web09.4920.1665476440865320007
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Oct 2022 01:20:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RlBfk5hB;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 165D1240003;
	Tue, 11 Oct 2022 08:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1665476438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EMIVqXBD1TmoA61Vb8Szhne6w7Sxoyb9dVtxOPITFvg=;
	b=RlBfk5hBmqALrbt6opNjimQPv9pF5BHr9iAL5R8IF5Zgp4BI0xjcH5/mc99J0vJLizSEBF
	gYQwnkyMUwZPuezDHIlpJOjA4/BOeDuSELsO4Bhl2b/oVOQ8dbsl/luMc9YYDrjJ6tKFs8
	Fh34ur4qnDS3bOVnxUzwKHTwfxYXfxhjOZVChOg4hfZOmI0ZywK1/JjeS9ydMj3yRSpUPd
	Dw2M9bcmtkZBJ6UW8jZ4P4k5YHMs+VACZwLWGBZVNB+U/GIXpFW+Ey3SFBK7iz0b+UW/n4
	N/vrqGKgQejwvSQKXSGJoZKh65Ry7SKsnCKtAN2ubqaZSJd76ussBNFTMdMMQQ==
Message-ID: <733d013c-5e75-0cf4-d71b-2ae2e56d6fa7@bootlin.com>
Date: Tue, 11 Oct 2022 10:20:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 08/34] ref-manual: sync supported distro list with
 code
Content-Language: en-US
To: Paul Eggleton <paul.eggleton@linux.microsoft.com>
References: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
 <4b9ba55459a5f02d5f72aa907b5cee128558f557.1665392835.git.paul.eggleton@linux.microsoft.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: 
 <4b9ba55459a5f02d5f72aa907b5cee128558f557.1665392835.git.paul.eggleton@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Oct 2022 08:20:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3347

Hi Paul,

On 10/10/22 11:23, Paul Eggleton wrote:
> From: Paul Eggleton <paul.eggleton@microsoft.com>
>
> We were missing Ubuntu 21.10.
>
> Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
> ---
>   documentation/ref-manual/system-requirements.rst | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
> index acc97c9..014c9a5 100644
> --- a/documentation/ref-manual/system-requirements.rst
> +++ b/documentation/ref-manual/system-requirements.rst
> @@ -41,6 +41,8 @@ distributions:
>   
>   -  Ubuntu 20.04 (LTS)
>   
> +-  Ubuntu 21.10
> +
>   -  Ubuntu 22.04 (LTS)


Is the code right though? 21.10 is no longer updated by Canonical and 
22.04 is more recent. What about stopping testing it instead?
That's why I didn't add it to the documentation.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


