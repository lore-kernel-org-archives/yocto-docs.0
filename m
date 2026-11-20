Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1892.1795162530868245178
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Nov 2026 00:15:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=UsfKycJS;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3DE751A173C
	for <docs@lists.yoctoproject.org>; Fri, 20 Nov 2026 08:15:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0E25D6017D;
	Fri, 20 Nov 2026 08:15:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D7AF111BC10CA;
	Fri, 20 Nov 2026 09:15:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795162528; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=3sN4JlmChir6lXpu3zPRQRjkjH3TUJ4lwQvxIJvPlFE=;
	b=UsfKycJSpZcCcqz2Pwbsh480VApcyv/O6Q3raPt5JoEqz8bbRYixcprhHvK9aICmbCmQvj
	n50qtxeOUWnF4IEyCL8B/2bgFv8sSBBlZcqj9LJr6mcoSeLYpVaO+rqoC2F89KwGmMqItc
	Yb3q9zOMUknZ6jxKxQBUez8aXWx6lMDrTF2zeGG+uuigJ1nTUDr7iLp+EP5agngJvwH/23
	gpeXh4GE5opeG5skZQSJ/7WizAfqj59mWhcX98CKYjCG3rtT9/WHIdSijSKtmyn17TkbnK
	2bNPb/pMoJ0oxZIWzKUMXekeAxwNTzn7bxtmV6ZZ0vI8sbot2JAWmRobyxQb9w==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v2 0/4] tools/gen-releases-svg: fixes/improvements
Date: Fri, 20 Nov 2026 09:14:52 +0100
Message-Id: <20261120-gen-releases-svg-fixes-v2-0-abc66b9dd7da@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6CMBBFr0K6dkxbkFBX3sOwoHUKNdiSDjYaw
 t0tGJfu5mX+/29hhNEhsXOxsIjJkQs+gzwUzAyd7xHcLTOTXNZCiAZ69BBxxI6QgFIP1r3yxWV
 Zl4obYZVguTxF3B+5e22/TE99RzNva1ticDSH+N7NSWy5n0T9kyQBHHQtq5PVtpGquugQ5tH5o
 wkP1q7r+gHdS8Uk0AAAAA==
X-Change-ID: 20261118-gen-releases-svg-fixes-0236390c1f91
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=826;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=P4rGkzPVUrtCtwueq9aW+actCYTZ6DakDBLgvy2IDp0=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBrAAGEalIOIir2/Q23gcvDDT7hZZy2GbNiralyV
 B3d26R9LhSJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCawABhAAKCRDRgEFAKaOo
 NsS2D/4qpshRiKpTKbGfsrzZd+gnzbxF3yuj+iwCymtPGeJJ+91z3xR244UwsSlSlCs79PEuDJb
 c2XWpbxfzcdH80UIhRha6EUGNXNRHj8eaNpx9ah81ujoF+pQ42eXl3EGh62bI3F4U3GSdNZyCuv
 dbXzM+olD3yVhahCrMiom+MRoldii2C5kz0f3RhKnIA/eyuT9/C3/oK8j2TTi4uWR/CjPwCPCIR
 tqWd/hkYbdN213jRcv7k/QnmpJdef+Oksd9tGiV1biWA6rjFVWkuKlMRNHyK8/4Ib3Me0WVyrqP
 JFhlHu2z1wEJnhSkrojw68zlwt3hVbb/3JvT2rkyIboY1x+JhinQK6yvx0DRZr/+IA3XaGsHBt+
 HhlNLnCQe5fKCPL2zjPttY9IYIORLGND9x3+hd3C+5LSZ3x9+DfN53mLOzj+50VllyTcG+03o4k
 pEQMiEmvi01wRwFQQi3FoyufA3TT9xtKtypNQkBzvO/80CgDPyaj/OkbAtNB6R9lFnpBOm1AZhd
 ve5GugXjRRA1cZlz1n4O8+nX5Mf1mUje2qcoortOelZK4OE5lNYf88ip3BgHykukjsO50eyGyN3
 NHHHDezBvpHjL9dHYxJFxjJxSAJ7W7q1tHhRpgenxf7qxsOtz2WCn9M9reNnqRHAmy9j8Loo2eZ
 1VQDcbfj0t72asw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Fri, 20 Nov 2026 08:15:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10808

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Apply suggestion from Quentin (thanks!)
- Link to v1: https://patch.msgid.link/20261119-gen-releases-svg-fixes-v1-0-b6245fbf8294@bootlin.com

---
Antonin Godard (4):
      tools/gen-releases-svg: use subprocess check_call instead of run
      tools/gen-releases-svg: start showing releases from oldest active one
      tools/gen-releases-svg: store docs root dir in variable
      tools/gen-releases-svg: simplify tempfile usage

 documentation/ref-manual/svg/releases.svg |  2 +-
 documentation/tools/gen-releases-svg      | 88 +++++++++++++++++--------------
 2 files changed, 50 insertions(+), 40 deletions(-)
---
base-commit: 2c5846cc2c2649b29de7e7a6ac07fef5c2e7f302
change-id: 20261118-gen-releases-svg-fixes-0236390c1f91

