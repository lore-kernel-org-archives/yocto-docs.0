Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C0B5C433EF
	for <webhook@archiver.kernel.org>; Fri,  1 Oct 2021 17:55:55 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web12.935.1633110953349667683
 for <docs@lists.yoctoproject.org>;
 Fri, 01 Oct 2021 10:55:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 0431C240006;
	Fri,  1 Oct 2021 17:55:50 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] overview-manual: delete bad backslashes in
 SSTATE_MIRRORS example
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <75d586c4-dacf-ee38-13ad-6ab39d69b175@crashcourse.ca>
 <20210928085519.fuwlekowkuielyfl@fedora>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <c8f6bed3-0792-bd11-bfb9-13e744981996@bootlin.com>
Date: Fri, 1 Oct 2021 19:55:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210928085519.fuwlekowkuielyfl@fedora>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 01 Oct 2021 17:55:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1908

Robert, Quentin,

Thank you for the patch (good catch) and review.

On 9/28/21 10:55 AM, Quentin Schulz wrote:
> Hi Robert,
>
> On Tue, Sep 28, 2021 at 04:53:03AM -0400, Robert P. J. Day wrote:
>> Two inappropriate backslashes in the example for setting
>> SSTATE_MIRRORS are apparently the result of an error by the
>> transmogrification script for migrating XML to rST.
>>
>> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>>
> Reviewed-by: Quentin Schulz <foss@0leil.net>


Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
and merged into master-next.

Thanks again,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


