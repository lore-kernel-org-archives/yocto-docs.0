Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C59CC4332F
	for <webhook@archiver.kernel.org>; Wed, 19 Oct 2022 16:26:14 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.10480.1666196767384691440
 for <docs@lists.yoctoproject.org>;
 Wed, 19 Oct 2022 09:26:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=j+8SVgTK;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 392912000C;
	Wed, 19 Oct 2022 16:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666196764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mR0b1quiVFhG+2W4ovqJxQ2Xw5Lbdnkl+BuUUDY6uzc=;
	b=j+8SVgTK+dmBwHcBHCtwuzrfh9X+Y5FIDD7nddlperQv9dpc2Pmr09a6hgWM9toYJuNpHy
	+IU+rL1Oi6isAOA8ucw4fGclruXaUrzC7EOansv5NEAvGnUyCkto3+PsFrHgHKZZ/oI42v
	/1D1okkxzJh5vW6jfOix2IzPpPp4sr0NGQf8Duud/bnZKQUYwOxL4QoRATvyfAzQauJv0j
	GEUGP2XBpYub5QzXPXo3CObKB/viQ1fgmPvnsSJaaJfueNVFi3F2pc5C+ncgVbAvveqB/b
	fAg50XcxRadF5ISGkrQfHWjo1vNQrIAfEQHlNyMS0J/tgiK4mFHebwrsE7rOUg==
Message-ID: <d9e810d9-d51b-51fe-e7b0-08d302dd58ec@bootlin.com>
Date: Wed, 19 Oct 2022 18:26:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs][PATCH] migration-guides/release-notes-4.1.rst: remove
 bitbake-layers subcommand argument
To: "ito@lineo.co.jp" <ito@lineo.co.jp>
References: <1ea1ac6e-315c-45d2-61c9-05197154f720@lineo.co.jp>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <1ea1ac6e-315c-45d2-61c9-05197154f720@lineo.co.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 19 Oct 2022 16:26:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3376

Hi,

On 10/19/22 18:17, ito@lineo.co.jp wrote:
> Hi all
>
> - remove bitbake-layers subcommand argument
> ---
>  documentation/migration-guides/release-notes-4.1.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)


Thank you very much for the patch!
However, you're missing a "Signed-off-by" field in your patch. Make sure 
you produce your commit with "git commit -s".

You should also try to run the following command to get your full name 
as commit author when I accept your patch:
git config --global sendemail.from "ito@lineo.co.jp"

Could you send a new version after doing this, please?
Thanks again
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


