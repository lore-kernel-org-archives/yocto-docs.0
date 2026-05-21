Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8A81CD4F5E
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 10:35:28 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33573.1779359724414219508
 for <docs@lists.yoctoproject.org>;
 Thu, 21 May 2026 03:35:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=DBrT5BhH;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lKag5Sd+VG3AYdjPhcSOF3rgOlcUioyMW0Gygj3Np/o=; b=DBrT5BhHTgaiEVk1fngxDt44d5
	ltDT2OrtFISJLhWTPf7n2RUHPqe+SsLrZ4TWefCKGt2eJWZX8r+BZz8QPkVQXOIumRjYfdOAVQXkd
	ZbmQMZPSFfB/JLX+tn03rOXMhKbog5uv8RXny0yGfFhAA/bis1/UB2jbYLhSklrcpfbQ20V5QT52Z
	XywU0EK1srfO00jWeKVnk05dauGI9KfYNOwDdrqStV/2g8Qtr9BNZpcBGL3Rn4Dp7+ZFpeMISclCq
	ByGCvW8xb8j2cgeOSOpS/gOUiafxbj0MmdjTFRsRMoHOkvB/yD/prxB5HosGEXpCXWy+MrYJcJW91
	Ye9MuewA==;
Received: from [147.129.179.166] (port=32940 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wQ0kF-00000002M22-2Dus
	for docs@lists.yoctoproject.org;
	Thu, 21 May 2026 06:35:23 -0400
Date: Thu, 21 May 2026 06:38:39 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: should [BSP] docs "README" refs be updated to "README.md"?
Message-ID: <9fabfde7-d930-8baa-751f-491e957766e6@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 21 May 2026 10:35:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9514


  possibly not worth the churn but is there any value in updating the
BSP guide so that references to the BSP layer "README" file be changed
to refer to "README.md"? this appears to be the current standard, but
i don't see a specific commit where this was defined (if such a commit
exists).

  is this worth doing for accuracy? or not worth the churn?

rday

