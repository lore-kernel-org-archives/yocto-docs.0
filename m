Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D85CC4332F
	for <webhook@archiver.kernel.org>; Sun, 16 Oct 2022 20:38:38 +0000 (UTC)
Received: from mail-49-r22.ipv4.per01.ds.network (mail-49-r22.ipv4.per01.ds.network [27.123.26.153])
 by mx.groups.io with SMTP id smtpd.web12.33839.1665952711876884413
 for <docs@lists.yoctoproject.org>;
 Sun, 16 Oct 2022 13:38:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@softec.co.nz header.s=default header.b=Z6cZYqjI;
 spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 27.123.26.153, mailfrom: bluelightning@bluelightning.org)
Received: from server-72-r70.ipv4.per01.ds.network (cp-fp06.syd02.ds.network [122.201.124.108])
	by halon-out01.au.ds.network (Halon) with ESMTPS
	id 0dab3946-4d93-11ed-89ae-f8db88ea9a09;
	Mon, 17 Oct 2022 04:42:30 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=softec.co.nz; s=default; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DNOSx8WC/RUCQS8lP9TKxd0W1EZNewWs4A7ZsctHlkM=; b=Z6cZYqjIadOHMyzf9mtWL4XIHP
	0DZQoPNc4NuFbR5QObo6KXTGt3fCBTQpH6RGT3+lkAS8PnbelXybAagUbcFZ/KhiAqdX274CD5ZOR
	fLro4ZKw86LlW3KRD20/HqavQzqE4mwjSJ4EK3RVC1VOmsdLYew3C/C6GHaT7qslxBpOUGMr2Krhl
	Ji9qIdneAQgyZwBupXJbs8jyGT1flyyJjJZWeN1thJivrHeaO1LbLQdIeBwDwS8YQTnZ+wrLEU1HR
	z6sNz63tj9/pBl/jFH0MEvpe5RdwiCXcy886HGhcT2wb+PHEdzXlzIqW4ZCIDAixfVD7PrEOqJaUH
	qB/qcYlQ==;
Received: from [151.210.143.155] (port=6450 helo=linc.localnet)
	by cp-fp06.syd02.ds.network with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <bluelightning@bluelightning.org>)
	id 1okAOw-0005Hv-C2;
	Mon, 17 Oct 2022 09:38:26 +1300
From: Paul Eggleton <bluelightning@bluelightning.org>
To: docs@lists.yoctoproject.org, michael.opdenacker@bootlin.com
Subject: Re: [docs] [PATCH 13/34] ref-manual: add pressure limit variable documentation
Date: Mon, 17 Oct 2022 09:38:25 +1300
Message-ID: <4749032.GXAFRqVoOG@linc>
In-Reply-To: <936247d7-5cb0-2ec3-1a3e-15aa647d53c3@bootlin.com>
References: <cover.1665392835.git.paul.eggleton@linux.microsoft.com> <d0e6b7661912a5aeedc3e193ff76982cb0fc8dc1.1665392835.git.paul.eggleton@linux.microsoft.com> <936247d7-5cb0-2ec3-1a3e-15aa647d53c3@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp-fp06.syd02.ds.network
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - bluelightning.org
X-Get-Message-Sender-Via: cp-fp06.syd02.ds.network: authenticated_id: paul@softec.co.nz
X-Authenticated-Sender: cp-fp06.syd02.ds.network: paul@softec.co.nz
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 16 Oct 2022 20:38:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3364

On Tuesday, 11 October 2022 23:30:50 NZDT Michael Opdenacker via 
lists.yoctoproject.org wrote:
> Actually, these have recently been accepted in the BitBake manual (the
> patches from Aryaman got accepted after he left WindRiver), though
> apparently with fewer details:
> https://git.openembedded.org/bitbake/commit/?id=c014281f72f4f54ec8e681ef2b8e
> 1080de9ab5cf
> 
> Shall we submit your updates to the Bitbake manual instead? This way, we
> don't have these variables documented in two different places.

Ah, oops - I missed that. I'm OK with that for now; however, and I may have 
also missed if this has been discussed recently, but it's my opinion that all 
variables documented in the BitBake manual should also be in the Yocto 
reference manual, since they are two different contexts - the catch being that 
for some variables there is information you can't reasonably include in the 
bitbake manual since it relies on some definitions unique to OE so the entries 
can't always be copied exactly. If on the other hand some variables only 
appear in the BitBake manual, there will be people who just won't find them. 

To avoid things getting out of sync, we could potentially have a script that 
would check for and report on variables present in the  BitBake manual that 
aren't in the Yocto reference manual. I'd be happy to write such a script.

Cheers
Paul



