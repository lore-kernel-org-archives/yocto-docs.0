Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 526B8C636D7
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 08:17:28 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.6206.1677140240910616435
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Feb 2023 00:17:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WWpcpCSN;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7006FFF818;
	Thu, 23 Feb 2023 08:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677140238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N1aMtWY0aniF+eXZjrLmPWdfmshFJjrnvDyyGjuTVzQ=;
	b=WWpcpCSNnHg5dsnXQODrHgTPIeVkyzSAyLT1aMPCNfyh4iYjz3VkJXKnwEUm5daYFiP0kc
	K+98rM188C+6rLbgbkdNdElPBK9bQBgKZLrqIanAOLqfZ+X7k/q26zX9zhk8MsKyiz5QL0
	CG+HI9dIFkjjQfCCeyajaOYralb+MjRx1pPah9Nwg6Umh8JlVzqFq3WGbQwznf8MpkGA9k
	HOwYKSni5CJH7h0ThZsWzDHRrThZj65dxhYkHJ62bOyMpXq+zRVVuCUONVSBgNK0tb/y3Q
	t196KFnvEmWev+n5zot9XqoPkqERX/Z8WndE2JJpwcV74H7YB8pdv6gHFHLnwg==
Message-ID: <7071b758-736f-6dbf-6ad6-09d6c1c9b513@bootlin.com>
Date: Thu, 23 Feb 2023 09:17:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [yocto-docs][kirkstone] system-requirements.rst: add
 Fedora 36 and AlmaLinux 8.7 to list of supported distros
Content-Language: en-US
To: Steve Sakoman <steve@sakoman.com>
References: <cover.1677076251.git.steve@sakoman.com>
 <69400eb337346877fa8643c54a64af82ab0939a3.1677076251.git.steve@sakoman.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <69400eb337346877fa8643c54a64af82ab0939a3.1677076251.git.steve@sakoman.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 Feb 2023 08:17:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3718


On 22.02.23 at 15:32, Steve Sakoman wrote:
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>   documentation/ref-manual/system-requirements.rst | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
> index caafccb63..060a5dde0 100644
> --- a/documentation/ref-manual/system-requirements.rst
> +++ b/documentation/ref-manual/system-requirements.rst
> @@ -47,12 +47,16 @@ distributions:
>   
>   -  Fedora 35
>   
> +-  Fedora 36
> +
>   -  CentOS 7.x
>   
>   -  CentOS 8.x
>   
>   -  AlmaLinux 8.5
>   
> +-  AlmaLinux 8.7
> +
>   -  Debian GNU/Linux 9.x (Stretch)
>   
>   -  Debian GNU/Linux 10.x (Buster)


Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
and merged into "kirkstone".

Many thanks!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


