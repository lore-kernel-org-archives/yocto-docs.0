Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6D60ECAAA1
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 15:10:46 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.620.1666969843468414539
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Oct 2022 08:10:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mvS7Hr3G;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B2AAD1C0008;
	Fri, 28 Oct 2022 15:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666969841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lNeksVhGm0Ly2mKoGAHFbngD6NXkfJWK8xZVUClcdzs=;
	b=mvS7Hr3G0469HB/p2Eu1cKli3TXv+E5s71DDbr1UlN57ewSTKAbO5CBVGsi6kWvgNeu6dI
	VgYNXretJXRmEvcU3+uaWfJrA0st/lRtqlA4ECUuAJhq+acetnhZT+hDDEulBcGrqN9DiM
	GfboDiUYxOKOjtSBFBEly7iEThkqmNNsMYqdUsNVKjyZn7WWjVZsUV8VyPy34xq9CdQvcv
	sJl2IMISXG7CYT8e3SctMKEcbIbGxOVJ8g/MjjZ3TqzRfAmTuK5WZvJpGaYvY+oIvK/1Iq
	7ao+gPUn7tEZw4Rn7+VHlbEDvvP+MhFY2azo5caqlIk4GQZYbczWixpBYYsE2g==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: JPEWhacker@gmail.com,
	mikko.rapeli@linaro.org,
	Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v2 0/5] manuals: add documentation about SBOM/SPDX generation
Date: Fri, 28 Oct 2022 17:10:28 +0200
Message-Id: <20221028151033.383087-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <17224368BE5A21CF.6604@lists.yoctoproject.org>
References: <17224368BE5A21CF.6604@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Oct 2022 15:10:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3442

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Even though the create-spdx class has been available
for several versions, it wasn't documented at all
until very recently.

This is a first version, which could be expanded
thanks to your feedback or later.

In particular, I'd be interested in references
to outside SPDX tools to consume (in particular
browsing or analysing) the SPDX we generate.

I wouldn't be surprised if there are inaccuracies,
so thank you in advance for your reviews!

Changes in V2:
- Rebase against the newest master-next
- In description of the "spdx-create" class,
  put the output in tmp/deploy/images first.
  (Reported by Joshua Watt)
- Improve wording with respect to license
  compliance as suggested by Mikko Rapeli.

Michael Opdenacker (5):
  ref-manual: terms.rst: add SBOM and SPDX terms
  ref-manual: variables.rst: document spdx-create class variables
  dev-manual: common-tasks.rst: add section about SPDX / SBOM generation
  ref-manual: classes.rst: expand documentation of create-spdx class
  ref-manual: terms.rst: add reference to new SBOM/SPDX section in dev
    manual

 documentation/dev-manual/common-tasks.rst | 101 ++++++++++++++--------
 documentation/ref-manual/classes.rst      |  22 ++++-
 documentation/ref-manual/terms.rst        |  28 ++++++
 documentation/ref-manual/variables.rst    |  82 ++++++++++++++++++
 4 files changed, 196 insertions(+), 37 deletions(-)

-- 
2.34.1


