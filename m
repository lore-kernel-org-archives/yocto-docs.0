Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E2F9CCF9E3
	for <webhook@archiver.kernel.org>; Sat, 25 Oct 2025 10:07:34 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.2729.1761386852004178362
 for <docs@lists.yoctoproject.org>;
 Sat, 25 Oct 2025 03:07:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=KN8A3XH0;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ai4WhByF+nUeHlbk0xbPcALBdaWBXAWj7u9EZ1Z1lGY=; b=KN8A3XH0Ar8Pd/lxPU5TzKBNTS
	ukawhtX9B78gaIkjvsWNkfTV/xPmkiYyAp3ltF3C/aVoLINZtCn0gOow3D2gdfM9nfk8A/NTiyl1u
	L3wDHYalrpcIUyfHuOU+mnJaRkaNmEp8zEacWkCcbJmSFLTQOvHliqpRtMig2zfK6Fn9/pgI/16tP
	0sI+Hadnmj1VLiHmX7ZklEhdr7zGE9mKsC/vC8pwe7TNv8+8YAcGVwBZRFNNaAo/Z5ZzJjX2fZGxP
	1n1AQEq+8sUtF+24T3wfbMOlVjwu/FDaob06ozD8/jC0fqW4XBu3zz5QCM6PI7Vn3buTMnHOmE3XI
	aZ/4cVTA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:52482 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vCbBG-00000001r59-0FwL
	for docs@lists.yoctoproject.org;
	Sat, 25 Oct 2025 06:07:30 -0400
Date: Sat, 25 Oct 2025 06:10:07 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: can you apply back quotes to something already tagged with
 ":ref:"??
Message-ID: <03001043-f0eb-c151-d69f-ffe409969902@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Sat, 25 Oct 2025 10:07:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7840


  just noticed the following in dev manual, "layers" chapter, where it
*appears* that someone is trying to render as monospaced the utility
name 'bitbake-layers' inside that ":ref:"

   layer-creation tools, see the
   ":ref:`bsp-guide/bsp:creating a new bsp layer using the \`\`bitbake-layers\`\` script`"
   section in the Yocto Project Board Support Package (BSP) Developer's
   Guide and the ":ref:`dev-manual/layers:creating a general layer using the \`\`bitbake-layers\`\` script`"
   section further down in this manual.

Notice the backslash escaping of back quotes that suggest this is an
attempt to render as monospaced, but that doesn't seem to do that, as
you can see:

https://docs.yoctoproject.org/dev-manual/layers.html#creating-your-own-layer

or is that trying to do something different?

rday

