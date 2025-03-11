Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E271C282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 10:56:50 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.6274.1741690602378369448
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Mar 2025 03:56:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Q29sW9J1;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4E72443420;
	Tue, 11 Mar 2025 10:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741690600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GgQrenIa4MMGyb7RQvoih9icmEavUpP+AKnOUCIK3nI=;
	b=Q29sW9J1yZrlpUar6Uzd0QZRQ52uh9few3a1ni2vk/IGya87+8SLdTkHTMcEsAkdda4Thc
	olR4V12Wb/tI2O2EMfJw/EaTkRz/Mci8Hl/bK+TCIq3t0vE/H2T/O8jRNDoXCG6e3a+GRB
	HJiD1TCwM9lw2FP+dccXOZvrRBhcQCHDA58mh3wIQSL0EmYWo/2wNTwswbi9PxncXc39w6
	J5Wy1ksmnTdfCSefuotjHD4B5GoIRe6dVphVU1Ox7BXLjetQ1lJaQSbay/ZizT6a5qIAdz
	LWAYeNYicoNTHGPQp32AlYwx4zaRf8h0W7SrKTf4Vj1lBepgaef8hptqgPwTzQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 11 Mar 2025 11:56:35 +0100
Subject: [PATCH] migration-guides/release-notes-5.2: add known issue on
 stalled NVD
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-nvd-stalled-v1-1-f383ddcf3316@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAOIW0GcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDY0ND3byyFN3iksScnNQU3dQUS1NzSwvLVAPTRCWgjoKi1LTMCrBp0bG
 1tQCz78mYXQAAAA==
X-Change-ID: 20250311-nvd-stalled-ed957989e05a
To: docs@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2046;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=UR1sXEXBFXEULx6qtC4oVKXxA4g7pL2VTMOVlFAdRHU=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn0BbnpCi5hYFpWtnbHE/yflZHGGOQUetYkVAhg
 L4dN1L8zXSJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ9AW5wAKCRDRgEFAKaOo
 NkFPD/9LEknwV8bjOQ2foaDHcgd6hVJjN10CL0nR8PScm29/AAq7O6c0X8u6H7RyBafYz9xIvP6
 krPAq1OUugkCBoI2FzKOxKUhhBcdyg01pnetP7/GTmjtyAWK/qOYL1ti3a2trUBkZ7cP4nwkYow
 oKeURAX+yoj0oI4pipQhLsj/O5MmbXJ6UnmugMLOn5zgR4BX9YOMVRNZ+fb56zr2moGBLm+94aL
 Go6DJRLQ95+/AUWhWlL48J939spvIJpFSMGfdoj74/P1kfSzQ3SXG+LArPG8y44wAkQm6OSgNP4
 uLW1eFAQiln0tKSCn6rp9IGsSuvpd0sJw84VknsqoX/R9q1EsgHHi70NDzcALjHUQb2AAArnnz5
 zcaJu92uFBQJaMXfRK3lQ+on7fFWpMxSHWrrlQpd6Un482FqLxUe5jJe+50lQZ/59WSb29fPkAh
 Hf96WRBTrDS4WWkfEcPmI9LV8tfvRBFNDm72lpKfANYPmZhx0KJ3Fx4pqfgg/iOJHqt5OnrnAi0
 /zDZVO432MIaxpgSnjTQpkHgXchrRA56qTbV67BUzPLJnAF6IyqTJ7YDEw9TJtryvCGQw9vDDRq
 nY0CkxK6xNF12JvPscHoOApsAokFInKfyhcpNwmYSJVynE6CFFOfzOumdrOoli5jGCcGpCzaKkF
 +FIVOPB7M3bMVNQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -110
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvddvtdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlhcuvffnffculddquddtmdenucfjughrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejkeevvefhueejieeggfelgfehueeuhfejieetieeufefhgfelkeeiieegffefgeenucffohhmrghinhepnhhishhtrdhgohhvpdhgihhthhhusgdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprhhoshhsrdgsuhhrthhonhesr
 ghrmhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Mar 2025 10:56:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6530

Add an entry to the known issue as the NVD is not up-to-date, the
impact on current CVE reports and future plans for the Yocto Project.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/release-notes-5.2.rst | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/documentation/migration-guides/release-notes-5.2.rst b/documentation/migration-guides/release-notes-5.2.rst
index 417b202cdbb16d1ae6b95d8737b36f76a58cf6ef..eb8011a2797b1d3cc58514ffce01f0c8e7ab6f63 100644
--- a/documentation/migration-guides/release-notes-5.2.rst
+++ b/documentation/migration-guides/release-notes-5.2.rst
@@ -402,6 +402,23 @@ New Features / Enhancements in |yocto-ver|
 Known Issues in |yocto-ver|
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
+-  The current :ref:`ref-classes-cve-check` class is based on the `National
+   Vulnerability Database <https://nvd.nist.gov/>`__ (NVD). As some are aware
+   of, the NVD database has now been stalling for the past year and CVE entries
+   are missing the necessary information (:wikipedia:`CPEs
+   <Common_Platform_Enumeration>`) for the :ref:`ref-classes-cve-check` to
+   properly account for them. As a result, the current CVE reports may look good
+   but the reality is that some vulnerabilities are just not accounted for.
+
+   The Yocto Project team is working on a solution for the next release (October
+   2025). This solution should be based on SPDX version 3, which is already
+   implemented in the Yocto Project with the :ref:`ref-classes-create-spdx`
+   class.
+
+   The `CVE Project <https://github.com/CVEProject>`__ has been working on
+   catching up with the missing CPEs an so is a candidate for being a new input
+   for enumerating and classifying CVEs.
+
 Recipe License changes in |yocto-ver|
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 

---
base-commit: e608902ffae3af5ab0c5308b0550e49a790482f0
change-id: 20250311-nvd-stalled-ed957989e05a

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


