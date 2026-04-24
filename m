Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 058B4FE51E6
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 08:44:11 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16862.1777020244412850924
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Apr 2026 01:44:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=Ho5AMdV6;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CF8C24E42AE9
	for <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:44:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A6B2E604EB;
	Fri, 24 Apr 2026 08:44:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E5CC6107206C2;
	Fri, 24 Apr 2026 10:44:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777020242; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Al4zQlmio//G5AP/Z/DNRD79SYowELPxIWGzb81frWI=;
	b=Ho5AMdV6K3CWFYjHbWrniPBWCvmqwZlWR7DNCOAuADw+ieftTrl+1j6N+CHTMq0pIE1nHU
	BES7CTqm2jq3yxjCaBaDDnQBoP6l9mUyiY4Ttsdh+YdPFyPQI2ygGPi3iH6m0i3Eai9dQR
	j61ihnedoQzrcgGRlDr3lp29QJAiTex80SSiYmYQ8NcQ3TKUQAFCyiCxdnYQoW+wr5lgiX
	tnYHV6YeSH5q/DtiP26+c+zNdaqcYAqCDc50xKVAuiVWvnw13uCEImcq3WEzepN7AGLjg2
	Vv5rMtduXdYKS95lIlhud3OeWt26Zf3j25PsTgZc3KMBFlM9HGGbGOkVcnXQMQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	chee.yang.lee@intel.com
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH v2] migration-guide: add release notes for 5.0.17
Date: Fri, 24 Apr 2026 10:42:39 +0200
Message-ID: <177702011516.92831.7856004030694979940.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260417110647.559041-1-chee.yang.lee@intel.com>
References: <20260417110647.559041-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:44:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9362

Applied, thanks!

[1/1] migration-guide: add release notes for 5.0.17
      commit: 7b671218b3034f3774b6ca1759dd971c3ff5c4df

