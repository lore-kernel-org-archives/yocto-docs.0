Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EE68CD98C7
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 17:47:52 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52266.1781200061832130081
 for <docs@lists.yoctoproject.org>;
 Thu, 11 Jun 2026 10:47:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Yc9J4q8F;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+4LZmc9sMWdS/k66mUrZauVLthPww4nFMuii+L2alGo=; b=Yc9J4q8FDRGzheMPX607r3jea1
	6BSe06sNdw4ROf6/BtqVdSCdc7pAH92ZDqHuEds3NPFf5I6WeahTkiZjpbQ38GLR/WQKilG1N6Bhz
	O/9ndf+6jP/cqmzxndruDVOTt4tiIbZIQ5UYvrwlNQAa+oj/McBgnvcBTVEeRSgmekmCxKQRiWPpo
	N3+4vUIU5mDV1tDd3PnrSauJo2fuOlonJqRUMTLgSdHYFhE4ZLnLSF969Dem8pjtsUEchMq/VQFQ0
	A6eflSYINYpSMzzpunSk+wZ0Bzh6xud8xZl0HZpzP1H9RnbuY8+Ps7dhIgwhfdtHN0MzymxJ90Svk
	ftdS0t2g==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:57284 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wXjVB-0000000CCg7-3TKK
	for docs@lists.yoctoproject.org;
	Thu, 11 Jun 2026 13:47:39 -0400
Date: Thu, 11 Jun 2026 13:47:35 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: looking to clarify *more* variables that depend on packaging
 backend
Message-ID: <eaabb969-9ca6-527e-e361-26998643708e@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 11 Jun 2026 17:47:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9698


  (don't have access to my build system so i can't run a simple test.)

i'm reading the section on "Excluding Packages from an Image":

https://docs.yoctoproject.org/dev-manual/packages.html#excluding-packages-from-an-image

and we already know this sentence is inaccurate:

"Each of these variables only works with IPK and RPM package types,
not for Debian packages."

because i've already submitted a patch that corrects that for the
PACKAGE_EXCLUDE variable. but what about the other two? i can't test
but i can check the code and in the rootfs_deb.bbclass:

https://git.openembedded.org/openembedded-core/tree/meta/classes-recipe/rootfs_deb.bbclass

i can see the test for one of those variables but not the other:

python rootfs_deb_bad_recommendations() {
    if d.getVar("BAD_RECOMMENDATIONS"):
        bb.warn("Debian package install does not support BAD_RECOMMENDATIONS")
}
do_rootfs[prefuncs] += "rootfs_deb_bad_recommendations"

  so unless there some testing done somewhere else, can i conclude
that DEB packaging *does* recognize the NO_RECOMMENDATIONS variable
but not the BAD_RECOMMENDATIONS variable? if that's true, i can whip
up a patch to fix that.

rday

