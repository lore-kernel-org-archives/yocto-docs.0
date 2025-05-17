Return-Path: <gavrosc@yahoo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CECCC2D0CD
	for <webhook@archiver.kernel.org>; Sat, 17 May 2025 14:48:58 +0000 (UTC)
Received: from sonic312-20.consmr.mail.bf2.yahoo.com (sonic312-20.consmr.mail.bf2.yahoo.com [74.6.128.82])
 by mx.groups.io with SMTP id smtpd.web10.12979.1747493331479371634
 for <docs@lists.yoctoproject.org>;
 Sat, 17 May 2025 07:48:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yahoo.com header.s=s2048 header.b=cWp6MQmM;
 spf=neutral (domain: yahoo.com, ip: 74.6.128.82, mailfrom: gavrosc@yahoo.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747493330; bh=pU0FVn23eQMwdruwRYM16xwGD3yQioz/mIVXzTTSK1E=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=cWp6MQmM8Fuz/JGpvfwnOC1MLJz83jiwfJ5yCnCt8DTsbA4lWbz8kmVdV29BllSyKtWKTbpqspguwxzBN6MrDKkb60FxJX91rUiJrQjEk1jZBFgJc8e1tif1bHpQZmBpySDlnhirv8gww96TqJlkpbdQCgDLb/M2fzPgnAn0QIOY7BvO1ZPjuTW2+1V0axhxWPVn6TKAzeGdgI4n83kbrxIIBDr7x9GrQNtfyHUkEWpWu2WGu4CaTWrvHLqHmbUV1tPfen4xg8L+Tlo/eQG3JN7JfZ0ShBBD6kptTf6Wxnk5crD+3hB1gz1WtXWohvYlSiCQcMEo8lFYlZmyc/Zsng==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747493330; bh=4jbo4h8b5yJNOY6JWSwMrUpZBmQ1beYq8RRMzXKe1nD=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=BzGV06RUDYv7RmkH5p4oKi4c5lgvwolcVxq5aEsJwo9nhkcrzpOftfap2x6VHh7FGj1zVt0lIvn2BU/jq5+soNHCxvDrkRElBtNcEk+axo6Mom3dQFdRi2uFR/m4tKh9w1zotoEFmUQZLwXNfjZU0imQxmW4t4oYe2JnI2a2/hbh3JVCqtfNj84jjzqVWdnTrJRR8HM4OiKNK1xJehH2HcSceD7nLeraWQn624NSjmuC4HjxVFNMTZ1/Hfcd+7uv4gvbv1UAkJ38foiABC0CVXVGwg6m1BfPY9u9+7z9ljsoblTBGMOcQobECQOLPMVuZYttwKjTnYGE/27QRXY4pw==
X-YMail-OSG: E0dbTpkVM1nL_8aWyqkUpRc.dbu_uJoNL5rFn1DHXP2UBFplTmn_cxIz1WYcywl
 q92lzqLykCefqZSnpVOO7dNSRohLy3HdVqKKwi1qgfm7..QnzQtGzSptevadoUgEn9WIx4nN5f92
 vgU4oziV7gDsDkwhjwNwKs9F9eqTQX_.Y25hRGGay7MnqkUw6XE.NYaM1ikHqOHsHkmtP_FGBuZl
 DTL36RHB7Y19WAuz1N6fbXkTDkExyd2q48aHR1bRIoCqPcVjx__WlvlMcBb.g.PAnfC6DIyYHvUG
 5YQLF8_utm6PS_JtMFV.OZ5ASMcB.VYpXtqGzxonZtE2bvgFtOFFY9pIDNQDiGNGotL9zT.72GLa
 5jHbAd1749y6qjrx_3O4RuIfkeS4FAj2edHBPHA2cb2v7woFfISW_NuaDAomo.frnObm_lVJQV4U
 Gm8rs2C1qCiy8Qe1FWVOxraakGKhzIvvhguPZIxNdv9ecpc5WFLD3BoJ.ziFTjfF6nocWlX4EuUJ
 rUo8yl0jQJZ59x_E_IAhT.w0oH_VO7_q1_IxUVoG0dkV9SyIqFIY.sAcP2RIH9rwl6EpG7AwXFDQ
 AalH7iWM1nsfBqaV0ygo2KAYxnEK_ViUcetgeOSSHBTPmxJS9sfAtvFT47ypvkncJHvJFUlL_Ro2
 SuogUgiLxTJSf9laVkNtm7QGcFwZlTKmfVzOURzeOArV5570LT6AIH48FjfdV9ZseSCGxDCYlwjO
 xmkMReMWWDLVjYwahpjjovhtGCi4fTzSyHKTbQ63V6GwRtVzvznzioWVPOCC.r2Enkqw7JQIDnOY
 .pH2XX96Rc1vDPOap6xjgJAyZt1LcZwcCPD0mK5oXoU90zTd9PqHnqfRU8PMxxzRX4Zkk2ONai.o
 21LRG1WdXNe_LVdWEFGIagTpdse3uobKDtMFWD.erUxivKAFR7lZ0oVBwj0_b2XNSb5kyv53iCOs
 dQIj7wab5U1K1hQg5JPA_cl2Yky0xKGDBV5V9g5DaNaDn8iV1Z4BajSwLbf_437ptYZ9OkbBTseM
 PNwyDBHlFSNhXrrXb5no8R8wi9NtXEvKU6RCyGBBEnU3jYXRw5SwMFtUQ2QqEGNjfVxaJtA26J9_
 IagBpVebQAvMoTJQqlgkONTQjZnkq05M.l5O7C4eSLVe9HV9WlpE3kMo6LEZa8Mgfzx3iKPPmzVs
 jCnmSonqoO1QYFESqKEW5zaV5bXPQy7GwyxAhl7d9pMYBVX6ErqtUfRIckVnBN619pMwmz5yyNPW
 BTx10ZmJCztRRK8n2yV6ajtPeJV9g9th7T9Sv1gKXbXDwpFSbMjb2nAnjeV337KGeqbk_lBqP5co
 nUmbqqpkU5zc3mNifjSe_9tootVUGCub1TtFkczSOAwAmyxMqrC3mFvwC_b4NikkIFAs5SDaWWGu
 Z.0j2qpOSbRu6Wxv.5JaEwFaNYgXukcyknf91sWwdm7mz_yaVY4SrgsWgnhdtWju039Ip.rttKkC
 5TTCu1fBdCdd.1Yy9wI5T51hIiIXwuoXph.FCib3ISQmcDHY8B8bFsn6BjvotSOnN8svMj_5Hj2n
 kIxjfY4MOmexbngGTBth3_pLYMKQ55k3D4pjYbmVODS6sp82lFnLMsnb4jJ6pMbOUmyv2Z5HFRdA
 8VbWWqOxThvtrPdRG1BiaAFFIkrkB6hnuf13aRf.GPwAeAsk8HfzRgSZpxKL3M_4.zo7REB017pp
 asre0BLFcauqkf4jdE1c7hsN0AUVw96AnzCMh23xAwjxHL.EeVI86qYllA6RA0SxV18ViCs5VFPt
 lwijpWknMiWviL5WQ5UgP9DuTIEQrnD252YvAs0G9Bi3WCZo_eIt.dWCIdIAlOH7yYRSbUzj8K7c
 CmdbeCCvd9h0DBLgVu6f1XFHtbNpw4tmHwoAxydAtzkcIxB8pWdqN0t0NmIYRZwG4p3MOeIBDr7Z
 ObL2YngfFyZpLhGMwqbuQ5o0fJBdvtpwwlTI.NSlQ4XCArA86fhZl58472YLS4Qfj56rwXb0BE1D
 oXwrVx0.aV1tty7yDiRoBD8FxereGcc9AV3q1sO1fwR1g5ez3lew6qFoGgl8OblIshzyOPfqz5PJ
 kU26y1Gf8WE1irIKN3oRMfEv7G9bFjWbBusbRPxtFzbyXZ3dJayC9EQi5h239oG.eMV6eBtyKUyx
 qPeRGFQn2TaVq7Hw4FH2_z12wqAxgh9w-
X-Sonic-MF: <gavrosc@yahoo.com>
X-Sonic-ID: 6c257fb6-3f47-4fec-a859-729e775dcf57
Received: from sonic.gate.mail.ne1.yahoo.com by sonic312.consmr.mail.bf2.yahoo.com with HTTP; Sat, 17 May 2025 14:48:50 +0000
Received: by hermes--production-ir2-858bd4ff7b-jwnh6 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 7e4bd75b9ffd5a8dd565b9683fa3ab7c;
          Sat, 17 May 2025 14:48:48 +0000 (UTC)
From: Christos Gavros <gavrosc@yahoo.com>
To: docs@lists.yoctoproject.org
Cc: Christos Gavros <gavrosc@yahoo.com>,
	Yoann Congal <yoann.congal@smile.fr>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Antonin Godard <antonin.godard@bootlin.com>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: [PATCH] ref-manual/variables.rst: document the IMAGE_ROOTFS_MAXSIZE variable
Date: Sat, 17 May 2025 16:48:45 +0200
Message-Id: <20250517144845.5384-1-gavrosc@yahoo.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250517144845.5384-1-gavrosc.ref@yahoo.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 17 May 2025 14:48:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6833

This variable specifies the maximum allowed size
of the generated image in kilobytes.

CC: Yoann Congal <yoann.congal@smile.fr>
CC: Randy MacLeod <randy.macleod@windriver.com>
CC: Antonin Godard <antonin.godard@bootlin.com>
CC: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Christos Gavros <gavrosc@yahoo.com>
---
 documentation/ref-manual/variables.rst | 30 +++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index d17f81036..75c74bc0e 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -4299,9 +4299,33 @@ system and gives an overview of their function and contents.
          IMAGE_ROOTFS_EXTRA_SPACE = "41943040"
 
    :term:`IMAGE_ROOTFS_MAXSIZE`
-      Defines the maximum size in Kbytes for the generated image. If the
-      generated image size is above that, the build will fail. It's a good
-      idea to set this variable for images that need to fit on a limited
+      Defines the maximum allowed size of the generated image in kilobytes.
+      The build will fail if the generated image size exceeds this value.
+
+      The generated image size undergoes several calculation steps before being
+      compared to :term:`IMAGE_ROOTFS_MAXSIZE`.
+      In the first step, the size of the directory pointed to by :term:`IMAGE_ROOTFS`
+      is calculated.
+      In the second step, the result from the first step is multiplied
+      by :term:`IMAGE_OVERHEAD_FACTOR`.
+      In the third step, the result from the second step is compared with
+      :term:`IMAGE_ROOTFS_SIZE`. The larger value of these is added to
+      :term:`IMAGE_ROOTFS_EXTRA_SPACE`.
+      In the fourth step, the result from the third step is checked for
+      a decimal part. If it has one, it is rounded up to the next integer.
+      If it does not, it is simply converted into an integer.
+      In the fifth step, the :term:`IMAGE_ROOTFS_ALIGNMENT` is added to the result
+      from the fourth step and "1" is subtracted.
+      In the sixth step, the remainder of the division between the result
+      from the fifth step and :term:`IMAGE_ROOTFS_ALIGNMENT` is subtracted from the
+      result of the fifth step. In this way, the result from the fourth step is
+      rounded up to the nearest multiple of :term:`IMAGE_ROOTFS_ALIGNMENT`.
+
+      Thus, if the :term:`IMAGE_ROOTFS_MAXSIZE` is set, is compared with the result
+      of the above calculations and is independent of the final image type.
+      No default value is set for :term:`IMAGE_ROOTFS_MAXSIZE`.
+
+      It's a good idea to set this variable for images that need to fit on a limited
       space (e.g. SD card, a fixed-size partition, ...).
 
    :term:`IMAGE_ROOTFS_SIZE`
-- 
2.34.1


