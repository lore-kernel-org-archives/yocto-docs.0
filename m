Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C188DC3601B
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 13:07:46 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.10717.1743167256562656100
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Mar 2025 06:07:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GL7WALDx;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 25425441A3;
	Fri, 28 Mar 2025 13:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743167255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FiOef6VFt4dBYp+15X+x6Cai/i5sqjlS4QnCjjoLN4k=;
	b=GL7WALDxvguf4FxqH5RAhUw77IkUojsbYUiqlV/zD1mqE4/bCvzUXWf/cRHOQz1j1StXz+
	QkJ6iXG77Vc8QZywtekfFuiwf2vxULu+8c3g+lgcftuBy83Jdp2LUyXKA8s6ttKtjNSY/l
	tPyVm3Xw1SLEOVOv37KEif91lPjugxPgtfE2HNHoRMmwh1fP9c4xnMAR31p8+sNZGDHRYz
	eGBX5Stxsvv4XGShCpukaAJgKdWuFM9GOxwL0ccLRcTOTGVo1N2DcNU0wkGXFwKl7vOMOx
	PdTCTheMrwIh5maj+YecdwMcVHhmRem8vfwr8g1x+euYGn+HPQn0Hw0p5aIWtw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 28 Mar 2025 14:07:08 +0100
Subject: [PATCH 05/11] migration-guides/release-notes-5.2.rst: add an entry
 for addfragments
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250328-release-note-5-2-updates-2-v1-5-c913513e9140@bootlin.com>
References: <20250328-release-note-5-2-updates-2-v1-0-c913513e9140@bootlin.com>
In-Reply-To: <20250328-release-note-5-2-updates-2-v1-0-c913513e9140@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1151;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=454t9ISmgOOFmH/UDMBKJikmEyoSuHyBkGnNtc56EOA=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn5p8Vsk71TmT8PsIBvh6LsHdkYT1/naCNQC8M1
 pv/b4udsN6JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ+afFQAKCRDRgEFAKaOo
 Nm1+D/kBhHizTCLbi+ZMFzPh7rNDh1M4LM1j+GUOKqZ8g+YaOuS6WqGknlqh/5OYcSQEsXrwAU2
 NF3Gj9yj7uPsMMNzzLtZJvrRwrhuD52KGEMRLWUPkGia+XP3F6CjOhEzE2vGTemk3gMW7vOfLpG
 RbLxBkHmwBYza6TbZFZIH2fLTjezyVFldfSvMz4Zj/URkvSPardKEVzN13AqHb7ZZnpy+qA0CoM
 QBQG7lm7Dm4a7Wv9MKtYOf6dlXZ6k/OdT28ZNtQ3wdP5fWL5JJXq/oHkLNAu5C3xdEBH0rbYhoh
 V/J7CskjnTXuEWp+yy1RCg4GaPvvh/KpgAOK/rP9T86Gl5gZuCt5YVWHl1Ifd07ood0A4nlpDx2
 i91TFUs2UgSQv0zioM9JFopOduqxjAOuliosmKV71pwjJXbFjcNzqKL5nTrSfp+JQ2NkzylUpdh
 /KuMDF1El5D7BpAFy2FGdI+q/QfxSynKNnQy01M5Hdogt5eB5yAD+ck0lUja/q/YYpEWvMU5egO
 l2d3L6mbLK1Z4Z9uAAFZtM4ZBPRMAfqxehtwIAlTQyDA4C8bUaDmKU/JLfuNjiqM6rg/t6X4NNs
 fLvOOedD92peSRMx8kAGMEW4U+aZ/Cnu9pimCKkrE/3NSZEae3tAyGYlOYA+5eB4XPmNwPYs/UF
 V8ztVFCef9Sbznw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujedufeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieeguefhfeegheffgfeuieetheeileefheejkeetgfekueehueeluddvlefghfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegso
 hhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Mar 2025 13:07:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6659

This should be clearly mentioned in the BitBake section as it is an
valuable addition to 5.2.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/release-notes-5.2.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/documentation/migration-guides/release-notes-5.2.rst b/documentation/migration-guides/release-notes-5.2.rst
index d583f3e9d..cbef0d686 100644
--- a/documentation/migration-guides/release-notes-5.2.rst
+++ b/documentation/migration-guides/release-notes-5.2.rst
@@ -302,6 +302,12 @@ New Features / Enhancements in |yocto-ver|
 
 -  BitBake changes:
 
+   -  Add a new concept of configuration fragment, which allows providing
+      configuration snippets contained in layers in a structured and controlled
+      way. For more information, see the
+      :ref:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata:\`\`addfragments\`\`
+      Directive` section of the BitBake User Manual.
+
    -  Add a new ``include_all`` directive, which can be used to include multiple
       files present in the same location in different layers.
 

-- 
2.47.0


