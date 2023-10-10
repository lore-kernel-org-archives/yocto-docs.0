Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3168CD690A
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 08:39:16 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.86556.1696927146069580068
 for <docs@lists.yoctoproject.org>;
 Tue, 10 Oct 2023 01:39:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cvQzqLNU;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DC6FF1BF205;
	Tue, 10 Oct 2023 08:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696927144;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2T1gFLVzd9Zhg8kRcN1duFUyHT1vnm5XXsJ88BXmk/I=;
	b=cvQzqLNU/zpILp7Oj1lCZAoCAAxU+RHD8zh/3kwMzOht//BzjWbdohcb+R4q8wLfaAJDkY
	Hu5WYtHN9NrE1bVkTrAJWRAIUoXmNCbBO0t15xbXIeAisKdQ8vyK8488QYRZS96dS5BwVN
	1J+JNTl/C6HJX3Uw7JqU8kZwiclVcvX3FURVjC9vdgG8gW/eao5hGs9uOT87mKh9SaA19J
	1I2jzPlIptaYq4At83cR4K5hyKSiTNFRoxEnQVhKOJXrOTE/fUKtCvpBv/9ez9eQhlPp0N
	IHI1f05O1H2xW6FRVI7jgRy13JtrYShHdX0lfbHwjRN3b9f6OcLbIJ0VXDar/w==
Message-ID: <1a48de66-a431-451f-ad28-70879392ffe9@bootlin.com>
Date: Tue, 10 Oct 2023 10:39:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] does PACKAGE_EXCLUDE not handle .deb packages?
Content-Language: en-US
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <929b18be-e9ac-ad9-b8b2-36f95834834a@crashcourse.ca>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <929b18be-e9ac-ad9-b8b2-36f95834834a@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 10 Oct 2023 08:39:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4334

Hi Robert

On 09.10.23 at 07:33, Robert P. J. Day wrote:
>    from
> https://docs.yoctoproject.org/ref-manual/variables.html#term-PACKAGE_EXCLUDE:
>
> "This variable is supported only when using the IPK and RPM packaging
> backends. DEB is not supported."
>
>    i just tried it with .deb packages and it *appears* to work.
> thoughts?


Funny, I came across this paragraph last week. Thanks for testing!
Indeed, the code seems to support this.
Shall we change the docs if nobody objects?

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


