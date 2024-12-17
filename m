Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C630E7716A
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 09:37:27 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.77774.1734428243496457868
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 01:37:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RZbyd0KN;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 32B7AFF803;
	Tue, 17 Dec 2024 09:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734428241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y7wxOg+kPuPXngD5aGrXxlW/ZGNZuQyzTi8Izzelbf8=;
	b=RZbyd0KNON5oiAGyBCiVuLVuv1/iT1IDSaPQXNwuXD1scrk6jN32Z2FiwzZ2GA0wrw8H/8
	gX+QD+xoxynvYDzvEv9Mz4I3zGCaB7sL3T7cKK5v/vVOnN8dUC5k9h4dyiRN0U/Lbus2qQ
	iiIJCycx43h9VIhA5panGrIoGU5N4M/1HlOY1BHu+iWj/4NS3jhI+ItLL7hmTCoxoccpOo
	3LAdFL1T1kRwi0tgARprZJ2WiPTPqrGn1OurhRjxBUH0EFVFeqK8o3ji46XzCAm/LEh1cF
	UBGATEDP9ulbdK7xz+O8EboPD8iWTb7V/uDdBjF54a9FeQArDNk9DSuZxTbTNQ==
From: antonin.godard@bootlin.com
To: docs@lists.yoctoproject.org,
	chee.yang.lee@intel.com
Cc: thomas.petazzoni@bootlin.com,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] migration-guides: add release notes for 5.1.1
Date: Tue, 17 Dec 2024 10:35:38 +0100
Message-ID: <173442809835.1274116.77337233412762906.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241212122725.361920-1-chee.yang.lee@intel.com>
References: <20241212122725.361920-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Dec 2024 09:37:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5948

From: Antonin Godard <antonin.godard@bootlin.com>


Applied, thanks!

[1/1] migration-guides: add release notes for 5.1.1
      commit: db2ff7bbe64e1dca6b0868046f478d7622f79865

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

