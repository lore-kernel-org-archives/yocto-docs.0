Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7BFBC53219
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 07:46:52 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6632.1785224802889643681
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 00:46:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=a+46fsUb;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 98B7F1A12B7;
	Tue, 28 Jul 2026 07:46:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6CFA9601BF;
	Tue, 28 Jul 2026 07:46:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EBA5811C13E05;
	Tue, 28 Jul 2026 09:46:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785224800; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TReaaiJ80nZqeMpz0vIbQ/PtAwJT2nhpxc6St6TsQbw=;
	b=a+46fsUbe6/6f4dJxUIXfkOvA+LHVLGvXd8lO0w9EA3Q0SwL8GOkviBmxb/p4r5lBKr05K
	+IYSTGlf2YR8z+GDdFK65f34bPWq2NeTncbwut6tv1GAA1c1lA82mdamjzqSX0Z4WEMIQu
	88cajHJCZ4cvh89IpBUYDh1oIcU0+bDgO1TRfY8QYyTdurdpGee9L9ShWfkVSdgEoWkys+
	6pxK5m17nHtrE/M9RZBzUfFVsI+7wcTwqaNuX/+RQZteGfY4HxwFHKjj/pJ6aZRvF4vgD6
	E+dEXwvmfvTlotawPy7xZ9Rgfrz5orhrbA5ibGd6s46IAavGNKzEOZoeO8G+1g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Jul 2026 09:46:38 +0200
Message-Id: <DKA1DIGQ6OVQ.15AU21L9DZMM1@bootlin.com>
Subject: Re: [docs] [PATCH v2 2/5] ref-manual: Prune superfluous space with
 :append
Cc: <quentin.schulz@cherry.de>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <niko.mauno@vaisala.com>, <docs@lists.yoctoproject.org>
References: <20260728072328.11926-1-niko.mauno@vaisala.com>
 <20260728072328.11926-3-niko.mauno@vaisala.com>
In-Reply-To: <20260728072328.11926-3-niko.mauno@vaisala.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Jul 2026 07:46:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10162

Hi,

Just a note; but since Quentin gave you Reviewed-by on your v1, it's nice t=
o
keep them for the unchanged patches in v2. I'll apply them manually for
unchanged patches.

Antonin

