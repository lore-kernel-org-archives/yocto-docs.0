Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF85FC4332F
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 14:10:13 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.1939.1670595005004782165
 for <docs@lists.yoctoproject.org>;
 Fri, 09 Dec 2022 06:10:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OerKQlDm;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D0061FF806;
	Fri,  9 Dec 2022 14:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670595003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HkZxeRAgIelKuNHmfu6SjQ6kzjrCQUBsO4ZHiIgyBvQ=;
	b=OerKQlDm4nntrKx8DGCkxb/GTqIZubvYJf7QhgXwe5NRWXDFPm0koxH+PTHUGHb39mOzVr
	v46AzpSSmMujabegePgTEb37WFGUA9BMD43BN8HubUnLKmKet+W98VDyZFFwgMn1bnOMKL
	kmJW7lEURfGUpXzlXUHeapzCDhsL6VPBulSEpkaqAxcRVGU3t+U59zGEYg8vIAUmY00XcY
	es17BJXtVrz5ZjX8GcV2XlqZ4UL9IJJdFrFMF0K4p3eixK6VmcXTMfQaVsbJkjUw1BBzYx
	OIIyoPufb5kXuQejZweryKn0vWg4iqqBboPEawmfCA5k76kb4ilJ+eQVbzOPAw==
Message-ID: <d4dc8d7b-7e14-ad0e-d8fa-212dad907f60@bootlin.com>
Date: Fri, 9 Dec 2022 15:10:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual/resources.rst: fix formating
Content-Language: en-US
To: quentin.schulz@theobroma-systems.com
References: <20221208145320.17779-1-michael.opdenacker@bootlin.com>
 <21358247-dfd7-abd0-713e-85690fd8d632@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <21358247-dfd7-abd0-713e-85690fd8d632@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 09 Dec 2022 14:10:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3537

Hi Quentin

Thanks for the review.

Am 09.12.22 um 11:01 schrieb Quentin Schulz via lists.yoctoproject.org:
> Hi Michael,
>
> On 12/8/22 15:53, Michael Opdenacker via lists.yoctoproject.org wrote:
>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>
>> Simplify formating for better looking output.
>> For example, mosts paragraphs had only ther ":" character in boldface.
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>> ---
>>   documentation/ref-manual/resources.rst | 42 +++++++++++++-------------
>>   1 file changed, 21 insertions(+), 21 deletions(-)
>>
>> diff --git a/documentation/ref-manual/resources.rst 
>> b/documentation/ref-manual/resources.rst
>> index c737cba912..fd4aed0164 100644
>> --- a/documentation/ref-manual/resources.rst
>> +++ b/documentation/ref-manual/resources.rst
>> @@ -104,93 +104,93 @@ Links and Related Documentation
>>     Here is a list of resources you might find helpful:
>>   --  :yocto_home:`The Yocto Project Website <>`\ *:* The home site
>> +-  :yocto_home:`The Yocto Project Website <>`: The home site
>
> Did you test this?
>
> I remember there's some weird things happending after directives where 
> you might need to add a space before the next character (hence why you 
> need to escape it so that it doesn't appear in the final output).


I've just double checked again, and the output looks good, at least in 
this case.
Thanks anyway, I could have overlooked an issue.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


