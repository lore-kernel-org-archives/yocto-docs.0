Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 876E3CDB47F
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:30:54 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7298.1782379849400670476
 for <docs@lists.yoctoproject.org>;
 Thu, 25 Jun 2026 02:30:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=wV/PFgso;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/euHVHF36DiUPbEj9L1bZIiH6l/8WxS6lH5sQmUmAdg=; b=wV/PFgsoPOOyoq0cBmo+JN2hbo
	wiLyg9X+9CTZFBuJyDepMahJ7937x+Z5WNDlXRzah9F7hPeZCIQPa3a2MECxRke4gNOcfmojcF/VM
	mG00OiBMYLxKhrKk4Vb1JGvPgmeHLpREmhukvEPoQuutTX/6tW260C9D/J0e+svB6JMDv72iqYBXn
	1ixx6cbZvXS2lAUiQdmFFIBfi1BOC0UV5rqWfy+WwJljyu0SvKOorLcIrN6cUyia88vtQXkxicYR5
	cn/WNPHb2/GFUwkDj4OBjlEk1OKhXgWpCtXb9gqFLlwwsxSUi9D+I2TzNenyc/lNdSIRFHgRJn70G
	qWgQ8I6g==;
Received: from bras-base-otwaon0916w-grc-51-67-71-147-190.dsl.bell.ca ([67.71.147.190]:38742 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wcgQ1-000000008B4-1rr5
	for docs@lists.yoctoproject.org;
	Thu, 25 Jun 2026 05:30:47 -0400
Date: Thu, 25 Jun 2026 05:30:40 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: why is monospaced font in section headings so tiny?
Message-ID: <d91eb78d-7db0-2f64-6ecf-9a4cea96eb2d@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 25 Jun 2026 09:30:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9882


  just processing quentin's suggestion for buildhistory section, and
noticed for the first time how tiny is monospaced font in headings,
like here:

https://docs.yoctoproject.org/dev-manual/customizing-images.html#customizing-images-using-local-conf

where "local.conf" is so much smaller than the rest of the title. is
there no way to adjust that?

rday

