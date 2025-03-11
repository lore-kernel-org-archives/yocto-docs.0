Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B324C35FF3
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 13:31:31 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.8982.1741699883708745550
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Mar 2025 06:31:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NBRYgXUs;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4357F44197;
	Tue, 11 Mar 2025 13:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741699882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AhyieeWKea4eA2BjtNDpivFt7l5fr2sYmu3YsO7NWIk=;
	b=NBRYgXUsszzBK7YXNVDXsGpLcR28RVeE9zc9AkrvYefPi62i4HFp/7eE899PmGesLfkmwv
	15hUV8IBiaWGobAzhZyScS7jkxtZbGC3/HRE7+xis+Clhv67GDYI48rN+JkhPkaWucsDQj
	dLZg742/pCNnT1e8b10ipmLOb0n0n81P+X4zjyjGDCKpbZTeJOF2QrVSsL5hQx0Y29Hetl
	EeSealTjEvjELzuLSr9mT5RXrBTVueDAlFnROXMTgLBet1l1GmXTqU71DjUthikhLtUY9m
	Vn6JFCmclV9/6CwkpgfrTaRi8Zqz21zkSQv5YVFeYKA278wGfeYcbmRM8wWN1w==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 11 Mar 2025 14:31:06 +0100
Subject: [PATCH v2 5/6] overview-manual/concepts: remove PR from the build
 dir list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-overview-figures-v2-5-63f0c89fab98@bootlin.com>
References: <20250311-overview-figures-v2-0-63f0c89fab98@bootlin.com>
In-Reply-To: <20250311-overview-figures-v2-0-63f0c89fab98@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=842;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=s5QrGJ+Q79vzuHH2/wYiAYJn6OG7Z2Y7xgwkGj1hlWU=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn0DsojvUXy15VC7X/NMftN7phK8JbtURozg6sP
 OiVUskLWgGJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ9A7KAAKCRDRgEFAKaOo
 NrXMD/wOH/bp9eqejDvntAbmnlO4w/lRIP77cQaLe4HDsiXCUhavlJDH/fjGKn3n16QPbiTefzC
 KX1yXuYy9PKKv1NB5ZG2jKff328WriKuksTPh0mWh1HpRVEaz8jZN6gebzml0JOIRcjFGuolypT
 DBOQopNq0dNJe9TY8nLRTXOdYrhnXoyTiMLaYTZUZEP2GMty3w2qQdBKIo1cxxKZcm38gTjCQW9
 Ji7jRQOPo1ghE9WX67PRc/1FJrUUviMJvAcxD19vi2CTKIqZ3MWw1PpFSDgY2smLWMFObsMi/9Z
 kBGY/wKTn20m3WyQkcb0zUNAR9hUsP6GyHak+f9voDeKj76TUvg9ER4QTSP3G82zPqI2kqaA3wW
 W4K8P0zIE/ZVZ4euFsCbcUrpxcpXQCv0uv0qlVIO1PlJSo6qOshPpLtiKnFFXJW9vPtlFs5iR1G
 uXcVXd4wrq8yjoAOVzk3YnDDhnCzC1pDuIG26T/0C6NlawW8SdVUxhU4Ej0qKBoRoJqZxLAKflY
 uT0d6Mf2UGb47mELQEMXq1DzdAADxHTquapChiBGM4UqbGmC7TZyDQgX8TxvKYUCn0JhIaohCWx
 T2ZyHwn6ITk9Fw4EPX8+ZxmGmyuPNaSH+yYUwo0Af+5aa9i3svInEpxK7wwFB9Gv9gsNIuygEt8
 zk0paYEYDCWiRjA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvddvfeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieeguefhfeegheffgfeuieetheeileefheejkeetgfekueehueeluddvlefghfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegso
 hhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Mar 2025 13:31:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6537

From: Antonin Godard <antonin.godard@bootlin.com>

PR was removed by cc83e4548465 ("bitbake.conf: Drop PE and PR from
WORKDIR and STAMP") on OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/overview-manual/concepts.rst | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index f0e2eb224..ccbe2f47f 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -736,9 +736,6 @@ following list describe the :term:`Build Directory`'s hierarchy:
    -  :term:`PV`: The version of the
       recipe used to build the package.
 
-   -  :term:`PR`: The revision of the
-      recipe used to build the package.
-
 -  :term:`S`: Contains the unpacked source
    files for a given recipe.
 

-- 
2.47.0


