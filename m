Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A092AC433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 17:42:35 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.11249.1646761353967505555
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Mar 2022 09:42:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mH8GBbPc;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B963AE0007;
	Tue,  8 Mar 2022 17:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1646761352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bc6NksvSOFfpEP02u4w1BiNg454rybcg8MMl+OtV0L8=;
	b=mH8GBbPcp7ESctI/TiG49CIQK9vG1qUv8GTt4jxsjGUjJG9M6q+/nxWLu6ilSS4XUXd6rU
	DDX/BSVtlm3Zqpigmw/XQBG4EjMDQR16Pt8O7/6Q9xL1CWIx0bsoAphI4BW4bU8Vh5iGmD
	ro9W02MncWuywIIM62BnqgwxWJ+GEUORsN2oqMt3HOzdgQVIqauOYBXBhWde1qLAoGWwjp
	RbWfaBg6WnvFyL7oC3i+9puPSYAmhjCmuE58PjXIj+ekZXfzfc8XX08vKWpfoyTWTpJm5T
	2pa30phUqNSDV+S3rIrl4eWSvzmEr78WlgaBHQPf/NCgYBdVsj+uVAykFf+GDA==
Message-ID: <d30bbc97-2a8b-9725-8ef9-8a65ff2ed03c@bootlin.com>
Date: Tue, 8 Mar 2022 18:42:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [docs] [yocto-docs][dunfell 1/2] ref-system-requirements.rst:
 update list of supported distros
Content-Language: en-US
To: Steve Sakoman <steve@sakoman.com>, docs@lists.yoctoproject.org
References: <cover.1646749913.git.steve@sakoman.com>
 <673d87cd2b481444331726b74daeca83557cf4d4.1646749913.git.steve@sakoman.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: 
 <673d87cd2b481444331726b74daeca83557cf4d4.1646749913.git.steve@sakoman.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 08 Mar 2022 17:42:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2548

Hi Steve,

On 3/8/22 15:33, Steve Sakoman wrote:
> Add AlmaLinux 8.5, Fedora 35, and OpenSUSE Leap 15.3
>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  documentation/ref-manual/ref-system-requirements.rst | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/documentation/ref-manual/ref-system-requirements.rst b/documentation/ref-manual/ref-system-requirements.rst
> index 041f64c59..2acf11cdb 100644
> --- a/documentation/ref-manual/ref-system-requirements.rst
> +++ b/documentation/ref-manual/ref-system-requirements.rst
> @@ -59,6 +59,8 @@ distributions:
>  
>  -  Fedora 34
>  
> +-  Fedora 35
> +
>  -  CentOS 7.x
>  
>  -  Debian GNU/Linux 8.x (Jessie)
> @@ -73,6 +75,9 @@ distributions:
>  
>  -  OpenSUSE Leap 15.2
>  
> +-  OpenSUSE Leap 15.3
> +
> +-  AlmaLinux 8.5


Thanks a lot for the patch!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into the "dunfell" branch.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


