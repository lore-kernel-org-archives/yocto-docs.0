Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E02B7C433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 11:12:21 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.5663.1641899540352353166
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Jan 2022 03:12:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id DC4DA24000C;
	Tue, 11 Jan 2022 11:12:17 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] No more nightly builds?
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>
References: <69f31ad6-7e08-29de-8dc7-8dc575eb134c@bootlin.com>
 <a47ff8d8a5f6bd8cd0454b01d5291010aaca7d91.camel@linuxfoundation.org>
 <87033aaa-0893-b2a9-96cc-d7ebd59bcccc@bootlin.com>
 <3b82d9590897c50ad54ff22137cb7163b26267ce.camel@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <0694d983-509f-61ea-ddaf-e97835ecf678@bootlin.com>
Date: Tue, 11 Jan 2022 12:12:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: 
 <3b82d9590897c50ad54ff22137cb7163b26267ce.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Jan 2022 11:12:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2377


On 1/11/22 12:09 PM, Richard Purdie wrote:
> On Tue, 2022-01-11 at 12:01 +0100, Michael Opdenacker wrote:
>> Hi Richard,
>>
>> On 1/11/22 11:41 AM, Richard Purdie wrote:
>>> On Tue, 2022-01-11 at 10:47 +0100, Michael Opdenacker wrote:
>>>> Greetings,
>>>>
>>>> Do we still have nightly builds? I cannot find them anywhere, but the
>>>> documentation still refer to a broken location
>>>> (https://autobuilder.yocto.io/pub/nightly/).
>>> We do run them but they're "a-quick" six nights a week with an "a-full" on a
>>> weekend. The results of all non-release builds go here:
>>>
>>> https://autobuilder.yocto.io/pub/non-release/
>>>
>>> The "nightly" builds don't produce shared artefacts any more, just test result
>>> files and reports.
>>
>> Right. So the documentation can stop referring to them as a way to get
>> the latest code.
> I think it should be replaced with something about "latest test results"?

Maybe, but then in the test manual, because the section referring to
nightly builds about getting Yocto Project code
(https://docs.yoctoproject.org/dev-manual/start.html#locating-yocto-project-source-files).

Thanks

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


