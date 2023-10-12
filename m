Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50147CDB46E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 18:34:14 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.20576.1697135649727216049
 for <docs@lists.yoctoproject.org>;
 Thu, 12 Oct 2023 11:34:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Mr74Kp1R;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Transfer-Encoding:Content-Type:
	Message-ID:Subject:To:From:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=a5fLH84n51rZ1nnp2suPX2BStQW/8ITcotr1Xo7iih0=; b=Mr74Kp1RtWN/RBBx/Tx6u1cWyk
	TtH14J6A4AlbvjvxNbs5qqJCefrahLp2gveMqopyi5wGyvM6cZPXSdQIhz/1+zeDrNf1QONbyVcYx
	tvuaktCpEaraRQhJ0sjVDGSlJtnKiV9iR93uZh6SqTgPVlpfx4iStgatXcgaKmC51NgUTfFkEePo8
	Sb3rh+hQy2IlEQO9puevqBpfMgej+8jrRianpq+xOygS76/umi9oN6lH/T/kVW8ZkwhI5+bs89jnt
	Dpw+S4G9UJtuZB0AbI5tVJ+mg5hmeVQu3cO1P0fjBdGcZTFhaov0SM2ubfBOAEfPfbYTO8TGI+aOc
	5nI4FJAg==;
Received: from [::1] (port=53176 helo=cpanel10.indieserve.net)
	by cpanel10.indieserve.net with esmtpa (Exim 4.96.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1qr0VZ-009fVz-2A
	for docs@lists.yoctoproject.org;
	Thu, 12 Oct 2023 14:34:07 -0400
MIME-Version: 1.0
Date: Thu, 12 Oct 2023 14:34:06 -0400
From: rpjday@crashcourse.ca
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: should "Enabling System Services" mention mdev-busybox?
User-Agent: Roundcube Webmail/1.6.0
Message-ID: <9f9e7b9d8ecf711a3825a081b8cf030a@crashcourse.ca>
X-Sender: rpjday@crashcourse.ca
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday@crashcourse.ca
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 12 Oct 2023 18:34:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4364

Here:

https://docs.yoctoproject.org/dev-manual/new-recipe.html#enabling-system-services

the two methods for starting system services are listged as SysVinit and 
systemd.
but the INIT_MANAGER variable also accepts "mdev-busybox" as another 
init manager,
should that be mentioned in that section as well? or am i misreading?

rday

