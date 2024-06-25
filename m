Return-Path: <michael@opdenacker.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDCBFC3064D
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 15:45:19 +0000 (UTC)
Received: from sender-op-o11.zoho.eu (sender-op-o11.zoho.eu [136.143.169.11])
 by mx.groups.io with SMTP id smtpd.web10.177161.1719330312357888536
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Jun 2024 08:45:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=michael@opdenacker.org header.s=zmail header.b=gSwuhRkC;
 spf=pass (domain: opdenacker.org, ip: 136.143.169.11, mailfrom: michael@opdenacker.org)
ARC-Seal: i=1; a=rsa-sha256; t=1719330299; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=Yj1zzqlqJlfWr9FTJErH3HdzSvsUZIEYpzXzyvAfdIpKh6/dIXUqHcN/cI7euIrnfvkRW1LeGCBLOJEinl5vJQ/17k1CpWZY/JUAVFP38YULuQGxb01OAYzQBpcNfvxOMcvCsKfpd7mxArfObMV9kJyj8JTyx1bJopFqP2dz6HM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1719330299; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cJqPy0i8TGtJ26yFoNSgwckp+0nibnDmZ+1Lhfndo6w=; 
	b=EJ00qY/V1bpqtyD5W0quZlK9pExA5DrNTHi8XbkGNVPWa2c1D4kbzIJafaHNGRj5wIooUzQI4OpUO9XujZ7rBy/Mfhp+bBtt2tnqx2uugtenk6QujZl+oNGTlpUKoTJ3Gz2CUt77hlC58Yg1wLamDTYcfCmx3+/wOdQ93c/a/H8=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=opdenacker.org;
	spf=pass  smtp.mailfrom=michael@opdenacker.org;
	dmarc=pass header.from=<michael@opdenacker.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1719330299;
	s=zmail; d=opdenacker.org; i=michael@opdenacker.org;
	h=Message-ID:Date:Date:MIME-Version:Cc:Cc:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=cJqPy0i8TGtJ26yFoNSgwckp+0nibnDmZ+1Lhfndo6w=;
	b=gSwuhRkC/E16LUOEpltVSLh+71uP5hgwACwWMe/uOc9D4Cmd7YLi1f16y9uPYZ8h
	SqXcJBPRYSZ00f2BJM37vsHeAkhPw22r8fl2pKQ/eXpOFwWPfpOCDcvM+IGj32e+zIA
	8JsmU4KcxDFqouXX8Z+83axrwdATfcG8c6ZEmsDg=
Received: by mx.zoho.eu with SMTPS id 171933029844177.59582708882886;
	Tue, 25 Jun 2024 17:44:58 +0200 (CEST)
Message-ID: <bca468ae-1df4-4ff6-9b9e-16697ace29f2@opdenacker.org>
Date: Tue, 25 Jun 2024 17:44:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Alexander Kanavin <alex@linutronix.de>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual: rename RECIPE_UPDATE_EXTRA_TASKS ->
 RECIPE_UPGRADE_EXTRA_TASKS
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20240621104312.2842778-1-alex@linutronix.de>
Content-Language: en-US
From: Michael Opdenacker <michael@opdenacker.org>
In-Reply-To: <20240621104312.2842778-1-alex@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Jun 2024 15:45:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5304

Hi Alex,

On 6/21/24 12:43, Alexander Kanavin wrote:
> This follows the variable rename in oe-core.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   documentation/ref-manual/variables.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 16b449d6b..c0cc8fb33 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -7086,7 +7086,7 @@ system and gives an overview of their function and contents.
>         The default value is ``"${WORKDIR}/recipe-sysroot-native"``.
>         Do not modify it.
>   
> -   :term:`RECIPE_UPDATE_EXTRA_TASKS`
> +   :term:`RECIPE_UPGRADE_EXTRA_TASKS`
>         For some recipes, after the new source has been unpacked, additional tasks
>         may need to be run during an upgrade. A good example of this is recipes
>         which inherit :ref:`ref-classes-cargo-update-recipe-crates`, where the


Thanks for the patch!
However, I don't see the change in OE-Core yet. So, it's too early to 
merge this one :)
Cheers
Michael.


