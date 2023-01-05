Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91AA8C3DA7D
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 17:10:42 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.18658.1672938634634274446
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Jan 2023 09:10:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=poKtJW7P;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3BF8CE0007;
	Thu,  5 Jan 2023 17:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672938632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nwu5ZG1Bi/H+DRxsG0356muJ2umlLbmxyVrGuA5kZNo=;
	b=poKtJW7P9HSZymETJlRQUQFqo88J0mzpQJNnuzSadVtqLjvlNC9JGf53i+hPBiWYsBFGGN
	lLXGaZx7EAbBLjhvKGculoUxdEde9adUnGnioy7MnQJCpOPeAyPKwtP6qXohAQCHI0k9aA
	metPYK9V7k7IZ2R13DhGG+pYN54P+sRgDauyocMLtc+03Dm1YhjxNOZIFSJvx7IaO4rSGW
	xJ9ObPjSqmcPyRsjJgLdclsFGHEFET4tio+1i3HKugUZNvZ+u/St8dTcOAFqIsUxZOcR35
	GDWfXa25vyxL+FwPN2E8B7mAkNulFrjlgFAT7L6PtHfLFUOZTtTNnqSTZ+t9uQ==
Message-ID: <27ca23c5-d7d5-9add-052c-a8d47b63765f@bootlin.com>
Date: Thu, 5 Jan 2023 18:10:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual/system-requirements.rst: recommend
 buildtools for not supported distros
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20230105152010.2318650-1-michael.opdenacker@bootlin.com>
 <CANNYZj-TTDk_c4zEP1o+zhjZpC8P93pW0BKjeK4XH5HeNuYMjg@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CANNYZj-TTDk_c4zEP1o+zhjZpC8P93pW0BKjeK4XH5HeNuYMjg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Jan 2023 17:10:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3596


On 05.01.23 at 16:38, Alexander Kanavin wrote:
> Which is done by running scripts/install-buildtools and doing that has
> its own section in the same system-requirements.rst
> :-) A simple reference to it should be enough.
>
> Alex


Right, I wanted to minimize the text (as the section is referred to in 
the description of "builttools"), but it's true a direct reference will 
help.

Thanks
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


