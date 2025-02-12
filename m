Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00F20C02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 08:52:05 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.10656.1739350292071726827
 for <docs@lists.yoctoproject.org>;
 Wed, 12 Feb 2025 00:51:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lpdxw2Tp;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B3D8A43410;
	Wed, 12 Feb 2025 08:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739350290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=byaqcJnGFgYwL7oLugXi3aE1LDguMjOW9ts/CWrm9lA=;
	b=lpdxw2Tp24skY7afHJsZHmgyjgbrP+uE2/DaO0IxqXX97JyKnYbaVSopRH+DqTUKn+tTcf
	d73iKNAjRhR7jHxIpYV6OsbzlE3/HBJmGTscHtfTd8et2XeIH7LvkDW3VOSbGRLkspGZV8
	OqC7zySsTO5kmmJc4ZQnshPmTt2ooyRW/0fZXIxACYgQ8qFCdNIFfWaP2plQW/QjDZflMO
	tC/pxhg4eKkQz01yol3+R0aZvnKYSbWqmTrMuWXBCCeflUNsSM0/CK5lHUfezN7GbK4lzm
	dqyW2CWpuLgjusNLOrjRQnnV2odn8dWIRWNcyvTCGVBFoYr+3iAzi6w9IYYajg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 12 Feb 2025 09:50:53 +0100
Subject: [PATCH] contributor-guide/submit-changes: add policy on AI
 generated code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-ai-policy-v1-1-c9cc7510e317@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAOxgrGcC/x3MQQqAIBBA0avIrBOcAYO6SrQQG2sgVBSiCO+et
 Hzw+S9ULsIVZvVC4UuqpNiBgwJ/uLizlq0byJA1hKSd6JxO8Y/2NI2IhIEsQu9z4SD3/1rW1j6
 m0ZxbWwAAAA==
X-Change-ID: 20250212-ai-policy-c2961121f251
To: docs@lists.yoctoproject.org
Cc: tsc <tsc@lists.openembedded.org>, 
 Yocto TSC <tsc@lists.yoctoproject.org>, 
 Richard Purdie <richard.purdie@linuxfoundation.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3488;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Q9dWzEzdSKy5ZUJL9/B0trrqI5yDByQYKKKn2+n6xXk=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnrGERAUAuyWMUlJCueg67K67BssPLFKpqeB3Q5
 YSJu455cCeJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ6xhEQAKCRDRgEFAKaOo
 NiFrD/48CzLFuINDyZuX2gQSfOCm12BMLjneeo8/LyZ61j7KKo2BCWBnw/rBIz5xofWZgVoJnys
 ilxpV+CEUNJJEE7OAzXvXOjvs3F0asth5W+3Qgexdnq35Q+uoOFnT+uIM2snXe5heFfRor1JvPs
 fGPGBdX3XuKiOqRSvwppVFiXBC9jpdaU4YnsX7kSpYnCPqQcsBryDgchfI9+Zs3g1Hbs1TYK8qE
 74Q6ulCVairTrzUtNeNVvbbmo5a4FnObdFypdoDLexmVv9neyo3HeLsnJ9qESHHKlxs++aUHG/4
 3tKR/RKFRe6z78XY2d95JcwYgWgkgW78o1Jl7W2WWtYfYXJIsVzXNdShAuYaFdweq3uUoJjK2l1
 eHdRnIYo+5ienATlV+pdUFQp8TAyFulpjk2jy2ipCAt3ZzpGTi1EoIAb7sh6YzuEqDwVF93hv1R
 zssl1WAQ0E4i2YySXEEnsfzhkAOXRVcwQzBFSTCGG0MPERt8U0eyEwtkA7or4Hfr94hjAfJvQY8
 prp0pGEfbITZqIdN/VziRsESMkpZnXJaqW5lrrszIuRD7CJ7YujETs+2D13hJURQasflG6IfFRM
 vghP3gDk0X33KvWgQy2/jD2vqiAEcpqGD6HsehbNEEkJs/bCrPCvy81iv/WD75BLQqg/LH8qjsX
 +LZ6jtsnDWNWjTA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegfeeggecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkffvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffefuddtgffhtdefleehvdfhteetgffhteeiffdtjefhgfehgeduvdfffeejffetnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdplhhinhhugihfohhunhgurghtihhonhdrohhrghdpuggvvhgvlhhophgvrhgtvghrthhifhhitggrthgvrdhorhhgnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhot
 hhlihhnrdgtohhmpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehtshgtsehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehtshgtsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 12 Feb 2025 08:52:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6350

Based on message by Richard Purdie on the yocto-docs list:
https://lists.yoctoproject.org/g/docs/message/6300

Re-formatted for the Yocto Project documentation syntax.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/contributor-guide/submit-changes.rst | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index 85ca987df..0675aac98 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -832,3 +832,52 @@ Other layers may have similar testing branches but there is no formal
 requirement or standard for these so please check the documentation for the
 layers you are contributing to.
 
+Acceptance of AI Generated Code
+===============================
+
+The Yocto Project and OpenEmbedded follow the guidance of the Linux Foundation
+in regards to the use of generative AI tools. See:
+https://www.linuxfoundation.org/legal/generative-ai.
+
+All of the existing guidelines in this document are expected to be followed,
+including in the :doc:`recipe-style-guide`, and contributing the changes with
+additional requirements to the items in section
+:ref:`contributor-guide/submit-changes:Implement and commit changes`.
+
+All AI Generated Code must be labeled as such in the commit message,
+prior to your ``Signed-off-by`` line. It is also strongly recommended,
+that any patches or code within the commit also have a comment or other
+indication that this code was AI generated.
+
+For example, here is a properly formatted commit message::
+
+   component: Add the ability to ...
+
+   AI-Generated: Uses GitHub Copilot
+
+   Signed-off-by: Your Name <your.name@domain>
+
+The ``Signed-off-by`` line must be written by you, and not the AI helper.
+As a reminder, when contributing a change, your ``Signed-off-by`` line is
+required and the stipulations in the `Developer's Statement of Origin
+1.1 <https://developercertificate.org/>`__ still apply.
+
+Additionally, you must stipulate AI contributions conform to the Linux
+Foundation policy, specifically:
+
+#. Contributors should ensure that the terms and conditions of the generative AI
+   tool do not place any contractual restrictions on how the tool's output can
+   be used that are inconsistent with the project's open source software
+   license, the project's intellectual property policies, or the Open Source
+   Definition.
+
+#. If any pre-existing copyrighted materials (including pre-existing open
+   source code) authored or owned by third parties are included in the AI tool's
+   output, prior to contributing such output to the project, the Contributor
+   should confirm that they have permission from the third party
+   owners -- such as the form of an open source license or public domain
+   declaration that complies with the project's licensing policies -- to use and
+   modify such pre-existing materials and contribute them to the project.
+   Additionally, the contributor should provide notice and attribution of such
+   third party rights, along with information about the applicable license
+   terms, with their contribution.

---
base-commit: 6eda443c7fcfeecebd6b44b96a1587c4bb093a34
change-id: 20250212-ai-policy-c2961121f251

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


