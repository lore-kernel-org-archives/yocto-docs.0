Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63CE2C54FB3
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 13:02:16 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.49113.1748869335055554027
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Jun 2025 06:02:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=SiZGgxPU;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Gb+WZTm+D9vZwClGXHDeQlvpv58RGUO3fplPvG9wj7c=; b=SiZGgxPUD1nE/bzG18jh3bHRvd
	rUEMfiXlmyJJ/HniwXMNrVX19xD+HvLCc96H0OZ6alYV6SkicvZNgNbfmZJ9o1+8iAKpAHD4h68N8
	VO61Xa3+2TesbrETolm/qSqLSLvZ42csHorPd+t0k9AQxqz3jOP24CDNtuFQ/8r6dTaLgBTalJXic
	In+I24KH0lAYnkYe5nL59QIvh7K40h+vBBMObCw9GZf0BXMplAZCxDZ2DewGTigis5NynziDkoiE6
	HqbsIeChEOR+F1+wPVSVmdGQDUwOX9WA0Rx3/uJLAaLo66PC9+nIdjNcz9qNv9Ui0teRuMq6QCllI
	wn/mLbbQ==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:47158 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uM4nr-0000000HAls-3c6y
	for docs@lists.yoctoproject.org;
	Mon, 02 Jun 2025 09:02:13 -0400
Date: Mon, 2 Jun 2025 09:02:03 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] Update Ubuntu essentials list, replace liblz4-tool with
 lz4
Message-ID: <6f93430f-7953-39b6-caf7-b144f37ab657@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Mon, 02 Jun 2025 13:02:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6972


Update the "Ubuntu Essentials package list" by replacing the obsolete
liblz4-tool package name with the current lz4 package name.

According to Quentin Schulz:

"According to pkgs.org, 20.04 lz4 replaces/provides liblz4-tool, same
for 22.04 and 24.04 and for some reason, liblz4-tool requires lz4
package, so I think it should be fine to replace it yes.

"Debian seems to have the same packaging in Bookworm and Bullseye, so
probably fine to do the change. They only seem to be adding a
changelog and copyright, and require lz4 package in any case."

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/tools/host_packages_scripts/ubuntu_essential.sh b/documentation/tools/host_packages_scripts/ubuntu_essential.sh
index f3388c88c..c4231188b 100644
--- a/documentation/tools/host_packages_scripts/ubuntu_essential.sh
+++ b/documentation/tools/host_packages_scripts/ubuntu_essential.sh
@@ -1 +1 @@
-sudo apt-get install build-essential chrpath cpio debianutils diffstat file gawk gcc git iputils-ping libacl1 liblz4-tool locales python3 python3-git python3-jinja2 python3-pexpect python3-pip python3-subunit socat texinfo unzip wget xz-utils zstd
+sudo apt-get install build-essential chrpath cpio debianutils diffstat file gawk gcc git iputils-ping libacl1 lz4 locales python3 python3-git python3-jinja2 python3-pexpect python3-pip python3-subunit socat texinfo unzip wget xz-utils zstd

