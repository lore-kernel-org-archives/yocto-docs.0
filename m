Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18062C6FD1D
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 10:37:41 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web11.5453.1678790252751850800
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Mar 2023 03:37:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=EvbItTQl;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7C1CF10000B
	for <docs@lists.yoctoproject.org>; Tue, 14 Mar 2023 10:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678790250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6W1wjFGtnzpjGKa+9l/VNc9CexYjhgABKNX2Lz0OyeM=;
	b=EvbItTQli7JzaTTIiABbIBP2a5amBBW7/BmR9QDfR8g4dFBzXUmMjNgDUe4UTn9NCzsEXJ
	rDD39MOrYEYIQ+UrDbqGpsq9jcRZls8GaFbojT3AqOKUJXzsGM5NznBZptIK00RYdFVSuU
	CV5qQDK+CuBRovRcyzVS5jUUVoqVWgbeDuxOGQ+2cf3x5gH8nmJ1H2MDHhrikAPjb+FwpI
	Kyc+JOn16vKmu96hYBdi+8P/204RoqIffuEeJkVSiIVZ9X9rLqKV9lf9b7YWbQfcCL5LbQ
	LrPjMZDLFzCZCQYzG4chVIUHuWvhEDEGN2CFiOI0gPWtec++9sPNZzu4mbX80g==
Message-ID: <4451dc89-5be5-aeb7-4f53-869eb07f1275@bootlin.com>
Date: Tue, 14 Mar 2023 11:37:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [docs] [PATCH v2] Documentation: add pygments package for
 generating docs
To: docs@lists.yoctoproject.org
References: <174C3D672BA632EA.1180@lists.yoctoproject.org>
 <174C407AB89113D2.1180@lists.yoctoproject.org>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <174C407AB89113D2.1180@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 14 Mar 2023 10:37:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3792


On 14.03.23 at 10:54, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> To the packages required to build docs
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> - Changes in V2:
>    - Had "pygments" to PIP3_HOST_PACKAGES_DOC in documentation/poky.yaml.in too


Forget about this change. Checking the package requirements again on a 
fresh Ubuntu 22.04 container, I found that this time "pygments"  didn't 
need installing. Indeed, " pip3 show sphinx" shows that it's a 
dependency of "sphinx".

I wonder why I had to add this yesterday.

Apologies for the noise.
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


