Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1E25C5DF81
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 11:22:01 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5033.1787224920822121235
 for <docs@lists.yoctoproject.org>;
 Thu, 20 Aug 2026 04:22:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=WhbUhUQi;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dgnFuU4fuaMSFIwPe7WBjevQV3lGIDl2X7ZfE897pJk=; b=WhbUhUQiwJkJ4/seOpICpUXsCq
	iW8n06FZR48zyFMTOyeI2CCkfk9KNAc6AJfrZfclPhmjklwkl23s7x1jR2KOfUQKHK8Mc4M/leAfZ
	MIc9uhi2MAOdJaMZWpZur2wOAL8oaHJKA37/eNPpdhhOcbOtGyUwaq3UUZO36kyp/GFlY0T5e6556
	Z9frAx/WK5VUz6vARwN+ThekZ0cVL7ko8ZVxC3SxpgVbEQoEdEUsz6dzdGvncuHtCEa8VYIzAP1/r
	8+unRqIzWI7r+XRPqCj0JHZnpf1wAh2rKnWTQz0gNV564VDQ1P+yAN9FCLoJXfnRB8QYY2DpLqWjX
	eyTRgsVw==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:55694 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wx0qL-0000000GyhC-36MP
	for docs@lists.yoctoproject.org;
	Thu, 20 Aug 2026 07:21:58 -0400
Date: Thu, 20 Aug 2026 07:20:35 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: commands to do "pip install" in docs README file need enhancing
Message-ID: <959e65b6-e7eb-bcc3-992f-bed7276c8449@crashcourse.ca>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2139878080-1787224841=:3254218"
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
 <docs@lists.yoctoproject.org>; Thu, 20 Aug 2026 11:22:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10300

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2139878080-1787224841=:3254218
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT


  I just went through this with another Sphinx-based documentation
repo -- installation instructions that advise the reader to install
Python modules with "pip install" fail on my Debian 13 system with:


$ pip install sphinx-lint
error: externally-managed-environment

× This environment is externally managed
╰─> To install Python packages system-wide, try apt install
    python3-xyz, where xyz is the package you are trying to
    install.

    If you wish to install a non-Debian-packaged Python package,
    create a virtual environment using python3 -m venv path/to/venv.
    Then use path/to/venv/bin/python and path/to/venv/bin/pip. Make
    sure you have python3-full installed.

    If you wish to install a non-Debian packaged Python application,
    it may be easiest to use pipx install xyz, which will manage a
    virtual environment for you. Make sure you have pipx installed.

    See /usr/share/doc/python3.13/README.venv for more information.

note: If you believe this is a mistake, please contact your Python
installation or OS distribution provider. You can override this, at
the risk of breaking your Python installation or OS, by passing
--break-system-packages.
hint: See PEP 668 for the detailed specification.


  Yes, there are solutions, such as using "pipx" instead of "pip", and
what have you, but it seems that the README file should be augmented
with an explanation as to how to deal with the above given that the
"pip install" commands are, in some cases, guaranteed to fail.

rday
--8323329-2139878080-1787224841=:3254218--

