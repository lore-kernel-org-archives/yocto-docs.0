Return-Path: <gavrosc@yahoo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7EADC3DA6D
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 10:20:31 +0000 (UTC)
Received: from sonic310-13.consmr.mail.bf2.yahoo.com (sonic310-13.consmr.mail.bf2.yahoo.com [74.6.135.123])
 by mx.groups.io with SMTP id smtpd.web10.17304.1747736427561933458
 for <docs@lists.yoctoproject.org>;
 Tue, 20 May 2025 03:20:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yahoo.com header.s=s2048 header.b=YquBtNYv;
 spf=neutral (domain: yahoo.com, ip: 74.6.135.123, mailfrom: gavrosc@yahoo.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747736426; bh=dSE9iVqyxI5GnhvaYN2m3b1r8olKzv20r0d/ep8C4Gk=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=YquBtNYvGBWEvKs2Zs8VXMS/q4IYCoTJKyVYxDmycUi0uT4Uj1jFFnhfN3suWg0ta2I845uc/TVztAXOdeg8Tp0gXZ1p569U6qEGoVqoASFZO1a5AdessHpWfDCwyKPxv5k9LJB48YSe3oWazHOEo6/KbO7jKAMuk+nL2019fGsn7E2eyGx5rCia/qO0usyvvunKZPTs06coOToyxTn4PZXEjMj3WnQBOheUorXoNSR7DU/+u2hKE2lpBPmuyiKLlzyD8cliW2njQmUOOSQoZox93iSiErX64C+3PTIiA2ACpekrgNTz12Z1k9yr6VX3yU5gEQVOcIrkElHSWht//g==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747736426; bh=VrTv6CCk/BBDDXJtQp7goHxdLEGugKWHq0f0NuF0CPB=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=YBC5wBxtGGG4yUCLdKKDQGcXYkHHoy3PYY/TecReK/y3MFTIn+4tej+UeLonIdAOoVMBqJfuwWkTUCZDXPdYvbn6nLUqIP8tctttuaxDIyQV6yqMKeaJfhqdoVjU0yWdTHvg1EfadjaVFW51FL7n/o7ijeSPp7Bmrp3m5K33O4duatdgdRnj3W/KXa6ygtlc2rlpQqVnPBJroHboRj/IJq5FHPrabX5/sTqsYJgBevJwgt4XRpjsKYrjJTipXgj59rGBmObdTUuz/aTBIqzB+D3+y12r/v64ywJuB+ZXNOIP2bkXASlZICy3yqflLtHxQ22LkLxxESDp+3kbzrFa3Q==
X-YMail-OSG: 4c3Sic4VM1lG_e6vTjpURZm85vNRH8MY3ceEFZjmyZJHD7LxKooUJSfvb5mVhuY
 l92iizaynGd0uzrMYgEzuBxSYwatZP.lXDXKfEAtxcY_qe9BM8YWWlHdH2C5O1ZK5jVY.uUmLoEe
 Hx_XjV_PwFiTh0yPX7DY3PmeV6j_YNx18n.tV5YLMOeojKxSy3l.v3ivBsrOIeTV23FpJeDjP0iD
 VXV4pJ9LVSIgXSZ0_9eQZstAeP8vC_dA98HKjUKT3.EIHcm6fbvFyx_h.6Dtrfc.A.IpK73_bv6W
 bfGgBLiFof.pk06WJmMUQimRvivDeRhoH8Bf4WeHilrL9qtuILvr6EyRpldrbw9admg8ZdjHFZHn
 _Pb6ym5Ilu1Q5bEBbTTUYMPS2W9O71vVis_iB.DrI_yWiXQceH7RpYOmpcQ_UPCJAQlLTtQ_kKDr
 gSw0ALEKXVaLJ2jrJ.IAJgzF8CeNcU6CTn2S4_oiOIA_wwzgOM5.Tfab2xrrYv0tZsrBH9EAAQWR
 sae7ScVRlz0utghXd3XjbHy4ROsIfXxSBJdg21P9PEKufpZ_vcYH8OsyYqd1bC9.UIApMAMes7qy
 xjkfWUsn.zGzpbBcuqg1OeyXY.88vVYupVI2WsMF_0pRXCwDxvywlrBetaiN1M8O6bRZVOj8QXdT
 TqsapPIqNlqDkAcoRxfaHG2YmbzbRv1HnAdeVr4TJKAsncS73GRQ2YhP9ZZCuKrwoPUpY1tLtQi0
 tVkMRV_IXfDgGPSrgf9HgTckpN6_rxZCFK1xT04cYyzpBXf3t0dYfTA4KvK3akmXi.gxgis7y7Ao
 ymqXtvq.iEn7nzX0M2oDg3gUnhnB23EYPSAZ8ZBjnD06ETZMc61weExufRX_nuDk8nGaA7MqZEQo
 Ss99BpIMoIf6swxsVXhQJTh_Q0IG5AJnB06PPLG6FF8PaYzzZADKYwmFHJfX3bxrheQpJA5n_kWF
 ns4sT9tTz.CRT6ZDl94cNFIdt.I5M_hyKKj.mO5i_P1P_tsyQQsVV1JDuakHeLFCmHyZl90KxUZf
 .oZEVP_dwDnIE20pHqEULXdKjJfryI5vlGTlzZSUT6HdbgkH3qdwiRUyTSV_EQj.x2xAmXabTdD3
 Ju0CqMsxXemQ6cC7_KKNclAeuy8cCjjbq_TOpe3oiKoA2uCC5kssjYwdd.hVg_ihknKx5iPPayNL
 LvKh6PCJCxcDDuWJN6_aEdpdP43yIDB6hAeJb1g6EZ1eK_z.0lpync_DhdJxRj0GneS2VQiVddvA
 g5CfpszmEE1ceevgxREdW2JV7ZS9JYwiLZL_4r7.hypESv1H1bE_v3FiVooQvj5DgyObIm78Snwe
 hRJaRv7rovQV8E6vREvuGXDYMfNgRXdtpTjtBaJhhZllXK6qJY9jEtjRD6283OwhLf4RlqJVu2Wv
 mPNcZ9rW3lzVs9fa2l8_e8Y6eHbREcTbC8yP3yiNsyajuMtH77htHNwC5xz0JGtwK_60OeDv9XbY
 EDBWx68wBf17qpehdKe3FsceFZ_8M5jU_eqtab7E86MZfWUfhWR1ybTMwMCZnCfginmzqp0xzUYq
 WNttYuvZJy09j5ebn62_8dPe3b2QErkl0v8deC5Ag8TIgU3fd3ImGUYtmpwKQ3wAr.VEL0oOXghM
 Pu4eIaBQalTycBYkZEduv0OMjsZrP11b1ooasr3CzzW3v7GvM0.._NkBDrf1osoN4SQAajMxW7XH
 fqyt3RfcFyL.3Hr7xunkszir3FTmPPhzE55hi0q_kuxv8SNpZrZmJDQmMuf8QLf9.s8Trd5hA3.j
 GhHLC6_OX9UQxn5wjddH8PrW6rUdmuNFdXA0z5.t.P5yC1zAnileALSM0wwKtYGbzljJQm.tRwR2
 DNO2.M4JCkVXfO_hdTG1SLgchbMLiXXPdZei3Ef7RXviBa07XhU2b7nTWWuS31e5Q5eZClJCdoN5
 qtAfzctmpwh9qFKychH3wTPDn.1IhsogU1IS3PfqIJ6byFuorASl04Q1VhBDzfe47sQg17ENQLgy
 gBVg0Ag2AWmVUZgouJJcn8GjnnUqof_j5D3qbjLgbE7_5v5h0sEKN.CqP8wKLTbX5i_97tJ3Aid3
 im11z.CwPNWhBKc6xUt10EhQkDhf7WU_L_9wJeFxOwzyezKIWSkenb2MekzxLmbTP_PRj0cMoCRY
 .1Yvi5KkDUEk1VNs6mpCbM9yOEYhT5ouBpNPV328h5n0HIqMxVFYNh5eo0Gw5zwPYw.V5yMMhhHQ
 _XsD4dLH0wCCcpA9QxRWos11628TynSrwatpQiVCia6nEJvy86VSRnYE6MqUWk7KwLw--
X-Sonic-MF: <gavrosc@yahoo.com>
X-Sonic-ID: 7fb0680c-e3d7-4d36-ae9d-abf51de299b1
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.bf2.yahoo.com with HTTP; Tue, 20 May 2025 10:20:26 +0000
Received: by hermes--production-ir2-858bd4ff7b-sxz22 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID d390abdcd7447f39c408279cb3e78543;
          Tue, 20 May 2025 10:20:24 +0000 (UTC)
From: Christos Gavros <gavrosc@yahoo.com>
To: docs@lists.yoctoproject.org
Cc: Christos Gavros <gavrosc@yahoo.com>,
	Yoann Congal <yoann.congal@smile.fr>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Antonin Godard <antonin.godard@bootlin.com>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: [PATCH v5] ref-manual/variables.rst: document the INITRAMFS_MAXSIZE variable
Date: Tue, 20 May 2025 12:19:52 +0200
Message-Id: <20250520101952.4951-1-gavrosc@yahoo.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250520101952.4951-1-gavrosc.ref@yahoo.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 20 May 2025 10:20:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6849

This variable specifies the maximum allowed size
of the initramfs image in Kbytes.
Fixes [YOCTO #15797]

CC: Yoann Congal <yoann.congal@smile.fr>
CC: Randy MacLeod <randy.macleod@windriver.com>
CC: Antonin Godard <antonin.godard@bootlin.com>
Signed-off-by: Christos Gavros <gavrosc@yahoo.com>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
---
v4->v5
* add Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/ref-manual/variables.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 643a3e7ae..3962be578 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -4708,6 +4708,20 @@ system and gives an overview of their function and contents.
       See the :term:`MACHINE` variable for additional
       information.
 
+   :term:`INITRAMFS_MAXSIZE`
+      Defines the maximum allowed size of the :term:`Initramfs` image in Kbytes.
+      The build will fail if the :term:`Initramfs` image size exceeds this value.
+
+      The :term:`Initramfs` image size undergoes several calculation steps before
+      being compared to :term:`INITRAMFS_MAXSIZE`.
+      These steps are the same as those used for :term:`IMAGE_ROOTFS_MAXSIZE`
+      and are described in detail in that entry.
+
+      Thus, :term:`INITRAMFS_MAXSIZE` is compared with the result of the calculations
+      and is independent of the final image type (e.g. compressed) .
+      A default value for :term:`INITRAMFS_MAXSIZE` is set in
+      :oe_git:`meta/conf/bitbake.conf </openembedded-core/tree/meta/conf/bitbake.conf>`.
+
    :term:`INITRAMFS_MULTICONFIG`
       Defines the multiconfig to create a multiconfig dependency to be used by
       the :ref:`ref-classes-kernel` class.
-- 
2.34.1


