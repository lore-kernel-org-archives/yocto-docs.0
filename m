Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38FBDC636D7
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 08:18:08 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web10.6099.1677140286240303764
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Feb 2023 00:18:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Z0zQk50M;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9C4C310000B;
	Thu, 23 Feb 2023 08:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677140284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3OAeH02C9MFeHmtRoeEbQA6KWzg05QhfEOEH3o3ZoZU=;
	b=Z0zQk50MvWMKvF0V+gYJh9icryfiNvMW6SZn/AqP1eQIAXP2R8thxGxNMPG8eboYy0jQXb
	1wnWX9C5S5CCa1tfoHnO6U6iM5Ee5ml6DnVzlL/LvUCaFbGxaJVnhLsCZnQab/rYOzesfP
	cs7vUkak9tSMACqf/dUvI/kt1YngdkKDbE4InnNcVUbcyIcYiy0rTGRj0AGEjh5I/R1b+w
	kVNMozC1oHYu/rzbECMTtgRJmQ32c8ubxtwlNMdx0pTsm6bqVE7wF6mb7WudvfdVb+H3Ix
	4X3S51rgxYgPQ47Fmdef6WGJfaOX4uHRRDRc7rqDjLx07rK1WJDcdjwLsylIYQ==
Message-ID: <0c5e25df-357d-5f75-2dfd-d8f3d75c0e8c@bootlin.com>
Date: Thu, 23 Feb 2023 09:18:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [yocto-docs][dunfell 2/2] ref-system-requirements.rst: add
 AlmaLinux 8.7 to list of supported distros
Content-Language: en-US
To: Steve Sakoman <steve@sakoman.com>
References: <cover.1677075570.git.steve@sakoman.com>
 <1528a79b0297d8573d2e580334d093af6aa22dd8.1677075570.git.steve@sakoman.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <1528a79b0297d8573d2e580334d093af6aa22dd8.1677075570.git.steve@sakoman.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 Feb 2023 08:18:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3719


On 22.02.23 at 15:20, Steve Sakoman wrote:
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>   documentation/ref-manual/ref-system-requirements.rst | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/documentation/ref-manual/ref-system-requirements.rst b/documentation/ref-manual/ref-system-requirements.rst
> index dda6c3084..ac963dcdb 100644
> --- a/documentation/ref-manual/ref-system-requirements.rst
> +++ b/documentation/ref-manual/ref-system-requirements.rst
> @@ -83,6 +83,8 @@ distributions:
>   
>   -  AlmaLinux 8.5
>   
> +-  AlmaLinux 8.7
> +
>   .. note::
>   
>      -  While the Yocto Project Team attempts to ensure all Yocto Project


For both patches:
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
and merged into "dunfell".

Thanks!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


