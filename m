Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 776D1C83F0F
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 11:14:23 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.15967.1751973257760846241
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Jul 2025 04:14:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=VfgNZX7z;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7xyHAlsev3W2jxF5EG27R1GEA2hXxPKTlHXdx2D0aAg=; b=VfgNZX7zz976a3O6QJi5eEKyNy
	sJo3nmxcsjdoCBBiwQH2v/VV6s+6fir7YE4ATrkQ4qi6Iwr5zxaYqvESjZreINYhvSlDd47jUaVzq
	Z/vXiMwtA3vL/cKUUK45J6QIXM9c7PEqb6LhmrzQ/WdThrOH0CECqTs0krgroPg9ETEkpUA7kCoSX
	s6waYwuWFKQ4+CEY+9HM4YuCqXEtaVYKPbXX2+jdSQj+27VVKj7Ds/EYsYTpxLpZsi//SJrUkmVNB
	qYwVi+NjVuCDT4P70X3lrjyEYGKnTZBvd2aF31+LcJB1nGZYvAEsynKii3fc7Ryckc9wKhKjXjxC3
	kUPpxByw==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:44452 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uZ6H8-00000006wHZ-1aA3
	for docs@lists.yoctoproject.org;
	Tue, 08 Jul 2025 07:14:16 -0400
Date: Tue, 8 Jul 2025 07:14:08 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: is there anything magic about a "virtual/*" PROVIDES setting?
Message-ID: <cfef6b70-4f85-a25c-974f-d32122b79a63@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 08 Jul 2025 11:14:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7277


  from memory, i recall that there is nothing special about any recipe
providing a "virtual/" value, other than that providing something like
"virtual/kernel" was nothing more than a catchy visual aid to
emphasize that this was meant to be a *general* indication of a
general functionality being defined.

  is that correct? or am i misremembering?

rday

