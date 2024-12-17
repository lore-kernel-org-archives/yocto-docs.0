Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25363E7717F
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 09:37:37 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.77775.1734428246766990015
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 01:37:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LYuK4F5q;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3ED7CFF804;
	Tue, 17 Dec 2024 09:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734428245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CL1qxpXBEnahs2l7mkPIz2GEe4v2S3fmqA4sdPbk7mo=;
	b=LYuK4F5qCK82I0trVpJaciK4iZmjimBr9GoqC7/yqRxRfdLrF1ZaSu7YMICsNay6jBBHpC
	U2r+luQL753zpa1hP9A3coUlyBS70QWZxAyTO4HbcdTZZICTpU12X37abAgYWZQ1T/ffwi
	ajwEJ7cjFny6B/cuQzb2bMpyU5iG8Yid3bqO9TKXf29OipDJx37k5YV3bq8fcKDOjGtkc0
	gHVKzvBS7EOMXU7xCUbRFspJF5ocaP0LB7lrbdiUu+gUd4+GYsLPnTCK23EvwoA/80YvIm
	WRDMK5zixW6G4kfLrwgE3pAOjOl3rAn2D9anjjQoENqwpFTjCAkbuizGd2T/Kg==
From: antonin.godard@bootlin.com
To: docs@lists.yoctoproject.org,
	=?UTF-8?q?Gu=C3=A9na=C3=ABl=20Muller?= <guenael.muller@smile.fr>
Cc: thomas.petazzoni@bootlin.com,
	Antonin Godard <antonin.godard@bootlin.com>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: Re: [PATCH v4] ref-manual: use standardized method accross both ubuntu and debian for locale install
Date: Tue, 17 Dec 2024 10:35:39 +0100
Message-ID: <173442809834.1274116.9397255937225932883.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241202110128.27711-1-guenael.muller@smile.fr>
References: <20241202110128.27711-1-guenael.muller@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Dec 2024 09:37:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5949

From: Antonin Godard <antonin.godard@bootlin.com>


On Mon, 02 Dec 2024 12:01:28 +0100, Guénaël Muller wrote:
> Modify locale installation method to be standard accross all debian-based distributions.
> Pre-existing method is available only on Ubuntu, locale-gen tool has no parameter in Debian.

Applied, thanks!

[1/1] ref-manual: use standardized method accross both ubuntu and debian for locale install
      (no commit info)

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

