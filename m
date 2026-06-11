Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14F5CCD98D5
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 11:26:40 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43194.1781177197578273166
 for <docs@lists.yoctoproject.org>;
 Thu, 11 Jun 2026 04:26:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=UsyMGKLV;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UUE7jHgZeOzgciAyo5AoafWywkQ4fFICf/6Z4CRfy0o=; b=UsyMGKLVnQhbT3bGyedBseTm9+
	q0b7jEzuuA5R4KwHwx6SxqoNjaNLNjccb/A5PyvN4XFtWqMBQdPih3XmVtwLTDCc3kwXPncZMT34X
	3SYKWz00SLDor9P9JPaihItoRxqaUx/9tQVjBf5Fk1cbrr6GHD9wtfEIzcXNfTSvsSFvc71uMETjN
	JgS/2F6/lvGP7MfcJLMJ+NIcVRP5PoRmSi8M5P0aGocSkpNmNxF7RWpsEAyonbq1ZdrWfF+PjYmNQ
	/ehOW0V2hwYLEi8UcembUbJbVVapwmfjKVRabVPkVcgVBER+YE2U3BtAoeRics8ECUWiQbCVYoMlK
	GMmVWNdw==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:59034 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wXdYP-0000000BS0Z-2fLR
	for docs@lists.yoctoproject.org;
	Thu, 11 Jun 2026 07:26:35 -0400
Date: Thu, 11 Jun 2026 07:26:30 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: should the dev manual "libraries" sections explain
 "oe_libinstall"?
Message-ID: <3b08f39f-86c4-ce11-0761-8ef793c0fbdd@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 11 Jun 2026 11:26:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9693


  while the "Working with Pre-Built Libraries" section:

https://docs.yoctoproject.org/dev-manual/prebuilt-libraries.html

explains the "oe_soinstall" utility, i see nothing anywhere in the
docs that explains the similar "oe_libinstall" utility, for which
there are a few examples scattered around, such as mtd-utils:

https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/mtd/mtd-utils_2.3.1.bb

  does this deserve a mention?

rday

