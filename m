Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EE11C433FE
	for <webhook@archiver.kernel.org>; Fri, 14 Oct 2022 09:08:17 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web08.5174.1665738496244164846
 for <docs@lists.yoctoproject.org>;
 Fri, 14 Oct 2022 02:08:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=j0K75XZ2;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id CF9F8C0009;
	Fri, 14 Oct 2022 09:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1665738494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y1d+4Ku9TTEAFZgce+usO66aWFqz+K6rcuCQjfpnHBE=;
	b=j0K75XZ2JUU3WXCNEocrylhcJfjlYqqoxi51Gpsz9FMuuYnWnRjYdG/9zCt0CHHYBj79W1
	4WscOYBlvpCq0sx0Qy4VXVXbscFEWmjQj04TDyr3GTVBgcMlicUEuNkr4QgyP/fqVUAFhF
	eRLoCYPd66JMktKEwcUjJhiwTNSpU+AKvvv8a7odaoZKhbkpIfY3hqUp3LR4feUXoj+jKY
	XEkiWTSp14X2O2baol82aa0IaBJQZ9flyqUf+af7cny5MND8reOAPUYxC74/9Se1OnfGWu
	v4soA7RzK6F7pl+Ilf4Peyj/mANdmh9bZt8TYhQ0pTNx4Crse5u64uG6R0qoRw==
Message-ID: <97d4a93f-e7e8-ab5d-b9e6-d809c4057f27@bootlin.com>
Date: Fri, 14 Oct 2022 11:08:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] RFC: stop advising to build from the source
 directory
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20221013093349.2967708-1-michael.opdenacker@bootlin.com>
 <CANNYZj8c5XDjYTD4Ec47tGdRECd454qDBniJGs2RH8R=PYQONA@mail.gmail.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CANNYZj8c5XDjYTD4Ec47tGdRECd454qDBniJGs2RH8R=PYQONA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 14 Oct 2022 09:08:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3362

Hi Alex,

On 10/13/22 11:44, Alexander Kanavin wrote:
> I would wait until the proposed oe-setup-build tool lands in master,
> and then adjust the documentation to recommend that to set up builds.
>
> The tool already does what you suggest, e.g. makes sensible choices
> for build directories, and without requiring users to make those
> decisions.
> Do you have a moment to review that?
> https://git.yoctoproject.org/poky-contrib/commit/?h=akanavin/package-version-updates&id=7659896ce5ea0bfea3a2c04b83915a48f70a5af9

Thanks for these details. Then the timing is perfect.

I missed these interesting discussions and I'm excited to test what will 
land in master and propose updates to the documentation.

Thanks again!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


