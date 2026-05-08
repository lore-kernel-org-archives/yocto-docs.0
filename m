Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9325CD3436
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 13:06:49 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13158.1778245604848126318
 for <docs@lists.yoctoproject.org>;
 Fri, 08 May 2026 06:06:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=esP2uTbo;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=B2ljnBiUAaW8n0RcMh0/RaII/6ezGUNh8mxzpwh1Z6o=; b=esP2uTboNaY2DlqwX1FAEQNf5N
	O+Wd8r5XDDD6eXOhsktPlThEdMKeDuXMZogSw2jjeJsndYvKwC99Us4VJ6rF4ieKMcjou8lYeEGbg
	wczWyxHJo8aXBlCAmh7+6Qj+KZP4YBjBU5mblwkGhgChZDuNzPZPzshIePqTIgW6+nNsVHvo3WgU5
	TAIwU1uzvNePpre+wvJ88tWDt/NR3ZKSbC7GnRM0ne2H2xetV2oU+4EeASv5C6+bgK1Aau71K0TPh
	XDpak1Uf+h3gXXGck+VCFFb6TFeLHq05dB8p+2HnfWD4YZyQCOS4QJ+siDzJTFNmwTn8tHEnBn1G8
	fLOOfdtQ==;
Received: from [147.129.179.166] (port=43520 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wLKuc-00000003e5Q-4AFx
	for docs@lists.yoctoproject.org;
	Fri, 08 May 2026 09:06:43 -0400
Date: Fri, 8 May 2026 09:09:27 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Must IMAGE_FSTYPES use '+=' rather than append operator?
Message-ID: <ef9ef4b2-f079-fcfe-c30c-fb5d343e71fd@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Fri, 08 May 2026 13:06:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9404


  Here:

https://docs.yoctoproject.org/ref-manual/variables.html#term-IMAGE_FSTYPES

part of the note reads:

"Due to the way the OpenEmbedded build system processes this variable,
you cannot update its contents by using :append or :prepend. You must
use the += operator to add one or more options to the IMAGE_FSTYPES
variable."

  Yet, here:

https://git.openembedded.org/openembedded-core/tree/meta/lib/oeqa/selftest/cases/wic.py#n1671

there are a small number of examples in "wic.py" that appear to be
doing just that. Is this an inconsistency in the docs or code?

rday

