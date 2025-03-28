Return-Path: <gavrosc@yahoo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F28AC28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 20:53:24 +0000 (UTC)
Received: from sonic307-2.consmr.mail.bf2.yahoo.com (sonic307-2.consmr.mail.bf2.yahoo.com [74.6.134.41])
 by mx.groups.io with SMTP id smtpd.web10.332.1743195194620460013
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Mar 2025 13:53:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yahoo.com header.s=s2048 header.b=QA6vhkVF;
 spf=neutral (domain: yahoo.com, ip: 74.6.134.41, mailfrom: gavrosc@yahoo.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1743195193; bh=b+uhTAf6b4uPf7YdCp48Pm4iKUurFxlz3bdOyQ/JMJQ=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=QA6vhkVFk1TrC42FYy7W6pVY8jUa6DxX3RVbLfR1n8zQaPdZz//jRFT1iqVFSPNO64hyJ08Ce0jwHaDIrjzQwROCHJdsyxgGreQ+YAaEw7HHzzz7DUtOk6BSff0p/cRcB8cW7KTppnOHIsKOvlwE+BxzvFQsaOZUKRV35SJFbgyh6o0ir/dp89kwBmN95uSyxFgk0bJB3fGtpivSHq+prNwQEvajDso+75tUmr86ldcYgIev91nGkjHwsA+8IkT1EP19lyM+hpWyQfQAWV226Aoei5stkPlaD5+14dYL9N4EbK5DE4AKaHaTQEMXLzr4yRMASy1Jde2+ZDdUbY8eqw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1743195193; bh=oE3Rp/fvnIVWj5Fuvp9ugFNpFiKIQgeeT3eaQGidHa5=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=KBqNttFCcdI/NI4SUJqlTv3+ARTx82Apz5yICnBzaq+LYPGgNUp9jpjIub7Px0UgiNN3txGx8DgbaecnsXlgGei4TYNJQFCK2XC2FSRvX5Pyr/YsEssfyDC9MZ4D2qXpcJG9vGDWoHeOIl6pbYwiwNGcf//m9O3yg6iyvSZc9VYmsbnG/lpXuRBMOwnEJQ1mN3euTOCsnHB9sF71i0/UWe1R/CZRGDaMRXDiL8Csj57k3m1o2u9LlXZfVOJKYYG5s8KU9tbYjVVpbPSbcTHqX/I8OHgEQWzrJiVsk9U5cHLl5MFWJR7bYjyZSEEekDnLFbFDTIOUSx7v4ITqpbUviA==
X-YMail-OSG: RVJqRgwVM1lEfKUkuK2WeTxwFkwllDe49sjPtgB4dOfm_.rCfkHYP2TN5GZU3nN
 _dmug5YTPubtOI4eTYmiImCmbwTAUd6pL1aaEtnZuyudjdtLiRwKPoJBc3Ed2CoI5pHehObvjAyG
 mVRpGu5E8k_FEPULPFDaaD6rwrpgy4pa0ENixInBCpkGJKRdf1GZRFnrqCxPS43N7UI4tqL40C2O
 LtgZ2qj3HN9ft5avy8Umft.ImE8gQerzA2b.7y.CdDzC8iuYDQm2pRGSooy8Nb5cooNOldFjdM.O
 KZ.CkGj_6cTAAy66SuiCbvT8nM7MHe5lEIvZ8cGH8hNf_1nPOsjQU0vNBxSPvMwmwn9isUfaJI3D
 aRC17FX976bdE7XdY7HIL9k0pPi81ZMDfxMrLvJ.flAaH6ytYUyNSP.MdMpKGvj5cTaoyIAgR2no
 XZNb.0zZQC4mn7dL4Vxlyj833Gix.yUCKJzJqgpJ6VCHg0csOSNciRdn7KAankV9h_Qe_c0tJsBz
 lcWvfLtm7_WJF_EaZgSKWdmn2tVHxkMiUbbO9J9Q9SPo1QAy22zzkvI1nskDmr9MydKAH9Cu9SAT
 U60Ccby2kexPVe5CIGD_xODaTXVPJJFSFSV5kLhCbUVpFovSTfECaodPoxLwAhXV3XPExU_HcJn_
 yWzQ_3BvehhIvanof2h6POlNH5BmOWFdbUJeYdHtqEX.zHv_zmpmmGdWOzhKcShV4yWM3zK48gkb
 TT8X7W4lbXpA5tY_Y6ekSg1anJXNXkMgEAkBVEmtltPq8yGmgRXWv3tpyRVzcshLByoPoJeG5_ft
 22HSU6j.gf6r5KOAheoJsTchakvAprGKtcz_fzejZECRt7B77Wye6HhAm7k327uNFW6KYR5BC3Yw
 Ciz3z5mVqlX_318FNwecdiPUKlPh8YIlRe6teVgVwxr7ncpw89cIYcYjxQjKqIFCde_weivl_awj
 MukxhqI.PCt2FXHvSj4lQO_NCBxB2K6JMqf_gM.P0YEMDGv.NAOJQ2X9U_M5BOhqvAY0HC8oV6Qn
 y6JVOsa1LufqoeVYa9VWeFvEW5LFBcLtTF3YxB386MxdsNPZ57QA0OIB0QHmc4SgAR0b2PN8wCh1
 BixsOmhJClKr3t9vy_O7wENULSdLDW5yBS0kUcW7fXDvi1JZaSD2IsJdr1N6SVaFMrBqpcJyDdVX
 ew5eftZkOM97t4nCaQEYyFoNizc9oJuGNnW77RbrVxUMU1dimJdJu.men4Qx2NIGcrlZnrwLNUGM
 WJEsuoxHsiMRLkJrVkJKsfdg88DQENKayN7VOP2d3ZOQ4.wXXnLl.Ld4T2bNsEj89QA6xnfrQtjA
 gW6L5KDvf_G2iTLF3mI3UPyBoXmJQNTmqUx52qtSUTiigpqjY6kkHXNZkov8I9nlJs8zvtny5zqO
 odE4oLb.2r2a1tnp_eCO5LF8c6pd_cYxYs1BAuuW9o3WAQJI2dalC6SrstyiuCMOTJMImOXCFkib
 pSCZIUg4djJiXgbjsvWvwS4jdYDVGwUUXZwNCM5CWe0jANdRQO.Z1Rm0zbQ7xz3BUdHQCWj0b.DJ
 9vyw0VLUw7qbMkvljftUAwxWUFCj1QIBDesl0gIXU7urKpDLAl7TcFbXT5B2jxgWek0_j4mlihZW
 NxvgcRknMtChKFfnophtZe0EEPzUZzLHa5WF4OA5s.GRSJitLG4rp9L5.uduizq4Zg7HX0Kk5op8
 awRXERaoi.9RudMuYbYln0hFYTUEifBNLJ9Y83aorQGY8XKuH1DtqNl97GoaXEEXvVeSo3XpjosE
 hElDhv7Xa_vV.2OkQYv.dZhffV1KcHN.636MwsyBJAJtz31DT93EQvbYdCt432VxAz7wHmiiMkPu
 fEv65ivMajOqC749y4Hxxrdn1.1IJl53aKqlw1CRn_sKgkWGsQ6FjlXO0bnPWJADnmMtqPyfRi8k
 lPIQBydZlFbLZACCPwW0TnWJWUjBI0Jw.PwiHglZlgw28ku7eX5VJmzV2GOaIzKi.b2B0KgQzW2s
 .XCB502jTeCACiEFD_1KhhJbL0QTgl1tv9tkW_On4VeMdPJoZZZANB6nkWB_wMrQYuxCF161BMU1
 tzBDgPXOyleJfGC5h20lZf50Y1aA52GXwO7lWDbC01xevotEvn8BdCv0sy2dckpzYEEU2ZCuqPFm
 sgMLUQEV8FOhtUnaE_pCN_F7u0psOaQT5PxfYMvpjr5Ph_3RxJ4.XhSjkzYFx8M8kfydxH4yjYXb
 2ZmiXzMTEaXlLDhcz05R7C_2FMOJLyJLgOb.JNUA8q7CoiMyqKw.1sflrMnE-
X-Sonic-MF: <gavrosc@yahoo.com>
X-Sonic-ID: 2d3f2e48-1dd3-4f54-9779-1bafa1ed2f7f
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.bf2.yahoo.com with HTTP; Fri, 28 Mar 2025 20:53:13 +0000
Received: by hermes--production-ir2-54ff696c44-cj5g9 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 6b931475e34f83f1e2ee03ffdb27e0ac;
          Fri, 28 Mar 2025 20:53:10 +0000 (UTC)
From: Christos Gavros <gavrosc@yahoo.com>
To: docs@lists.yoctoproject.org
Cc: Christos Gavros <gavrosc@yahoo.com>,
	Yoann Congal <yoann.congal@smile.fr>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH] ref-manual/variables.rst: document the INITRAMFS_MAXSIZE variable
Date: Fri, 28 Mar 2025 21:52:13 +0100
Message-Id: <20250328205213.93625-1-gavrosc@yahoo.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250328205213.93625-1-gavrosc.ref@yahoo.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Mar 2025 20:53:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6681

This variable specifies the maximum allowed size
of the initramfs image in bytes.
Fixes [YOCTO #15797]

CC: Yoann Congal <yoann.congal@smile.fr>
CC: Randy MacLeod <randy.macleod@windriver.com>
CC: Antonin Godard <antonin.godard@bootlin.com>
Signed-off-by: Christos Gavros <gavrosc@yahoo.com>
---
 documentation/ref-manual/variables.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 62e339ed8..c9c042096 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -4474,6 +4474,13 @@ system and gives an overview of their function and contents.
       See the :term:`MACHINE` variable for additional
       information.
 
+   :term:`INITRAMFS_MAXSIZE`
+      Specifies the maximum allowed size of the initramfs image in bytes.
+      The build will fail in case the initramfs image size is bigger than
+      the value of this variable.
+      There is a week default value assignment (INITRAMFS_MAXSIZE ??= "131072" ) 
+      in bitbake.conf.
+
    :term:`INITRAMFS_MULTICONFIG`
       Defines the multiconfig to create a multiconfig dependency to be used by
       the :ref:`ref-classes-kernel` class.
-- 
2.34.1


