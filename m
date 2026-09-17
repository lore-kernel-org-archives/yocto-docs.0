Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12FABC88E72
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 20:21:09 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2856.1789676466941298103
 for <docs@lists.yoctoproject.org>;
 Thu, 17 Sep 2026 13:21:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=yfIVkVSM;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZjK+HR0jp5LRnLnnBixgrJayM81TS3o5UxfzG9lzuEM=; b=yfIVkVSMmAZRtWHJQnOJ+nX/Jg
	3kp8Hyyo1Jtl/T0YL3UQO4f1CGqLLm9LLgHQoYXgnhIbB6IkD3BFwnPl+83YEnZ4JPt3wQXklQ+/C
	h/F5SIJJXwPAHTelnPO7Q5xoBiTlOI55sh/64rtBEk3Zle9q9kp5CzpXASgeiyT1S9Xz6RS6H+LlT
	IIGGEPYZyfliNAx2qzTA9qM9FkZYxEqbV81i4SadGq8oRlQYZW6no1PNcEwNh4oAh2YQKb68I+NG0
	KoB4Dw4JyOYtdSGPC4jx4DbfUTkxnWOeh52opXcFUwcQrt1kjkvOXLHtVUW3LSa/TAaxkBxYwhqrd
	ooflp3Fw==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:50596 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1x7IbP-000000022q1-0hSx
	for docs@lists.yoctoproject.org;
	Thu, 17 Sep 2026 16:21:04 -0400
Date: Thu, 17 Sep 2026 16:18:51 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: where in the docs does it explain wic directives "part SPL"?
Message-ID: <16fc349e-53a1-715f-0876-75acc3a41988@crashcourse.ca>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-156326842-1789676335=:54334"
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
 <docs@lists.yoctoproject.org>; Thu, 17 Sep 2026 20:21:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10530

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-156326842-1789676335=:54334
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT


  i'm trying to cross-reference all the wic explanations, and i read
in the reference:

https://docs.yoctoproject.org/ref-manual/kickstart.html#openembedded-kickstart-wks-reference

this in section 10.2:

  part [mntpoint]
  partition [mntpoint]

  If you do not provide mntpoint, Wic creates a partition but does not
  mount it.

  The mntpoint is where the partition is mounted and must be in one of
  the following forms:

    /path: For example, “/”, “/usr”, or “/home”

    swap: The created partition is used as swap space

fair enough, but nothing there covers lines like this that you find
for i.MX targets:

part SPL --source rawcopy --sourceparams="file=SPL" --ondisk mmcblk
--no-table --align 1
part u-boot --source rawcopy
--sourceparams="file=${UBOOT_BINARY}.tagged" --ondisk mmcblk
--no-table --align 69


  where is the explanation of examples like "part SPL" and "part
u-boot"?

rday
--8323329-156326842-1789676335=:54334--

