Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A5E4C43458
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 18:17:41 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4410.1783448252583762758
 for <docs@lists.yoctoproject.org>;
 Tue, 07 Jul 2026 11:17:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=YiS8rhmO;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tBFKleFs98q17D1Apx6Ha2prF6Meue4JXMN9L9n/iI0=; b=YiS8rhmOSBIYs+mzC37U6DPuqJ
	yJIQlSUjsoDdQWzci0s/zix6Lt1XjreGRMBlAjghTF0VxpdDvOyilG3dTFTL6IFTu6lvzG9Z8wMto
	Hyq5NJATuABn+zWIYmzZ7l3XBvHsIcEz30R9+0pMi2r5+mj236y58gKQUALXDnQwM1HwVNxPqM+2l
	E1lEU0FWpY5/CnmwIdfZvmmaCS2+0MBsTw7uw9doxQx1ZyRfx93vFVcsz/8E/XynDbQvKR2877ysI
	7TLfvn6moEV7SQbrPe1o+39kso4DqJF2rqx43YUpCyp0X3/x/M3AR6Ez/sbX4ZgcWOPNZVflB//Ic
	lRzjFGTg==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:36164 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1whAML-00000001Jar-1wOR
	for docs@lists.yoctoproject.org;
	Tue, 07 Jul 2026 14:17:30 -0400
Date: Tue, 7 Jul 2026 14:17:01 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: seems like KERNEL_DEPLOYSUBDIR should be in the variable glossary
Message-ID: <f2c698db-6a2b-1004-5819-8030db985d08@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 07 Jul 2026 18:17:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10039


  i can add an entry but i'm not sure of the best explanation for it.
would someone like to suggest one?

rday

