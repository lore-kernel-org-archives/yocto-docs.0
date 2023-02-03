Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72735C61DA4
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 17:32:21 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.17342.1675445536101089586
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Feb 2023 09:32:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hdvXg0e2;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 27AC560004;
	Fri,  3 Feb 2023 17:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675445533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NDgYtGtOjeV87g7E76XZv9wJDBWWXDWdTS9IurE/vzc=;
	b=hdvXg0e2O/BnKrZxSF9as3Y5f4+lA5CqO9Si2xq4dKjsWnGv0F6qa+Llp8HHinGhMhk3Bo
	BJRYbSOdbtYP08D2Dx4/dyfDEGAzFCBw7MsiGNxd+OdiUq8itQlUweCjxX3CP8joEo9Jf6
	YG4VU6scIY0TbgeQR80T3QR0LCsKKAQRQwyckK4vpIbSbM0X2Sx5oR2FJqiJXul7d+f+Wx
	RQg5txbyQZV11bhHA51dA+6f6UBUBuK3JODhaXzFavzCHocPm+XzHLwNHa5dC1F5PbFxBs
	WMvzx0sNb5/VitCdpCBXP40uNcJEZ6PQ9xOeByi8Ra/BBEa9Bv+E+lM1+Ifdlg==
Message-ID: <3abfbcd3-fc6c-3f41-6a04-5edb57167202@bootlin.com>
Date: Fri, 3 Feb 2023 18:32:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Cc: docs@lists.yoctoproject.org, Alexander Kanavin <alex.kanavin@gmail.com>
Subject: Re: [docs] [PATCH] ref-manual: document Rust classes
To: Alex Kiernan <alex.kiernan@gmail.com>
References: <20230113180932.1507356-1-michael.opdenacker@bootlin.com>
 <CAO5Uq5TgP2N0fhR_zPpK4FBzZ6RO67tqiSOYWDsyS2wbfAfuNw@mail.gmail.com>
 <c7172449-e2c5-012f-e8fd-05b4edaf7eb9@bootlin.com>
 <3ce2f565-05ca-2410-5368-d1990a66b6bb@bootlin.com>
 <CAO5Uq5SWDfaRFXimX4QfbA31KYbbHjgXwDoh3nd-apkTxuGhYw@mail.gmail.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CAO5Uq5SWDfaRFXimX4QfbA31KYbbHjgXwDoh3nd-apkTxuGhYw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Feb 2023 17:32:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3635

Hi Alex,

Thanks for the feedback!

On 03.02.23 at 13:06, Alex Kiernan wrote:
>
> I suspect you missed this part:
>
> # edit resulting recipe delete boiler plate tasks and add `inherit
> cargo cargo-update-recipe-crates`
>
> I've just pushed up this repo which I did step by step:
>
> https://github.com/akiernan/hippotat-recipe
>
> Though I can't argue its less straightforward than the `cargo bitbake`
> approach - holding up my hands, so far we've only migrated one of our
> rust recipes to update_crates.


I believe I did that, but now I have your recipe to compare with mine. 
Maybe a basic mistake somewhere :)

>
>> So, I'd rather document a workflow that's by far the easiest, even if
>> that's not something officially supported by the Yocto Project.
>>
> Sorry, I did say I'd write something and I've not - the last couple of
> weeks have disappeared into a load of other things.

No problem, I'm also here to take the raw input from people and turn it 
into docs.

Thanks again
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


