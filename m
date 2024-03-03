Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E450C5475B
	for <webhook@archiver.kernel.org>; Sun,  3 Mar 2024 12:19:52 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.71966.1709468388027724604
 for <docs@lists.yoctoproject.org>;
 Sun, 03 Mar 2024 04:19:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=ZBLdP0YX;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=h25Ug+dLMs6WKoh06iHhBx2/7GLeBEOZhXNLTyWEX5M=; b=ZBLdP0YXyRRidz2Y+NX7JHiZmS
	l8j78jd2SirWI8WQJ+vn2JJUGagagis24ro4uABgUGlrtou3mrpxjtsaA4xKjlfvn23aZHQ4cXV3F
	56jaLN1lfDlXw+AALG6T6dvsG2AGNobqigG0TSQSDIURBB8m3GEmrPjAiYP1VLOiGJQYpZVWWe9md
	fWfieUryP4fFXB7f7iwdstW42/PYSPt3aAjMVW0MAPvLA/8ShuWlg5ssikMIyThWDczkPRQmj8T1l
	RWvZxIUEnBO4qm+TTKfQosufF/Difn5+nEVtSEau3KOjJU/wRNV8WNdS/pLdGOD5ZjQdjTn+lYzOv
	w3k1gKkQ==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:54170 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1rgkoj-0037U8-14
	for docs@lists.yoctoproject.org;
	Sun, 03 Mar 2024 07:19:46 -0500
Date: Sun, 3 Mar 2024 07:19:40 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: strange wording to explain BB_ENV_PASSTHROUGH?
Message-ID: <b74ee0e8-5f40-293f-7da2-b66a8c167317@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Sun, 03 Mar 2024 12:19:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4922


  reading this:

https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-ref-variables.html#term-BB_ENV_PASSTHROUGH

it seems visually odd that that variable, if not "specified", is
defined in terms of a list of variables that includes itself.

  but the text before that also reads weirdly:

"If the value of this variable is not specified (which is the
default)..."

  Does this mean, if the variable does not have a value? Or that you
haven't specified it? Or what? The wording seems confusing.

rday

