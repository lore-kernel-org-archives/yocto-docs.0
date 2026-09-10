Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4EFCC79F9F
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 12:59:33 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13386.1789045171540158580
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Sep 2026 05:59:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=GBGKuWNP;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=iwbz1ZjbsTlW0D86xfbCou6tox5cWgC0QdnF83wdmtg=; b=GBGKuWNP/l5kufb6G+PrFMrdGf
	hheJaL8kNWMMQBxRgxFGgrNpTADEYiW6yloWVMOccYXewiZinumzvdf4bVAuqozsIrjULT3FUolm2
	xLmA6FusI9feAsuInQDgchKIoB+O+mihOfH2iekXT7bTkdI6gTOEpJ1+Kjl/9JjEP/inQo0/JLLkA
	76v8VsGzcZn+n7g7Ri48UkEMXOf/aZ9vC7Nxi+X48Eu69+Tq0ivdLxG0EpxboWT1tUu4B8xd3DRRi
	R1OsdiOXyJxb0XvYkTb0DLyLzqnq6GJRtbxwtXDsv06xhan+zsUjRgA64htHmvZ8K/8KfEU+1/Sjs
	9GQzwFRA==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:41884 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1x4eNE-00000000f6C-1Vl8
	for docs@lists.yoctoproject.org;
	Thu, 10 Sep 2026 08:59:29 -0400
Date: Thu, 10 Sep 2026 08:57:27 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Does Ubuntu 24.04 and newer still require AppArmor tweaking to run
 bitbake?
Message-ID: <ec2658dc-005e-f6cc-d64e-0a1c15e992a7@crashcourse.ca>
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
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 10 Sep 2026 12:59:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10448


  I use stock Debian so I haven't needed to mess with this, but Ubuntu
once had this issue with AppArmor:

https://developerwiki.proventusnova.com/Error:_BitBake_+_AppArmor_User_Namespace_Restriction_Fix

If that's still a problem, it doesn't seem to be mentioned in the
docs.

rday

