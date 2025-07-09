Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0FA4C83F03
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 13:31:24 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.15995.1752067883116701511
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Jul 2025 06:31:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=k2Tq/6GC;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=96Xg+TdcNsdZsOkQ4H3GB78UsWjOyvPCt2NUQ1dopJI=; b=k2Tq/6GCVVrBJGjGx6ne1JH9Y7
	zbetw/EOHBoBbkD6E/tcPdN3B493U1zbdU5J9FUk7yF4ELyzFPnZwQaMPb3yC0aO3JyFsn5pD0doe
	dYtwvwAjzO+IDnDiIzwfaZHKbIG2sB/97ojeBHKV3KMyhOeYE91JiGKCRnI0eAUG/C5Lppwlmnih9
	LqpV+ccQpxlX/XItE0LNwQWqy2g7jMvr0WXBxchOtvgy+seEAHWRvjH1RFBRsXVUfFp5Fty+hf5G8
	ylJQbMNi0buTbvU3ZD4OK3j9lNSHK8kbzB+ucE/6P9n5POt9Xm6a72ZgvhAoEV3X6o1DtRa4mfzmi
	HL2vANwQ==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:58930 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uZUtL-0000000ApBp-0Vsu
	for docs@lists.yoctoproject.org;
	Wed, 09 Jul 2025 09:31:22 -0400
Date: Wed, 9 Jul 2025 09:31:16 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: more docs curiosity: "inherit_defer" in the BB manual
Message-ID: <764e27fc-0e53-777a-3427-4989e8d79403@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Jul 2025 13:31:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7295


here:

https://docs.yoctoproject.org/bitbake/2.12/bitbake-user-manual/bitbake-user-manual-metadata.html#inherit-defer-directive

that section strongly suggests that the sole reason to use
"inherit_defer" is that you want to inherit some class, but you're not
sure which class *yet*, so you use a variable that will, at some
point, be set before parsing is complete. or possibly it will involve
a programmatic condition.

  so what is the purpose of using "inherit_defer" on a fixed bbclass
name such as this?

https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/qemu/qemu-native.inc#n3

what is the rationale of inherit_defer'ing a fixed class name? or is
there more to this that i'm missing?

rday

