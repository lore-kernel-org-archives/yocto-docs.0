Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2691CCFD646
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 14:39:56 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7270.1767796786497545023
 for <docs@lists.yoctoproject.org>;
 Wed, 07 Jan 2026 06:39:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=GKDYy49k;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rqsLBp19LkXXiNvMbBR5aryXL6MjOJHtn76l9hNAdwM=; b=GKDYy49kSGf/4bvyBJJa5GUWHn
	CbS3hU/zJg41otqBePoNQ34rBdK3j517iuXHlKrTmOddjcxmerZQBuopoDmR22Y3yI202W2CLOiK5
	/lqaoT6HfzIi8VSo40MdsjQ6Q0VZofEGPdgbkpl/XZZTx4UKvLHhZOP2XM7jqWpH2/mp5mzDGs7A/
	pOO2wUumbqU5ExcpbOihdPDscP1SZqQIjORkd4GvesTP2N1WYD4mwpkOKOiElj0HCp7RwpAyvvVNI
	9TRbE0fLlutLGlNS4kClTXuj7tKkV3+DwT5KwgLHX5QKAIpFsSEzT+AS3FksXUk+RushrjH9PrdmV
	1MbeMxsQ==;
Received: from [147.129.179.166] (port=53074 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vdUhM-0000000FYrO-1A7l
	for docs@lists.yoctoproject.org;
	Wed, 07 Jan 2026 09:39:44 -0500
Date: Wed, 7 Jan 2026 09:42:37 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: BB explanation of BB_ENV_PASSTHROUGH is confusing
Message-ID: <5cc0f4e6-3722-74a3-cf42-4f919d1ed314@crashcourse.ca>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1049686022-1767796973=:1528398"
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
 <docs@lists.yoctoproject.org>; Wed, 07 Jan 2026 14:39:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8409

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1049686022-1767796973=:1528398
Content-Type: text/plain; charset=ISO-8859-7
Content-Transfer-Encoding: 8BIT


here:

https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-ref-variables.html#term-BB_ENV_PASSTHROUGH

the explanation:

"Specifies the internal list of variables to allow through from the
external environment into BitBake�s datastore. If the value of this
variable is not specified (which is the default), the following list
is used: BBPATH, BB_PRESERVE_ENV, BB_ENV_PASSTHROUGH, and
BB_ENV_PASSTHROUGH_ADDITIONS."

seems weird since it suggests that if the value of that variable is
not specified, the list that is used recursively *includes* the
variable itself. and this doesn't seem to match the code from
lib/bb/utils.py, which does *not* include that variable:

  def preserved_envvars():
    """Returns the list of variables which are taken from the environment and
    placed in the metadata."""
    v = [
        'BBPATH',
        'BB_PRESERVE_ENV',
        'BB_ENV_PASSTHROUGH_ADDITIONS',
    ]
    return v + preserved_envvars_exported()

can someone clarify how that explanation should be interpreted? or how
it might be made clearer?

rday
--8323329-1049686022-1767796973=:1528398--

