Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD14AC433FE
	for <webhook@archiver.kernel.org>; Fri,  8 Oct 2021 15:09:01 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web08.10672.1633705739921273323
 for <docs@lists.yoctoproject.org>;
 Fri, 08 Oct 2021 08:09:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 2FC73200009;
	Fri,  8 Oct 2021 15:08:57 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] dev-manual: warn about license compliance issues
 when static libraries are used
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <20211006084455.953350-1-michael.opdenacker@bootlin.com>
 <20211007111620.lhlixpna3caovrd7@fedora>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <654c81a8-8932-10d3-d6f9-adc9bc03829b@bootlin.com>
Date: Fri, 8 Oct 2021 17:08:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211007111620.lhlixpna3caovrd7@fedora>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 08 Oct 2021 15:09:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1971

Hi Quentin,

Many thanks for the review.

On 10/7/21 1:16 PM, Quentin Schulz wrote:
> Hi Michael,
>
> On Wed, Oct 06, 2021 at 10:44:55AM +0200, Michael Opdenacker wrote:
>> This partly addresses [YOCTO #14407]
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>> ---
>>  documentation/dev-manual/common-tasks.rst | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>
>> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
>> index b81f51bf83..2c862dc1be 100644
>> --- a/documentation/dev-manual/common-tasks.rst
>> +++ b/documentation/dev-manual/common-tasks.rst
>> @@ -11158,6 +11158,23 @@ this function, you have to follow the following steps:
>>  For more usage information refer to :yocto_git:`the meta-spdxscanner repository
>>  </meta-spdxscanner/>`.
>>  
>> +Compliance Limitations with Executables Built from Static Libraries
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +When package A is added to an image (``RDEPENDS += "A"``), and depends on
> RDEPENDS does not exist as is.
>
> If I may suggest:
>
> s/``RDEPENDS += "A"``/via :term:`RDEPENDS` or :term:`RRECOMMENDS`
> mechanism as well as explicitly included in the image recipe with
> :term:`IMAGE_INSTALL`/
>
> ?
>> +a static linked library package B (``DEPENDS += "B"``), package B will neither
> For the first occurrence:
> s/package B/recipe B/
>
>> +appear in the generated license manifest nor in the source tarballs generated
>> +by the archiving class. This occurs as the licensing and archiving classes
> s/archiving/:ref:`archiver <ref-classes-archiver>`/
> s/licensing/:ref:`license <ref-classes-license>`/
>
>> +assume that only packages included via :term:`RDEPENDS` end up in the image.
>> +
> + or :term:`RRECOMMENDS` ?


It all makes sense. I will include the changes that you propose.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


