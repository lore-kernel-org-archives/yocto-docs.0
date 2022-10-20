Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1723C4332F
	for <webhook@archiver.kernel.org>; Thu, 20 Oct 2022 06:56:54 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.6733.1666249010287119738
 for <docs@lists.yoctoproject.org>;
 Wed, 19 Oct 2022 23:56:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=d3sTvHUI;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 054A51BF204;
	Thu, 20 Oct 2022 06:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666249008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tmleuk8uRSNAPYlzQflL1eMkdsmNuAbXYdNIZLPuk6g=;
	b=d3sTvHUIDSVWxMC9BhouBfZPuWNQF3IQ/wlcZf7CkhuanrYI482thmrUOZehVmuR+lFPzE
	Z89shmYMz0yLDjajKZSaFU7b9b3W+zvDE3IZf1mWpjgbDFdFZIJ/Yo+4xY2HdVtGvWM7Pp
	zRDB2KnVkOO2s6XSXsOx+JoQQIcX4YlMT6LqVKQN3CNP77pSeSp7hVn0+IBbqnUBwE6hbV
	PTUOZmfmoGYEXyniZf7Rbl7cfY+JZIPWa2ic0iEQecNcKRX8Uy1etAOd8pU5S+1pr6gDJv
	I86M1YJUXRPRSfP8QT1WI86FfgkgmbGBEOtukNKwaiqwnx5yfjLJD2FHH3mX1A==
Message-ID: <f82c7294-ed68-9de7-c9a0-cbac7c09213b@bootlin.com>
Date: Thu, 20 Oct 2022 08:56:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs][PATCH v6] release-notes-4.1.rst remove bitbake-layers
 subcommand argument
Content-Language: en-US
To: Takayasu Ito <ito@lineo.co.jp>
References: <20221020065246.33834-1-ito@lineo.co.jp>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20221020065246.33834-1-ito@lineo.co.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 20 Oct 2022 06:56:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3386


On 10/20/22 08:52, Takayasu Ito wrote:
> From: Takayasu Ito <ito@lineo.co.jp>
>
> Signed-off-by: Takayasu Ito <ito@lineo.co.jp>
> ---
>   documentation/migration-guides/release-notes-4.1.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)


Great, the patch applies correctly now.
Thanks
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


