Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD9B0CD98C5
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 07:28:41 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.74150.1780990119724739799
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 00:28:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=wZPuD4QO;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9E139C4FED4
	for <docs@lists.yoctoproject.org>; Tue,  9 Jun 2026 07:28:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 46A1B5FFC1;
	Tue,  9 Jun 2026 07:28:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 85A00106A2AC6;
	Tue,  9 Jun 2026 09:28:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780990117; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=k6hcXtAzayXgR+T5D5Hr32zHfIdvdAqWgUIOwPzOUW0=;
	b=wZPuD4QOLKx9Uq+UodXa/ntH7ivlpSceWy4Rr+SsBfeXbETbP9VWwiNik1X5DHeKSA41Ku
	DH7vNs0VEWEOTzKTtn+KSO93FewejtCjtP8Ge3G35Uzrs8iyTveJE/geiTugC4AFkt9d9n
	3xbjykCEcqZP0cJ95Cg7x3VH23xq0DmIk+WA7h4rHEvS2DoTLEbs+F56MxOIVrZ9yoSETq
	UZgq9IkJorNdWFcDrwWXSeBuy6AdU6N+8lYoKy1CfkYEOxzYMScMs7K12d7VF6Y4uLid7D
	SmFHRHbER/QVZ3MFYmVsVTIeO2d9jaXH7kFOWnScajEN6vjFHIKqTkN09ERjTA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] overview-manual: add ":term:" for OE Build System
Date: Tue,  9 Jun 2026 09:27:08 +0200
Message-ID: <178099000121.200930.13564521290943953235.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <648eea28-9d38-0be7-9971-f57f0a49a863@crashcourse.ca>
References: <648eea28-9d38-0be7-9971-f57f0a49a863@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 09 Jun 2026 07:28:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9643

Applied, thanks!

[1/1] overview-manual: add ":term:" for OE Build System
      commit: 44d5538ff5032544db5b04d3502ac9b6722feccc

