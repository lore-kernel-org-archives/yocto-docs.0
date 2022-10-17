Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21007C4332F
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 08:16:12 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web12.38612.1665994562066075192
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Oct 2022 01:16:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WjKS+PsN;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A3FFE60007;
	Mon, 17 Oct 2022 08:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1665994560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cWyzKw3zbNGfZ4czwQCgUvWJcqpUkL0sCuciKBgMuzI=;
	b=WjKS+PsNgn8Ffq7fRyV1QkMDlhPbXKlaFbOIX3MzYuulsWh5YLZQofbW5X3MQOIdOhWn7D
	wl5C2mjEjg3vo+woafkB+ERMCA/syfK6bsslBPPz6u5RZq/m24bmeLUBOochVj1mxhjhjb
	XiVGDI3naikyztN/1A2FqEAabFHGeKN4/ce3fZkwjGmHOyD+z16kTisFbL0JaAsjn8mlGz
	8vj/MrMCodMADdJVCQ29yWmCxzV3vAmdMhQyrutWzelgaBqEo6/Rrgbxb0QMiVts886+mg
	oAoQY2ILBx753V2HUpJHK6Obc3ZsEmLBH1FNyVXPXnyef9YHJeVmIiXQQXzL7g==
Message-ID: <06573b44-31c6-6d8e-c683-9f0f843057fa@bootlin.com>
Date: Mon, 17 Oct 2022 10:15:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 13/34] ref-manual: add pressure limit variable
 documentation
Content-Language: en-US
To: Paul Eggleton <bluelightning@bluelightning.org>
References: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
 <d0e6b7661912a5aeedc3e193ff76982cb0fc8dc1.1665392835.git.paul.eggleton@linux.microsoft.com>
 <936247d7-5cb0-2ec3-1a3e-15aa647d53c3@bootlin.com> <4749032.GXAFRqVoOG@linc>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <4749032.GXAFRqVoOG@linc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Oct 2022 08:16:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3365

Hi Paul,

On 10/16/22 22:38, Paul Eggleton wrote:
> On Tuesday, 11 October 2022 23:30:50 NZDT Michael Opdenacker via
> lists.yoctoproject.org wrote:
>> Actually, these have recently been accepted in the BitBake manual (the
>> patches from Aryaman got accepted after he left WindRiver), though
>> apparently with fewer details:
>> https://git.openembedded.org/bitbake/commit/?id=c014281f72f4f54ec8e681ef2b8e
>> 1080de9ab5cf
>>
>> Shall we submit your updates to the Bitbake manual instead? This way, we
>> don't have these variables documented in two different places.
> Ah, oops - I missed that. I'm OK with that for now; however, and I may have
> also missed if this has been discussed recently, but it's my opinion that all
> variables documented in the BitBake manual should also be in the Yocto
> reference manual, since they are two different contexts - the catch being that
> for some variables there is information you can't reasonably include in the
> bitbake manual since it relies on some definitions unique to OE so the entries
> can't always be copied exactly. If on the other hand some variables only
> appear in the BitBake manual, there will be people who just won't find them.


I agree that BitBake variables should all appear in the Yocto variable 
index.

There are already some variables which are initially documented in the 
BitBake manual and then the description is expanded in the Yocto manual 
according to the OE additions. SRC_URI is one of them:

  * https://docs.yoctoproject.org/bitbake/2.0/bitbake-user-manual/bitbake-user-manual-ref-variables.html#term-SRC_URI
  * https://docs.yoctoproject.org/ref-manual/variables.html#term-SRC_URI

>
> To avoid things getting out of sync, we could potentially have a script that
> would check for and report on variables present in the  BitBake manual that
> aren't in the Yocto reference manual. I'd be happy to write such a script.


This would be useful, but if I recall correctly, Quentin was rather 
thinking about having Sphinx include these from the BitBake manual, at 
least for the ones which are only defined in the BitBake manual.

Wouldn't it be better than duplicating content, which always causes trouble.

Any further thoughts?

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


