Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8416CC4332F
	for <webhook@archiver.kernel.org>; Thu, 20 Oct 2022 06:43:14 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.6726.1666248186745980526
 for <docs@lists.yoctoproject.org>;
 Wed, 19 Oct 2022 23:43:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UJdnZpJd;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7F17D60005;
	Thu, 20 Oct 2022 06:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666248184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FfQZnHlko2GeKnEZqHKk21yTMtRsGaualnrP4tIvYqw=;
	b=UJdnZpJdDP2busYdf6qUNRtzBy0ImhtxgYCwVJmfHp8Lp0hvLIG4LyAVo25xPr8mkt4Vog
	6A6OHHJsfBXgDe6QgdG47UFvCzwMBNoQovTZjLj8hOaFxUoStCYBIqPCA3CM+pYS3kn1St
	KIK5QMOHHI2hrTteiM0PbAMDrY4Deu8maT+s4azPysxOXYK6tv7AapE7TMviTDb9qkXyip
	UHsaG1WJNEEJkurRbk15QkP6Rsn4Ejke7/Tgcbw1bEBBBgUox9NFdGTJYjxQ0RsNU68Onw
	GaSIOiMtKPnvlgauKF9dasH4qCHmMFyMRYvQkPKna8wsl2DiDRXIXa5JylFTJw==
Message-ID: <aab96c54-1b13-6614-7fb4-89fca4825d8b@bootlin.com>
Date: Thu, 20 Oct 2022 08:43:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs][PATCH v5] release-notes-4.1.rst remove bitbake-layers
 subcommand argument
Content-Language: en-US
To: Takayasu Ito <ito@lineo.co.jp>
References: <20221020064057.33747-1-ito@lineo.co.jp>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20221020064057.33747-1-ito@lineo.co.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 20 Oct 2022 06:43:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3384


On 10/20/22 08:40, Takayasu Ito wrote:
> Signed-off-by: Takayasu Ito <ito@lineo.co.jp>
> ---
>   documentation/migration-guides/release-notes-4.1.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)


Still missing the correct "From" field. Could you show me your 
$HOME/.gitconfig file again?
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


