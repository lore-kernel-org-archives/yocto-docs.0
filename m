Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92C46C67861
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 16:09:12 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.141435.1712678945476882340
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Apr 2024 09:09:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MzY5NGhC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 797331C0005;
	Tue,  9 Apr 2024 16:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712678943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=680OMcecuPOG7aBkQc5mha0kudA2JmOYuORunaErF9I=;
	b=MzY5NGhCkJ0kAhIadBGpSIR7Vdk2kRUkFTIDK90svOIdOb+Vz2hXWJ4INrSSPJKyDcR53s
	r3EjE3sl8VFVIjycnTAnV3g3pP35NHSuIIwjzFrRKowt1JiLP6mk/kmLXfAnc4ho9JWf7s
	+TVHiXem1xBBxwf19T6x0zjjNfnx/z8IZEojGQOP9jhnXYJHEE4rGIsejVt89+PiE0lDfX
	8fG7hcqGyBPqQts9tcjO/c8ud7HCDzFzFZJMUjQmQnZnJ8HpuovokswWgPaejoY5CkVXlX
	zQ8RG/1UozVmTBD63DodelEUFXuwnGq0eUirBS8RX4NZ/ZrgSmSfzWyrqWHR2w==
Message-ID: <1eda3ced-e876-44f7-9e68-b828675e6d93@bootlin.com>
Date: Tue, 9 Apr 2024 18:09:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 2/2] release-notes-5.0: Document some work
To: Yoann Congal <yoann.congal@smile.fr>
References: <20240409145544.3115398-1-yoann.congal@smile.fr>
 <20240409145544.3115398-3-yoann.congal@smile.fr>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240409145544.3115398-3-yoann.congal@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 09 Apr 2024 16:09:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5096

Hi again Yoann

On 4/9/24 at 16:55, Yoann Congal wrote:
> This patch should cover those commits (from poky) :
> * 789b10030c6 (cve-update-nvd2-native: remove rejected cve from database, 2024-03-15)
> * 19f27037b2b (cve-update-nvd2-native: add an age threshold for incremental update, 2024-03-13)
> * 6ce61b43570 (strace: disable bluetooth support by default, 2023-12-13)
> * 381ef628fab (ref-manual: add documentation for the unimplemented-ptest qa warning, 2023-10-10)
>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>   .../migration-guides/release-notes-5.0.rst      | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
>
> diff --git a/documentation/migration-guides/release-notes-5.0.rst b/documentation/migration-guides/release-notes-5.0.rst
> index 8df95ca21..441c5d7d6 100644
> --- a/documentation/migration-guides/release-notes-5.0.rst
> +++ b/documentation/migration-guides/release-notes-5.0.rst
> @@ -10,6 +10,10 @@ New Features / Enhancements in 5.0
>   
>   -  New variables:
>   
> +   -  ``CVE_DB_INCR_UPDATE_AGE_THRES``: Configure the maximum age of the

Now that you defined the variable in the previous commit, you can now 
refer to it:
:term:`CVE_DB_INCR_UPDATE_AGE_THRES`
I took care of doing it.

> @@ -44,6 +48,9 @@ New Features / Enhancements in 5.0
>   
>   -  Testing:
>   
> +   -  Add an optional ``unimplemented-ptest`` QA warning to detect upstream
> +      packages with tests that does not use ptest.
s/with tests that does not use ptest/with tests, that do not use ptest/
(fixing grammar issue plus adding a comma to try to make the sentence 
easier to understand).
I made the change by myself.
>
>   
> +   -  systemd: split bash completion for udevadm in a new udev-bash-completion

Add backquotes around "udevadm" and "udev-bash-completion".
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into "master-next".
Thanks!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


