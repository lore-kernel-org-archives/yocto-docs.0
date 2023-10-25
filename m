Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CBC8C0032E
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 10:20:07 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.40253.1698229201803255998
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Oct 2023 03:20:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=az6+6Itf;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 09A67C000A;
	Wed, 25 Oct 2023 10:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698229199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=omTKQlaIacG2wLYeyDbMJKxiAbtRa7YGyZv4Hys+6Qk=;
	b=az6+6Itf30lg2Dex7jMA+Zvx6zHXdr+CwJxMqi0GrteErxq9PMg0MC4NhvdBL6RCjvC/4R
	HV7sayn37oUVH2sPUkgfY0D3AYhDsG8vVp5JxzjfidppEYkrgIuTL/PWTb1r6Dgh16fKWJ
	kB3cnaPnYPsymCVUXT6AnHiG1ND/CXzfuFTWp9/7zxyVno6wfPTOPNbf063KhSVPi6tkUy
	+j2WM8iQZ2Biq8KrqJ4+vgx/gfRAdsMgrRIb24KquNEGdbU2VCkxkI0PoE3r+hL9fCKUhJ
	owie/to38gi1WqNJtF04EoyfgUt11ggbkiIiRTZ2xGDTFGsDsC8qXhsS+kj8jA==
Message-ID: <3a3644f2-6c0d-47db-99f4-0f61b4257902@bootlin.com>
Date: Wed, 25 Oct 2023 12:19:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Marta Rybczynska <marta.rybczynska@syslinbit.com>,
 docs@lists.yoctoproject.org
Subject: Re: [PATCH v2][docs] dev--manual: add security team processes
Content-Language: en-US
To: Marta Rybczynska <rybczynska@gmail.com>
References: <20231020143928.1700522-1-rybczynska@gmail.com>
 <2638fa02-b0d9-4d5e-9203-94623f065586@bootlin.com>
 <CAApg2=S2U6ryg68cvXtVDPJOHvNMMQu9pRwJuXm40fx+0M51Fw@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CAApg2=S2U6ryg68cvXtVDPJOHvNMMQu9pRwJuXm40fx+0M51Fw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 25 Oct 2023 10:20:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4496

Hi Marta,

Thanks for the updates in the V3. Replying to your last question...

On 23.10.23 at 20:38, Marta Rybczynska wrote:
> +Current Security Team members
>>> +-----------------------------
>>> +
>>> +For secure communications, please send your messages encrypted using the GPG
>>> +keys. Remember, message headers are not encrypted so do not include sensitive
>>> +information in the subject line.
>>> +
>>> +  -  Ross Burton <ross@burtonini.com> `Public key <https://keys.openpgp.org/search?q=ross%40burtonini.com>`__
>>> +
>>> +  -  Michael Halstead <mhalstead [at] linuxfoundation [dot] org>
>>> +     `Public key <https://pgp.mit.edu/pks/lookup?op=vindex&search=0x3373170601861969>`__
>>> +     or `Public key <https://keyserver.ubuntu.com/pks/lookup?op=get&search=0xd1f2407285e571ed12a407a73373170601861969>`__
>>> +
>>> +  -  Richard Purdie <richard.purdie@linuxfoundation.org> `Public key <https://keys.openpgp.org/search?q=richard.purdie%40linuxfoundation.org>`__
>>> +
>>> +  -  Marta Rybczynska <marta DOT rybczynska [at] syslinbit [dot] com> `Public key <https://keys.openpgp.org/search?q=marta.rybczynska@syslinbit.com>`__
>>> +
>>> +  -  Steve Sakoman <steve [at] sakoman [dot] com> `Public key <https://keys.openpgp.org/search?q=steve%40sakoman.com>`__
>> Maybe add a ":" character right after each name?
>> That's all I have. Thanks for the quality of this document!
> Not sure about it. I was wondering, however, about showing key
> fingerprint directly.
> That would mean, however, that LTS documentation will require changes
> in that regard
> (key expiration is typically 1 or 2 years). What do you think?

I've go no strong opinion here, but its probably safer to have the key 
fingerprints, right? Or maybe the a link with the fingerprint as text 
and the URL as target? This way, you have a confirmation of the key in 
the docs, and in case it gets out of date, there's a link to find an update.

Thanks in advance for the V4 update taking Quentin and Robert's comments 
into account.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


