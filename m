Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CFE2C7115C
	for <webhook@archiver.kernel.org>; Sun, 22 Jun 2025 09:12:30 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.23222.1750583547466279429
 for <docs@lists.yoctoproject.org>;
 Sun, 22 Jun 2025 02:12:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=eT616r0s;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nfYbtisFjzMD3gDz7z9KTPiXQs4rpo3aUOxkZQ8sxY8=; b=eT616r0soSnUm1gYfwxJn5SVFB
	INb1bLoJHN2heAJvz2KQsATkYI8GpIlcZiTH97cMN7k4byMYQINk+8RpNQNBnjUIs1aLJGSVr/v83
	NASh+KWdkaU8bMkxlhoHkg2VrSg7tPSVOMyGv2+CtoJtgmpUmxBLaNJ3FvOoOEG4zD7fAmzhpI3YU
	ImU8YFL8qA9eu/TiLw7Z/D31Uc5OU+e8JIWCRa+3feKMaE/5oQr7QeX74sXoQLdXDxmy7/MTiqZve
	Dca0VTG+cz276IO+hUoo/0jl7sqCHrp6RdTTX0xkht/V+L0rhgEXZXXfenpKFi+52b4at2LXXm4UG
	BN16PybA==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:47534 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uTGkT-00000006tsJ-0fWw
	for docs@lists.yoctoproject.org;
	Sun, 22 Jun 2025 05:12:25 -0400
Date: Sun, 22 Jun 2025 05:12:21 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: minor grammar correction
Message-ID: <47e13a94-0ba3-cd70-4086-897143f7ff61@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Sun, 22 Jun 2025 09:12:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7135


Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/building.rst b/documentation/dev-manual/building.rst
index 865d2e1b6..c90b3ad40 100644
--- a/documentation/dev-manual/building.rst
+++ b/documentation/dev-manual/building.rst
@@ -813,7 +813,7 @@ directory:

 #. *Using Local Files Only:* Inside your ``local.conf`` file, add the
    :term:`SOURCE_MIRROR_URL` variable, inherit the
-   :ref:`ref-classes-own-mirrors` class, and use the
+   :ref:`ref-classes-own-mirrors` class, and add the
    :term:`BB_NO_NETWORK` variable to your ``local.conf``::

       SOURCE_MIRROR_URL ?= "file:///home/your-download-dir/"

