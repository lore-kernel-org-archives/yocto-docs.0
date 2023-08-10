Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 060A8C001DE
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 08:33:35 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.12853.1691656411043706926
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Aug 2023 01:33:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Pw7cgzA2;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 380A01BF207;
	Thu, 10 Aug 2023 08:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691656408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i7wpdiC2Bi62HFfromB/fCazCoXrlUtX7JhvKN/jiTQ=;
	b=Pw7cgzA2yU/q5q8hMsPg+r/5k+hlCXOGwtZDLy2E9IE4UQP2qqmPV7iZm1e4NvZvpUostY
	JUuI/8BFXYjtlbk9xkT3M8k7+yOYr9XgmdgNhrde6uJJ1ySGJ9ARwddq3ZPtBp7ry7mZy0
	McuATH1at8S0C7EkY3ov1Huh9IcIHgUM/Q7ViTdEMXLOIATes9yZFKWvphE/5aAOVIvHan
	3jqr/I60+k930D8Z9stdDSD/mMB/z7eSKGYLIgAwqpNojOQbxGDya7+Mj+F2b0/YgaHljl
	ua9EwbG23BHXk5wpbe8qDprSTbIH/8Xu9HkA2/11h6tvHiwT/9OIIOqWmOEgrg==
Message-ID: <d5fafe35-8d96-a3ce-5c5b-e31c1165438c@bootlin.com>
Date: Thu, 10 Aug 2023 10:33:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Cc: docs@lists.yoctoproject.org,
 =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Subject: Re: [docs] [PATCH 2/3] contributor-guide: add section about why we
 use mailing lists
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20230809142520.226581-1-michael.opdenacker@bootlin.com>
 <20230809142520.226581-2-michael.opdenacker@bootlin.com>
 <CA+cAkeqBLnr5YRygjCT_6j2M-Hkht3DxAxiQLrP63nBvG9sFwQ@mail.gmail.com>
 <88d3c02eaadc6ce5356608cf93f84dc81471146d.camel@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <88d3c02eaadc6ce5356608cf93f84dc81471146d.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 10 Aug 2023 08:33:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4133


On 09.08.23 at 19:57, Richard Purdie wrote:
>>
>> I find the term "point-and-click" a little patronizing,
>> github/gitlab/others web tools
>> are not just point-and-click machine but highly customizable tool
>> aims at smoothen the developer work (in term of tracking, viewing
>> diff, forking) and to provide enhanced user experience.
> I agree we should tweak the wording.


I changed the text to a more neutral "would prefer a web-based GUI".
Done directly in master-next.
Thanks for the review!
Michael.


-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


