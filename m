Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A665C83F1A
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 10:41:03 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.9462.1753353659941757234
 for <docs@lists.yoctoproject.org>;
 Thu, 24 Jul 2025 03:41:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=SG76fEXz;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=VIsCMqhTrUF8kBxrFt5s2Q7htTcuBTHp5JPR8yH+Wdg=; b=SG76fEXzFqchqHv6vGs4kTGyIr
	MmyrBvHzRKysIPnc+wOBPMaUkQk0lXmMxR/uErEG+BEDH/eeEDF4pKoWsXmXgcjBbqNVNufKFof0p
	i63UshlrTYAhYDHok9OfxGBnn1zA6YSyh4bCEXrjLAQTqDUA0bT6dNbj8ooV2pW+hX4p48LGJCX/a
	k4yA8uTyGNV/Ut1WVJ0zzeTeF9uk9YdTUlD2Dp1KpuyrDXusUuwNWTxIIFK2pc0OL1/EXfGE50WOG
	LuNgpAigxGLJf0oxXeNOmjcy774tfyWTzouhfphtb2fFGI9QoUCEU2rkUArgncfkNxPfaGZVhQkm5
	dRT//MqQ==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:39848 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uetNf-0000000DVyX-0w0d
	for docs@lists.yoctoproject.org;
	Thu, 24 Jul 2025 06:40:58 -0400
Date: Thu, 24 Jul 2025 06:40:51 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: feature "EXPORT_FUNCTIONS" doesn't seem to be documented
Message-ID: <2a3b6210-3c12-a83a-8dee-a82ab8ea970e@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 24 Jul 2025 10:41:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7373


  seems important, where should it be covered?

rday

