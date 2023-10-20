Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39843CDB47E
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 10:01:37 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.50832.1697796091585823606
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Oct 2023 03:01:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SSpKEBQu;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 07D5FC0006;
	Fri, 20 Oct 2023 10:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697796089;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sh9s+I5YsEJSrPJURmDFurQFEkfeiheo6rU1Sab4XCM=;
	b=SSpKEBQuBO7DlZ1Q0h6Cdj/cmoOqbPFF7cU9J3g36fNN6kKdCYC/Chk6lxPVMxHbcsw2WH
	dNrPWUXBjMtGgtJ9E0J6DDyaZSV38iysJddl37WGamWr7YF1K6BROJnMeozYmuD7LM5AdY
	O4XPhkU6mx3b9BP8DaBq1pY32qmkEC6PGzs2dl1ASDoYhMgLhEL9ADK8YP3Re6TU/gdZDb
	xAj5iMs0uQ/KUifN12yhhgVUCel5np3wcdYHl+3EZ7pMY0pBfvpO8SF7eJngI8KRPRC+of
	sUQk4nTdwVDqW7n6/4nua2ivmRgKrmx2oQOI0qnwLLC75g8tnhwNf4a/3Pt9BQ==
Message-ID: <97e746a8-a06f-4d5f-a38a-25517715e3f7@bootlin.com>
Date: Fri, 20 Oct 2023 12:01:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 3/3] ref-manual: variables: Add example for
 SYSROOT_DIRS variable
Content-Language: en-US
To: BELHADJ SALEM Talel <bhstalel@gmail.com>
References: <20231019214827.405886-1-bhstalel@gmail.com>
 <20231019214827.405886-3-bhstalel@gmail.com>
 <31f06229-46de-460d-bba4-1e86d64a19f8@bootlin.com>
 <CAOgG7m0UHphZCqHXJ0VmKLEJacQZzGxz4jtqDoA_ERLdyDvv2Q@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CAOgG7m0UHphZCqHXJ0VmKLEJacQZzGxz4jtqDoA_ERLdyDvv2Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Oct 2023 10:01:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4441


On 20.10.23 at 11:44, BELHADJ SALEM Talel wrote:
> Hello Michael,
>
> For the moment, when fixing a patch, I send the patch again without 
> adding "Reviewed-by", is it necessary?

Well, speaking in general, if you happen to send a updated patch series, 
you could add the "Reviewed-by" lines that you received, but only for 
the patches that were not modified since they were reviewed.

> And also, is it necessary to send all patches again even if one of 
> them is good?

No sure here, unless the series were sent a while ago. At least it 
doesn't hurt to resend, and it makes it easier to have complete series 
for people reading the mailing list archives to review the patches.

Happy to help you help the project!
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


