Return-Path: <daiane.angolini@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 444C8C5B572
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 20:28:19 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21792.1786739294256971188
 for <docs@lists.yoctoproject.org>;
 Fri, 14 Aug 2026 13:28:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=LErZsI6i;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: foundries.io, ip: 205.220.168.131, mailfrom: daiane.angolini@foundries.io)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EJgcBl3187446
	for <docs@lists.yoctoproject.org>; Fri, 14 Aug 2026 20:28:13 GMT
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g28sk09rr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <docs@lists.yoctoproject.org>; Fri, 14 Aug 2026 20:28:13 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbedf42f199so1563949a12.2
        for <docs@lists.yoctoproject.org>; Fri, 14 Aug 2026 13:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1786739293; x=1787344093; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DgeVmR2yA9aWNPYf+2UFUBqV6m0sQZAsFYQoY7vLeL8=;
        b=LErZsI6iD7I3F40I5ZslH/2T3Or95FtVf6kKEPCQWxCjJAyR2ZSakUJHi/Naq+Iwef
         kcMQuhqnFmzsLqN7fgQiCzDx9Go6M+UBFjNRpszdEa//RHWPIQSm3i2WFwYgY6QhenxJ
         dpfckEi8jgblPkEaohHJC7ljg2qQ3/ZqeIfkBzXpyfA49ZazgiPCrJO0DoXIppN5HyIh
         ogkBAhGs2iwIDS83FxFjSKX173XIUEBpQvsBk8U//8CIOYJSbVWRgdnM9j8DXb00yaIu
         YOYd9VYz7Nqw2CbRPqOc5Qf6Rjtj7aIHnjUV1+DjVze7Af80fNwsFoEjMfPEHJHvx1Ne
         A/SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786739293; x=1787344093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DgeVmR2yA9aWNPYf+2UFUBqV6m0sQZAsFYQoY7vLeL8=;
        b=ASM8ntsYlUShdQ8FnWQoZJEjYAVxIvz6ZgJcKpSERw9Xo71jodSNI0EPWjc93XaqDn
         cySdzJ8b3LzEeFFAjLn/ai6ePu0iEcmeJ/nqZcIrOkVlXnD16PK+3tDpN5CU+uwUfRM1
         4fxOaSsEtx63z/RXopDMl6AEj2TaiJZ0W0OAtzVFpIQIeismLKPZOwwetgH7QWuUvPmS
         1duuLkUbLmRccBqbOTNyYeeeJyhuQVemJRzqKdkX/ESyOhdHXDJHXn6grv70pLe0fNHx
         eGRfXhzOrVybqU+JCX7IWomf1qfjH66dZtZfGu6xeAWEpzd612K4EKYVDrQ15PrfYjyC
         vkfA==
X-Gm-Message-State: AOJu0Yy1tVBigFscqFHzCM1RoJZGGqW5+AAx7BNFdRp8wLdSvHPVJsiI
	Y/+YBLp3opPbDSikakUk6Bwsg2IYX8S8KtHDCfQc6fVquHXqb4af82SSWTtTbt7+bfPwAwAQYFX
	EEKA0ZSOpzewZydXOcGeck2IlVGTL/Jm9AEykHEMABSZ9mKCTVViXXI8muqQ5FBGu84d0u9Lp
X-Gm-Gg: AR+sD10dSvVrwtrJRcvZbSvFCj3ccI3HUwprwt83YjcnUVpVKH3IXUG1/TYtnrRF7u1
	4+ptWewuW4ZGK111tFeRbmhBkcNASstqFqzALAGsPrFPPps84O+WaiOx9GaeP7qCRxWEJAiBhK+
	PISmvXV95TQTwVjetpmVRZXuteebVWZbuOcrtiE/iDpiyPCtGd1D4DtQlgqCsyJe3eyLAPRNeIm
	mIgElTSaKA6Uh/juiHF2pdLvyEjn2wj3CrffQsxWhfjFgEOk9n9waDLylEfVMsi8ivOFwXbM+fA
	RRAJSXNbGR19+UFX5g9HABPx/CopIr/ti5bU+yV46cD+nyBS/dI39bB6Bb8mPqcULiXyn4We0vk
	3sfbQF1oc84+97Vx/Wqt4wzSipv8mddTQNqYbvfrm0QODYMot38PNUNX8S1DbTqgLFeCjhyxOfg
	==
X-Received: by 2002:a05:6a21:398a:b0:3cb:7b9d:9869 with SMTP id adf61e73a8af0-3cc71eb2977mr10307115637.35.1786739292650;
        Fri, 14 Aug 2026 13:28:12 -0700 (PDT)
X-Received: by 2002:a05:6a21:398a:b0:3cb:7b9d:9869 with SMTP id adf61e73a8af0-3cc71eb2977mr10307068637.35.1786739292193;
        Fri, 14 Aug 2026 13:28:12 -0700 (PDT)
Received: from lola.lan ([187.183.40.109])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ed5b1sm19500045c88.8.2026.08.14.13.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 13:28:11 -0700 (PDT)
From: Daiane Angolini <daiane.angolini@foundries.io>
X-Google-Original-From: Daiane Angolini <daiane.angolini@oss.qualcomm.com>
To: docs@lists.yoctoproject.org
Cc: daiane.angolini@foundries.io,
        Daiane Angolini <daiane.angolini@oss.qualcomm.com>
Subject: [PATCH] ref-manual/features.rst: fix some cross references
Date: Fri, 14 Aug 2026 17:28:00 -0300
Message-Id: <20260814202800.1106393-1-daiane.angolini@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LKxWhpW9 c=1 sm=1 tr=0 ts=6a7f7a5d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=PIITv4rVe324bgT4salBLw==:17
 a=Sv0fKeRqtYgA:10 a=9UA2AVYIz8kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=e5mUnYsNAAAA:8
 a=EUspDBNiAAAA:8 a=Il6FFNMaQZrZFH121DEA:9 a=x9snwWr2DeNwDh03kgHS:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: hzEklrxYlFInknKvDzIqzclrD-Cn_lai
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDE1NyBTYWx0ZWRfXwJ7DrR49QWCn
 C6Kc6MWWKf42b0RQVcsBkgykiK9abAZdHX0CMznSfdwk6QqFFt0bwXHCwKhnFC2ZQ+karcvIPeE
 T2zcu0FMq467IJ3V/ccbdtnmubbYlO4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDE1NyBTYWx0ZWRfXyNWhGk4RJGuU
 baefEi5oSNp795uurpjVQ4FqkCVeeoUf+nd/Ihb0h8XX2WgDni/9RGIq7Z1BFzLIxnftvFtT4iV
 1HHKuQv++/f4GgUVsUcqeEkX6yZrKm7QaBWuLsdEcTrurXDBZS+ZOr4qX6/iHtpMx1Vowf9qvdz
 tlu8YyqC8W1Vr1Z65g0uhCRCV7hlwEAtL/KxU6MV2r7g9xoPG1O/wTYA10n4zXlM8hEZhpSIzVi
 jg1NmqDdrlTUM4M91Io9MlBEQ7mQTvEGC8RMs3cCDfl5jnL7k1FmPwix1g4jzSdgqRaSc8opjQh
 oVkBqdAGbPwcLS7q/hmfYTEwQlkI/UOVIOTuBGk6xhjjIzXEGC4pAcrms5LPQ5/4vafbWTxgx0g
 b0lG2/DhktHbUk5X0w0rf3u+dkQe0juUAJgrV0YQGBWX7roH1KsBBhio8g+K7o6CwAGUXPffNbN
 9M5C7d5hGtV+KItZsyg==
X-Proofpoint-ORIG-GUID: hzEklrxYlFInknKvDzIqzclrD-Cn_lai
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 clxscore=1011 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140157
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 14 Aug 2026 20:28:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10291

The text does not match the cross reference, so change that.

Also, drop an extra colon.

Signed-off-by: Daiane Angolini <daiane.angolini@oss.qualcomm.com>
---
 documentation/ref-manual/features.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
index 63d47d6ec..4ee6e20c8 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -219,7 +219,7 @@ metadata, as extra layers can define their own:
 -  *ptest:* Enables building the package tests where supported by
    individual recipes. For more information on package tests, see the
    ":ref:`test-manual/ptest:testing packages with ptest`" section
-   in the Yocto Project Development Tasks Manual.
+   in the Yocto Project Test Environment Manual.
 
 -  *pulseaudio:* Include support for
    `PulseAudio <https://www.freedesktop.org/wiki/Software/PulseAudio/>`__.
@@ -334,7 +334,7 @@ The image features available for all images are:
 -  *read-only-rootfs:* Creates an image whose root filesystem is
    read-only. See the
    ":ref:`security-manual/read-only-rootfs:creating a read-only root filesystem`"
-   section in the Yocto Project Development Tasks Manual for more
+   section in the Yocto Project Security Manual for more
    information.
 
 -  *read-only-rootfs-delayed-postinsts:* when specified in conjunction
@@ -356,7 +356,7 @@ The image features available for all images are:
    different package name (or names) within the image recipe or at the
    distro configuration level.
 
--  *stateless-rootfs:*: specifies that the image should be created as
+-  *stateless-rootfs:* specifies that the image should be created as
    stateless - when using ``systemd``, ``systemctl-native`` will not
    be run on the image, leaving the image for population at runtime by
    systemd.
-- 
2.34.1


