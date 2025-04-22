Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB178C369D8
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 13:03:55 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.39275.1745327026764365867
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Apr 2025 06:03:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BV78iidm;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 85A0D43940;
	Tue, 22 Apr 2025 13:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745327024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ao7wIY8Y4nVlixidxGWGwwTT1x718OeO3pX6pDcch2w=;
	b=BV78iidm4cx6MeDf3tqs91eFGPpyObXDSSkLOUn5EMD8fXyby2LIsy6btSWMmPAvghuy7u
	z0rHjh6MqkyRqJvmaYUIz2OVUhoP8S1YRH2R6TKK0EvULRkLzvHTW0UYMOCMv8EzoPrBbu
	AQ8NsGfWeo0FSF0t3w9iEaThzNxXQ64iP7MAmw/1hvvk4q7eLnGVd4WNqw/JO043LKdzTu
	refWlg986yc+TVJjgPUlwrnM6TqurbCFLTlZN1B4+9vZ0+JWmBok0V40M/N49OvQNz33pu
	A91pvWdGzKjXjqEVNWddw4a2vB8VVS4Cx3Lpd/6aFiqXZ19K1yNOPWaOEGpiZw==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/2] Release note 5.2 fixes
Date: Tue, 22 Apr 2025 15:03:33 +0200
Message-Id: <20250422-release-note-5-2-cve-fixes-v1-0-1d3756fe2417@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKWTB2gC/x2MwQqDMBAFfyXs2YW4NWD7K8VDME9dKLFkiwiSf
 zf0OAwzFxmKwujlLio41HTPDfrO0bzFvII1NSbxEvwgwgUfRAPn/QcOLDwf4EVPGD9jenh4Gfs
 0Uht8C/6i9e+p1hvONaqzbAAAAA==
X-Change-ID: 20250422-release-note-5-2-cve-fixes-9ad30e0281d8
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Takayasu Ito <ypa.takayasu.ito@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=780;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=EhKVuDr5R8jekOd1+xMTALPUdVVYIKgiGkr3z+Wrx8I=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBoB5OwtTGjmbTdJ5FCBVuHavAPip/DxYqs0s+np
 +qu8PW223KJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaAeTsAAKCRDRgEFAKaOo
 Nmi9EACoLsiECJSYvjjxpYOk6deT3+MC6HWDRt9QgulJ607AwzNl8o/xQamggEc+pCrGgyUMHGF
 CYAHETm/Bb8j56j/vGDS3xG6St6jDsH4cbpqDGI3QUV8bKR8EOvT1URgivst4oXlvU0qG1JF2jI
 m1FNQ+RNJKSizMvOs9sUf44rjn1mdm9smuzpDX0wbW16+pRkac1XjVSNWvfNvZKflH6hwrGBPNK
 azdR42OpSoTIDhd0wzDxEAaH/qS1zZ1eQ9jFGlRpkF927V7EE/GJ/014ZwiJKAr9hTRdkIyhRe8
 thh0XaJUxa3sXj2RNWgf0zKFW/9Ve5JKHLXTiwGm0vEmXcImh1H3Vinfg/DfmHCn0K0rjG2m+pF
 PkRY77rfDJn1bhilKS/BjX5oFNKlo8n9XGsehgRJkApdjF2oTH19mS7IVI1hlgkFMZwpWZb/oaZ
 opEUOU0Wkzg/YnhdP8AXDx4Ua0PP3usm4tKccLTKc4XhBw8gUeAWn3QRsTA9knuuUZsKBtEOIJZ
 pit8PGuo39mz6aljSqmc81Ou7BIOTf6m3sOITUlJj6VJ9gWkdp76Qy6L9WzgbzQx0BgXv7z6Dpk
 3+7bV2OmNnMgHrwdbMOPzyCZYH3T6uJUf/nkmw4vdGfkhIXYUL/wCX7ej3JLrALElx8SF/O6GY3
 gBIcor79EpEeZ5w==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeefkedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtudeuhfelveehueevudefgedvtdfffeevleefuedtjeeuteelgeelvefftdejteenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefhedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohephihpr
 gdrthgrkhgrhigrshhurdhithhosehgmhgrihhlrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Apr 2025 13:03:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6769

Fix the gstreamer entries in the recipe upgrade section that were badly
formatted, and add missing CVEs as reported by Takayasu Ito on the list:
https://lore.kernel.org/r/5fc0d33e-4ba5-4f8d-80c2-c5c87be79680@gmail.com

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (2):
      migration-guides/release-notes-5.2.rst: fix badly formatted gstreamer entries
      migration-guides/release-notes-5.2.rst: add missing cves

 .../migration-guides/release-notes-5.2.rst         | 60 ++++++++++++----------
 1 file changed, 34 insertions(+), 26 deletions(-)
---
base-commit: 0e5a8682bc2c4bf0457f52c9eba7914c4df8515c
change-id: 20250422-release-note-5-2-cve-fixes-9ad30e0281d8

Best regards,
--
Antonin Godard <antonin.godard@bootlin.com>


